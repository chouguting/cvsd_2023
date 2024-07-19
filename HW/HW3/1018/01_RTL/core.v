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
	reg input_op_ready, input_data_ready, output_valid;
	reg[13:0] output_data, data_for_output;
	assign o_op_ready = input_op_ready; //input_op_ready = 1 when ready to receive op_mode
	assign o_in_ready = input_data_ready; //input_data_ready = 1 when ready to receive data
	assign o_out_valid = output_valid; //output_valid = 1 when output_data is valid
	assign o_out_data = output_data; //output_data is valid when output_valid = 1


	//sram
	reg[11:0] sram0_addr;
	reg[7:0] sram0_data_in;
	wire[7:0] sram0_data_out;
	reg sram0_chip_enable, sram0_write_enable;
	localparam SRAM_WEN_READ = 1;
	localparam SRAM_WEN_WRITE = 0;

	sram_4096x8 sram0(
		.Q(sram0_data_out),
   		.CLK(i_clk),
   		.CEN(sram0_chip_enable),
   		.WEN(sram0_write_enable),
   		.A(sram0_addr),
   		.D(sram0_data_in)
	);

	//states
	reg[4:0] current_state, next_state;
	localparam STATE_START = 5'd0;
	localparam STATE_WAIT = 5'd1;
	localparam STATE_READ_AND_SAVE_TO_SRAM = 5'd2;
	localparam STATE_WAIT_SRAM_SAVE = 5'd3;
	localparam STATE_OUTPUT_SRAM = 5'd28;
	localparam STATE_WAIT_SRAM_READ = 5'd29;

	//counter
	reg[11:0] counter0_value;
	reg count_counter0, reset_counter0; 

	always @(posedge i_clk or negedge i_rst_n) begin
		if(~i_rst_n) begin
			current_state <= STATE_START;
			output_data <= 0;
			counter0_value <= 0;
		end
		else begin
			current_state <= next_state;
			output_data <= data_for_output;
			if(reset_counter0) begin
				counter0_value <= 0;
			end
			else if(count_counter0) begin
				counter0_value <= counter0_value + 1;
			end
		end
	end


	//FSM
	always @(*) begin : FSM0
		//defaults
		next_state = current_state;

		//counter0 control
		count_counter0 = 0; //count_counter0 = 1 when counter0_value should be incremented
		reset_counter0 = 0; //reset_counter0 = 1 when counter0_value should be reset

		//outputs control
		input_op_ready = 0; //input_op_ready = 1 when ready to receive op_mode
		input_data_ready= 0;  //input_data_ready = 1 when ready to receive data
		output_valid = 0;  //output_valid = 1 when output_data is valid
		data_for_output = 0;  //output_data for next cycle

		//sram control
		sram0_chip_enable = 0; //sram0_chip_enable = 1 when sram0 is in standby mode
		sram0_write_enable = 1; //sram0_write_enable = 0 when sram0 is writing, 1 when reading
		sram0_addr = 0; //sram0_addr = address of sram0
		sram0_data_in = 0; //sram0_data_in = data to be written to sram0

		case (current_state)
			STATE_START: begin
				sram0_chip_enable = 1; //standby mode
				next_state = STATE_WAIT;
			end 
			STATE_WAIT: begin
				sram0_chip_enable = 1; //standby mode
				input_op_ready = 1;
				input_data_ready = 1;
				if(i_op_valid) begin  //if input data is valid
					case (i_op_mode)
						4'd0: begin //read to sram
							next_state = STATE_READ_AND_SAVE_TO_SRAM;
						end 
					endcase
				end
			end
			STATE_READ_AND_SAVE_TO_SRAM: begin
				input_data_ready = 1; //ready to receive data
				if(i_in_valid) begin //if input data is valid
					count_counter0 = 1; //increment counter0_value
					sram0_addr = counter0_value; //set sram0_addr to counter0_value
					sram0_write_enable = SRAM_WEN_WRITE; //write to sram0
					sram0_data_in = i_in_data; //set sram0_data_in to i_in_data
					if(counter0_value == 2047) begin
						reset_counter0 = 1; //reset counter0_value
						next_state = STATE_OUTPUT_SRAM; 
					end
					
					
				end
				
			end
			
			STATE_OUTPUT_SRAM: begin //for debugging
				count_counter0 = 1; //increment counter0_value
				sram0_addr = counter0_value; //set sram0_addr to counter0_value
				sram0_write_enable = SRAM_WEN_READ; //read from sram0
				data_for_output = sram0_data_out; //set data_for_output to sram0_data_out
				if(counter0_value == 2047) begin
					reset_counter0 = 1; //reset counter0_value
					next_state = STATE_WAIT; 
				end
			end
			// STATE_WAIT_SRAM_READ: begin
			// 	next_state = STATE_OUTPUT_SRAM;
			// 	sram0_chip_enable = 1; //standby mode
			// 	sram0_addr = counter0_value; //set sram0_addr to counter0_value
			// 	if(counter0_value == 2047) begin
			// 		reset_counter0 = 1; //reset counter0_value
			// 		next_state = STATE_WAIT; 
			// 	end
			// end
		endcase
		
	end




endmodule
