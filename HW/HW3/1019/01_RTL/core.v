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
	//outputs
	reg input_op_ready, input_data_ready, current_output_valid_result; //output of sram has to be delayed by 2 cycles
	reg last_output_valid_result, last_last_output_valid_result;
	reg[13:0] output_data, data_for_output;
	assign o_op_ready = input_op_ready; //input_op_ready = 1 when ready to receive op_mode
	assign o_in_ready = input_data_ready; //input_data_ready = 1 when ready to receive data
	assign o_out_valid = last_last_output_valid_result; //current_output_valid_result = 1 when output_data is valid
	assign o_out_data = output_data; //output_data is valid when current_output_valid_result = 1
	

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
	localparam STATE_OUTPUT_SRAM = 5'd29;


	//counter
	reg[11:0] counter0_value;
	reg count_counter0, reset_counter0; 

	reg[3:0] counter_x_value, counter_y_value;
	reg[4:0] counter_channel_value, last_counter_channel_value;
	reg count_counter_x, count_counter_y, count_counter_channel;
	reg reset_counter_x, reset_counter_y, reset_counter_channel;
	reg set_counter_x_to_1, set_counter_y_to_1;


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
			else if(count_counter_x) counter_x_value <= counter_x_value + 1;
			
			if(reset_counter_y) counter_y_value <= 0;
			else if(set_counter_y_to_1) counter_y_value <= 1;
			else if(count_counter_y) counter_y_value <= counter_y_value + 1;

			if(reset_counter_channel) counter_channel_value <= 0;
			else if(count_counter_channel) counter_channel_value <= counter_channel_value + 1;

			last_output_valid_result <= current_output_valid_result;
			last_last_output_valid_result <= last_output_valid_result;

		end
	end


	//FSM
	always @(*) begin : FSM0
		//defaults
		next_state = current_state;
		current_output_valid_result = 0;

		//mmu control
		mmu_write_x = 0; //x coordinate of sram to write to
		mmu_write_y = 0;  //y coordinate of sram to write to
		mmu_write_channel = 0; //channel of sram to write to
		mmu_write_data = 0; //data to write to sram
		mmu_write_enable = 0; //mmu_write_enable = 1 when write to sram
		mmu_read_x = 0; //x coordinate of sram to read from
		mmu_read_y = 0; //y coordinate of sram to read from
		mmu_read_bank = 0; //mmu_read_bank = 1 when read from second bank


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

		//outputs control
		input_op_ready = 0; //input_op_ready = 1 when ready to receive op_mode
		input_data_ready= 0;  //input_data_ready = 1 when ready to receive data
		current_output_valid_result = 0;  //current_output_valid_result = 1 when output_data is valid
		data_for_output = 0;  //output_data for next cycle

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
				input_data_ready = 1;
				next_state = STATE_WAIT_OP;
			end
			STATE_WAIT_OP: begin
				// input_op_ready = 1;
				//wait for op_mode
				input_data_ready = 1; //tell testbench ready to receive data
				if(i_op_valid) begin  //if input op is valid
					case (i_op_mode)
						4'd0: begin //read to sram
							next_state = STATE_READ_AND_SAVE_TO_SRAM;
							set_counter_x_to_1 = 1;
							set_counter_y_to_1 = 1;
							reset_counter_channel = 1;
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
								next_state = STATE_OUTPUT_SRAM; //if x=8, y=8, channel=31, input is finished
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
				data_for_output = sram_data[last_counter_channel_value]; //output data from sram
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
								next_state = STATE_READY;
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
			
			

		endcase
		
	end




endmodule
