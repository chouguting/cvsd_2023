module core (                       //Don't modify interface
	input         i_clk,
	input         i_rst_n,
	input         i_op_valid,
	input  [ 3:0] i_op_mode,
    output        o_op_ready,
	input         i_in_valid,
	input  [ 7:0] i_in_data,
	output        o_in_ready,
	output        o_out_valid,
	output [13:0] o_out_data
);

	//output mode
	reg output_mode;
	localparam OUTPUT_MODE_DIRECT = 1'b0; //for convolution engine (the engin has tanken care of the delay)
	localparam OUTPUT_MODE_DELAYED = 1'b1; //for display, the output has to be delayed by 2 cycles (due to the delay of sram)

	//outputs
	reg input_op_ready, input_data_ready, current_output_valid_result; //output of sram has to be delayed by 2 cycles
	reg last_output_valid_result, last_last_output_valid_result;
	reg[13:0] output_data, data_for_output;

	reg output_valid_direct;
	reg[13:0] output_data_direct;
	
	assign o_op_ready = input_op_ready; //input_op_ready = 1 when ready to receive op_mode
	assign o_in_ready = input_data_ready; //input_data_ready = 1 when ready to receive data
	assign o_out_data =  (output_mode == OUTPUT_MODE_DELAYED)? output_data : output_data_direct; //output_data is valid when current_output_valid_result = 1
	assign o_out_valid = (output_mode == OUTPUT_MODE_DELAYED)? last_last_output_valid_result : output_valid_direct; //current_output_valid_result = 1 when output_data is validassign o_out_data = (output_mode == OUTPUT_MODE_DELAYED)? output_data : output_data_direct; //output_data is valid when current_output_valid_result = 1
	// assign o_out_data =  output_data; //output_data is valid when current_output_valid_result = 1
	// assign o_out_valid = last_last_output_valid_result; //current_output_valid_result = 1 when output_data is validassign o_out_data = (output_mode == OUTPUT_MODE_DELAYED)? output_data : output_data_direct; //output_data is valid when current_output_valid_result = 1

	//MMU (Memory Management Unit)
	wire mmu_ready;
	reg [3:0] mmu_write_x, mmu_write_y;
	reg [4:0] mmu_write_channel;
	reg [7:0] mmu_write_data;
	reg mmu_write_enable;
	reg [3:0] mmu_read_x, mmu_read_y;
	reg mmu_read_bank;

	//connect to mmu
	wire[7:0] sram_data[0:15]; 

	memoryManagementUnit mmu0(
    	.i_clk(i_clk),
    	.i_rst_n(i_rst_n),
    	.o_ready(mmu_ready),
    	.i_write_x(mmu_write_x),
    	.i_write_y(mmu_write_y),
    	.i_write_channel(mmu_write_channel),
    	.i_write_data(mmu_write_data), 
    	.i_write_enable(mmu_write_enable),  //when i_write_enable = 1, write to sram
    	.i_read_x(mmu_read_x),
    	.i_read_y(mmu_read_y),
    	.i_read_bank(mmu_read_bank), //when i_read_bank = 1, read from second bank
    	.o_sram0_data(sram_data[0]), //15 srams
    	.o_sram1_data(sram_data[1]), 
    	.o_sram2_data(sram_data[2]),
    	.o_sram3_data(sram_data[3]),
    	.o_sram4_data(sram_data[4]),
    	.o_sram5_data(sram_data[5]),
    	.o_sram6_data(sram_data[6]),
    	.o_sram7_data(sram_data[7]),
    	.o_sram8_data(sram_data[8]),
    	.o_sram9_data(sram_data[9]),
    	.o_sram10_data(sram_data[10]),
    	.o_sram11_data(sram_data[11]),
    	.o_sram12_data(sram_data[12]),
    	.o_sram13_data(sram_data[13]),
    	.o_sram14_data(sram_data[14]),
    	.o_sram15_data(sram_data[15])
	);

	

	//states
	reg[4:0] current_state, next_state;
	localparam STATE_START = 5'd0;
	localparam STATE_WAIT_MMU = 5'd1;
	localparam STATE_READY = 5'd2;
	localparam STATE_WAIT_OP = 5'd3;
	localparam STATE_READ_AND_SAVE_TO_SRAM = 5'd4;
	localparam STATE_ORIGIN_RIGHT_SHIFT = 5'd5;
	localparam STATE_ORIGIN_LEFT_SHIFT = 5'd6;
	localparam STATE_ORIGIN_UP_SHIFT = 5'd7;
	localparam STATE_ORIGIN_DOWN_SHIFT = 5'd8;
	localparam STATE_SCALE_DOWN_CHANNEL_WINDOW = 5'd9;
	localparam STATE_SCALE_UP_CHANNEL_WINDOW = 5'd10;
	localparam STATE_DISPLAY = 5'd11;
	localparam STATE_CONVOLUTION = 5'd12;
	

	localparam STATE_FINISH_ROUND = 5'd28;
	localparam STATE_OUTPUT_SRAM = 5'd29;


	//counter
	reg[11:0] counter0_value;
	reg count_counter0, reset_counter0; 

	reg[3:0] counter_x_value, counter_y_value;
	reg[4:0] counter_channel_value, last_counter_channel_value;
	reg count_counter_x, count_counter_y, count_counter_channel;
	reg reset_counter_x, reset_counter_y, reset_counter_channel;
	reg set_counter_x_to_1, set_counter_y_to_1;
	reg set_counter_x_to_origin, set_counter_y_to_origin;


	//origin register for display, convolution, and median filter
	reg[3:0] origin_x, origin_y;
	reg reset_origin_x, reset_origin_y;
	reg increase_origin_x, increase_origin_y;
	reg decrease_origin_x, decrease_origin_y;

	//channel window for display , convolution, and median filter
	localparam CHANNEL_WINDOW_32 = 2'd2;
	localparam CHANNEL_WINDOW_16 = 2'd1;
	localparam CHANNEL_WINDOW_8 = 2'd0;
	reg[1:0] channel_window;
	reg reset_channel_window;
	reg scale_up_channel_window, scale_down_channel_window;


	//convolution engine
	wire conv_engine_ready, conv_engine_finished;
	wire conv_engine_output_valid;
	wire[13:0] conv_engine_output_data;
	wire [3:0] conv_engine_mmu_x_index, conv_engine_mmu_y_index;
	wire[4:0] conv_engine_mmu_channel_index;

	reg conv_engine_start_trigger;
	convolutionEngine convEngin0(
    	.i_clk(i_clk),
    	.i_rst_n(i_rst_n),
    	.i_start(conv_engine_start_trigger),
    	.o_ready(conv_engine_ready),
    	.o_finished(conv_engine_finished),
    	.o_output_valid(conv_engine_output_valid),
    	.o_output_data(conv_engine_output_data),
    	.i_origin_x(origin_x), //x coordinate of origin
    	.i_origin_y(origin_y), //y coordinate of origin
    	.i_channel_window(channel_window), //control the depth of convolution, 0: 8 channels, 1: 16 channels, 2: 32 channels
    	.o_mmu_x_index(conv_engine_mmu_x_index),
    	.o_mmu_y_index(conv_engine_mmu_y_index),
    	.o_mmu_channel_index(conv_engine_mmu_channel_index),
    	.i_sram0_input(sram_data[0]),
    	.i_sram1_input(sram_data[1]),
    	.i_sram2_input(sram_data[2]),
    	.i_sram3_input(sram_data[3]),
    	.i_sram4_input(sram_data[4]),
    	.i_sram5_input(sram_data[5]),
    	.i_sram6_input(sram_data[6]),
    	.i_sram7_input(sram_data[7]),
    	.i_sram8_input(sram_data[8]),
    	.i_sram9_input(sram_data[9]),
    	.i_sram10_input(sram_data[10]),
    	.i_sram11_input(sram_data[11]),
    	.i_sram12_input(sram_data[12]),
    	.i_sram13_input(sram_data[13]),
    	.i_sram14_input(sram_data[14]),
    	.i_sram15_input(sram_data[15]) 
	);



	always @(posedge i_clk or negedge i_rst_n) begin
		if(~i_rst_n) begin
			current_state <= STATE_START;
			output_data <= 0;
			counter0_value <= 0;
			counter_x_value <= 0;
			counter_y_value <= 0;
			counter_channel_value <= 0;
			last_last_output_valid_result <= 0;
			last_output_valid_result <= 0;
			last_counter_channel_value <= 0;

			origin_x <= 1;
			origin_y <= 1;
			channel_window <= CHANNEL_WINDOW_32;
		end
		else begin
			current_state <= next_state;
			output_data <= data_for_output;
			last_counter_channel_value <= counter_channel_value;
			if(reset_counter0) begin
				counter0_value <= 0;
			end
			else if(count_counter0) begin
				counter0_value <= counter0_value + 1;
			end

			if(reset_counter_x) counter_x_value <= 0;
			else if(set_counter_x_to_1) counter_x_value <= 1;
			else if(set_counter_x_to_origin) counter_x_value <= origin_x;
			else if(count_counter_x) counter_x_value <= counter_x_value + 1;
			
			if(reset_counter_y) counter_y_value <= 0;
			else if(set_counter_y_to_1) counter_y_value <= 1;
			else if(set_counter_y_to_origin) counter_y_value <= origin_y;
			else if(count_counter_y) counter_y_value <= counter_y_value + 1;

			if(reset_counter_channel) counter_channel_value <= 0;
			else if(count_counter_channel) counter_channel_value <= counter_channel_value + 1;

			last_output_valid_result <= current_output_valid_result;
			last_last_output_valid_result <= last_output_valid_result;

			if(reset_origin_x) origin_x <= 1;
			else if(increase_origin_x && origin_x!= 7) origin_x <= origin_x + 1; //x vales from 1 to 7
			else if(decrease_origin_x && origin_x!= 1) origin_x <= origin_x - 1; 

			if(reset_origin_y) origin_y <= 1;
			else if(increase_origin_y && origin_y!= 7) origin_y <= origin_y + 1; //y vales from 1 to 7
			else if(decrease_origin_y && origin_y!= 1) origin_y <= origin_y - 1;

			if(reset_channel_window) channel_window <= CHANNEL_WINDOW_32;
			else if(scale_up_channel_window && channel_window != CHANNEL_WINDOW_32) channel_window <= channel_window + 1;
			else if(scale_down_channel_window && channel_window != CHANNEL_WINDOW_8) channel_window <= channel_window - 1;
			

		end
	end


	//FSM
	always @(*) begin : FSM0
		//defaults
		next_state = current_state;
		current_output_valid_result = 0;
		output_mode = OUTPUT_MODE_DELAYED;

		//outpts
		output_data_direct = 0;
		output_valid_direct = 0;

		//mmu control
		mmu_write_x = 0; //x coordinate of sram to write to
		mmu_write_y = 0;  //y coordinate of sram to write to
		mmu_write_channel = 0; //channel of sram to write to
		mmu_write_data = 0; //data to write to sram
		mmu_write_enable = 0; //mmu_write_enable = 1 when write to sram
		mmu_read_x = 0; //x coordinate of sram to read from
		mmu_read_y = 0; //y coordinate of sram to read from
		mmu_read_bank = 0; //mmu_read_bank = 1 when read from second bank

		//convolution engine control
		conv_engine_start_trigger = 0; //conv_engine_start_trigger = 1 when start convolution


		//counter0 control
		count_counter0 = 0; //count_counter0 = 1 when counter0_value should be incremented
		reset_counter0 = 0; //reset_counter0 = 1 when counter0_value should be reset

		count_counter_x = 0; //count_counter_x = 1 when counter_x_value should be incremented
		count_counter_y = 0; //count_counter_y = 1 when counter_y_value should be incremented
		count_counter_channel = 0; //count_counter_channel = 1 when counter_channel_value should be incremented

		reset_counter_x = 0; //reset_counter_x = 1 when counter_x_value should be reset
		reset_counter_y = 0; //reset_counter_y = 1 when counter_y_value should be reset
		reset_counter_channel = 0; //reset_counter_channel = 1 when counter_channel_value should be reset

		set_counter_x_to_1 = 0; //set_counter_x_to_1 = 1 when counter_x_value should be set to 1
		set_counter_y_to_1 = 0; //set_counter_y_to_1 = 1 when counter_y_value should be set to 1

		set_counter_x_to_origin = 0; //set_counter_x_to_origin = 1 when counter_x_value should be set to origin_x
		set_counter_y_to_origin = 0; //set_counter_y_to_origin = 1 when counter_y_value should be set to origin_y

		//outputs control
		input_op_ready = 0; //input_op_ready = 1 when ready to receive op_mode
		input_data_ready= 0;  //input_data_ready = 1 when ready to receive data
		current_output_valid_result = 0;  //current_output_valid_result = 1 when output_data is valid
		data_for_output = 0;  //output_data for next cycle

		//origin control
		reset_origin_x = 0;
		reset_origin_y = 0;
		increase_origin_x = 0;
		increase_origin_y = 0;
		decrease_origin_x = 0;
		decrease_origin_y = 0;

		//channel window
		reset_channel_window = 0;
		scale_down_channel_window = 0;
		scale_up_channel_window = 0;
		


		case (current_state)
			STATE_START: begin
				next_state = STATE_WAIT_MMU; //wait for mmu to be ready
			end 
			STATE_WAIT_MMU: begin
				if(mmu_ready) begin //if mmu is ready
					next_state = STATE_READY; //ready to receive op_mode and data
				end
			end
			STATE_READY: begin
				input_op_ready = 1; //tell testbench ready to receive op_mode
				next_state = STATE_WAIT_OP;
			end
			STATE_WAIT_OP: begin
				// input_op_ready = 1;
				//wait for op_mode
				if(i_op_valid) begin  //if input op is valid
					case (i_op_mode)
						4'd0: begin //read to sram
							next_state = STATE_READ_AND_SAVE_TO_SRAM;
							set_counter_x_to_1 = 1;
							set_counter_y_to_1 = 1;
							reset_counter_channel = 1;
							input_data_ready = 1; //tell testbench ready to receive data

						end 
						4'd1: begin //origin right shift, x value increase
							next_state = STATE_ORIGIN_RIGHT_SHIFT;
						end
						4'd2: begin //origin left shift, x value decrease
							next_state = STATE_ORIGIN_LEFT_SHIFT;
						end
						4'd3: begin //origin up shift, y value increase
							next_state = STATE_ORIGIN_UP_SHIFT;
						end
						4'd4: begin //origin down shift, y value decrease
							next_state = STATE_ORIGIN_DOWN_SHIFT;
						end
						4'd5: begin //scale down channel window
							next_state = STATE_SCALE_DOWN_CHANNEL_WINDOW;
						end
						4'd6: begin //scale up channel window
							next_state = STATE_SCALE_UP_CHANNEL_WINDOW;
						end
						4'd7: begin //display
							next_state = STATE_DISPLAY;
							set_counter_x_to_origin = 1;
							set_counter_y_to_origin = 1;
							reset_counter_channel = 1;
						end
						4'd8: begin //convolution
							if(conv_engine_ready) begin
								next_state = STATE_CONVOLUTION;
								conv_engine_start_trigger = 1;
							end
							else 
								next_state = STATE_READY;
						end
						4'd10: begin //display RAM
							next_state = STATE_OUTPUT_SRAM;
						end
					endcase
				end
			end
			STATE_READ_AND_SAVE_TO_SRAM: begin
				input_data_ready = 1; //tell testbench ready to receive data
				//write to sram 
				if(i_in_valid) begin //if input data is valid
					mmu_write_x = counter_x_value;
					mmu_write_y = counter_y_value;
					mmu_write_channel = counter_channel_value;
					mmu_write_data = i_in_data;
					mmu_write_enable = 1;

					if(counter_x_value == 8) begin
						if(counter_y_value == 8) begin
							if(counter_channel_value == 31) begin
								next_state = STATE_FINISH_ROUND; //if x=8, y=8, channel=31, input is finished
								//reset counter
								set_counter_x_to_1 = 1;
								set_counter_y_to_1 = 1;
								reset_counter_channel = 1;
								reset_counter0 = 1;
							end
							else begin
								count_counter_channel = 1; //if channel<31, increment channel
								set_counter_y_to_1 = 1; //if y=8, set y to 1
								set_counter_x_to_1 = 1; //if x=8, set x to 1
							end
							
						end
						else begin
							count_counter_y = 1; //if y<8, increment y
							set_counter_x_to_1 = 1; //if x=8, set x to 1
						end
					end
					else begin
						count_counter_x = 1; //if x<8, increment x
					end
				end
			end
			STATE_OUTPUT_SRAM: begin
				mmu_read_x = counter_x_value;
				mmu_read_y = counter_y_value;
				mmu_read_bank = counter0_value; //read from first bank
				data_for_output = {6'b0,sram_data[last_counter_channel_value]}; //output data from sram
				current_output_valid_result = 1; //output data is valid

				if(counter_x_value == 8) begin
					if(counter_y_value == 8) begin
						if(counter_channel_value == 15) begin
							// next_state = STATE_READY; //if x=8, y=8, channel=31, input is finished
							
							if(counter0_value == 1) begin
								count_counter0 = 1;
							end
							else if(counter0_value == 2) begin
								//reset counter
								current_output_valid_result = 0;
								next_state = STATE_FINISH_ROUND;
								set_counter_x_to_1 = 1;
								set_counter_y_to_1 = 1;
								reset_counter_channel = 1;
								reset_counter0 = 1;
							end
							else begin
								set_counter_x_to_1 = 1;
								set_counter_y_to_1 = 1;
								reset_counter_channel = 1;
								count_counter0 = 1;
							end
						end
						else begin
							count_counter_channel = 1; //if channel<31, increment channel
							set_counter_y_to_1 = 1; //if y=8, set y to 1
							set_counter_x_to_1 = 1; //if x=8, set x to 1
						end
						
					end
					else begin
						count_counter_y = 1; //if y<8, increment y
						set_counter_x_to_1 = 1; //if x=8, set x to 1
					end
				end
				else begin
					count_counter_x = 1; //if x<8, increment x
				end

				
			end
			STATE_ORIGIN_RIGHT_SHIFT: begin
				//origin right shift, increase x value
				increase_origin_x = 1;
				next_state = STATE_FINISH_ROUND;
			end
			STATE_ORIGIN_LEFT_SHIFT: begin
				//origin left shift, decrease x value
				decrease_origin_x = 1;
				next_state = STATE_FINISH_ROUND;
			end
			STATE_ORIGIN_UP_SHIFT: begin
				//origin up shift, decrease y value
				decrease_origin_y = 1;
				next_state = STATE_FINISH_ROUND;
			end
			STATE_ORIGIN_DOWN_SHIFT: begin
				//origin down shift, increase y value
				increase_origin_y = 1;
				next_state = STATE_FINISH_ROUND;
			end
			STATE_SCALE_DOWN_CHANNEL_WINDOW: begin
				//scale down channel window
				scale_down_channel_window = 1;
				next_state = STATE_FINISH_ROUND;
			end
			STATE_SCALE_UP_CHANNEL_WINDOW: begin
				//scale up channel window
				scale_up_channel_window = 1;
				next_state = STATE_FINISH_ROUND;
			end
			STATE_DISPLAY: begin
				mmu_read_x = counter_x_value; //read from sram
				mmu_read_y = counter_y_value;
				mmu_read_bank = counter0_value; //read from first bank
				data_for_output = {6'b0, sram_data[last_counter_channel_value]}; //output data from sram(x,y,channel)
				current_output_valid_result = 1; //output data is valid

				if(counter_x_value == origin_x+1) begin //x: origin_x to origin_x+1
					if(counter_y_value == origin_y+1) begin //y: origin_y to origin_y+1
						if(channel_window == CHANNEL_WINDOW_8) begin //if channel_window = 8, display 8 channels
							if(counter_channel_value==7) begin //channel: 0 to 7
								if(counter0_value == 0) begin
									count_counter0 = 1; //wait for a cycle, the last data result would showed up in next cycle
								end
								else begin
									//reset counter
									current_output_valid_result = 0; //the output data already showed up , current indexed result is irrelevant
									next_state = STATE_FINISH_ROUND; //finish this round
									//reset counters
									set_counter_x_to_1 = 1; 
									set_counter_y_to_1 = 1;
									reset_counter_channel = 1;
									reset_counter0 = 1;
								end
							end
							else begin
								count_counter_channel = 1; //if channel<7, increment channel
								set_counter_y_to_origin = 1; //if y=8, set y to origin
								set_counter_x_to_origin = 1; //if x=8, set x to origin
							end
							
						end
						else if(channel_window == CHANNEL_WINDOW_16) begin //if channel_window = 16, display 16 channels
							//TODO: finish display
							if(counter_channel_value==15) begin //channel: 0 to 15
								if(counter0_value == 0) begin
									count_counter0 = 1; //wait for a cycle, the last data result would showed up in next cycle
								end
								else begin
									//reset counter
									current_output_valid_result = 0; //the output data already showed up , current indexed result is irrelevant
									next_state = STATE_FINISH_ROUND; //finish this round
									//reset counters
									set_counter_x_to_1 = 1; 
									set_counter_y_to_1 = 1;
									reset_counter_channel = 1;
									reset_counter0 = 1;
								end
							end
							else begin
								count_counter_channel = 1; //if channel<7, increment channel
								set_counter_y_to_origin = 1; //if y=8, set y to origin
								set_counter_x_to_origin = 1; //if x=8, set x to origin
							end
						end
						else begin //channel_window == CHANNEL_WINDOW_32
							if(counter_channel_value == 15) begin //channel: 0 to 15 for bank0 and bank1, tatol 32 channels
								// next_state = STATE_READY; //if x=8, y=8, channel=31, input is finished
								
								if(counter0_value == 1) begin //if last bank
									count_counter0 = 1; //wait for a cycle, the last data result would showed up in next cycle
								end
								else if(counter0_value == 2) begin
									//wait another cycle, the last data would be output in next cycle
									//reset counter
									current_output_valid_result = 0; //the output data already showed up , current indexed result is irrelevant
									next_state = STATE_FINISH_ROUND; //finish this round
									//reset counters
									set_counter_x_to_1 = 1;
									set_counter_y_to_1 = 1;
									reset_counter_channel = 1;
									reset_counter0 = 1;
								end
								else begin
									set_counter_x_to_origin = 1; //if x=8, set x to origin_x
									set_counter_y_to_origin = 1; //if y=8, set y to origin_y
									reset_counter_channel = 1; //reset channel
									count_counter0 = 1; //count counter0 to select next bank
								end
							end
							else begin
								count_counter_channel = 1; //if channel<31, increment channel
								set_counter_y_to_origin = 1; //if y=8, set y to origin
								set_counter_x_to_origin = 1; //if x=8, set x to origin
							end
							
						end
						
						
					end
					else begin
						count_counter_y = 1; //if y<origin_y+1, increment y
						set_counter_x_to_origin = 1; //if x=8, set x to origin
					end
				end
				else begin
					count_counter_x = 1; //if x<origin_x+1, increment x
				end
			end
			STATE_CONVOLUTION: begin
				output_mode = OUTPUT_MODE_DIRECT;
				mmu_read_x = conv_engine_mmu_x_index;
				mmu_read_y = conv_engine_mmu_y_index;
				mmu_read_bank = (conv_engine_mmu_channel_index == 16);
				output_data_direct = conv_engine_output_data;
				output_valid_direct = conv_engine_output_valid;
				if(conv_engine_finished) begin
					next_state = STATE_FINISH_ROUND;
				end
			end
			STATE_FINISH_ROUND: begin
				next_state = STATE_READY;
			end
		endcase
		
	end




endmodule
