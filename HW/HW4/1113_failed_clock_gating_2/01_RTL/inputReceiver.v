module inputReceiver(
    input clk,
    input rst,
    input part_data_valid,
    input [7:0] part_data_in,
    output [127:0] received_128_bit_data,
    output reg received_data_valid
);
    //states
    reg[3:0] cuerrent_state, next_state;
    localparam STATE_START = 4'd0;
    localparam STATE_WORKING = 4'd1;
    

    //select the part to save
    reg[3:0] input_parts_counter_value; //from 0 to 15
    reg count_input_parts_counter;    //count input_parts_counter_value
    reg reset_input_parts_counter;    //reset input_parts_counter_value

    //save to input_parts_reg
    reg[7:0] input_parts_reg[0:15];  //16 parts of 8 bits = 128 bits
    reg save_to_input_parts_reg[0:15];   //save input to input_parts_reg[i] when counter == i and part_data_valid == 1
    reg[7:0] input_to_input_parts_reg[0:15];   //input to input_parts_reg[i] when counter == i


    //direct input parts data to corresponding register (input_parts_reg)
    always @(*) begin: input_parts
        integer  i;
        for(i=0; i<16; i=i+1) begin
            save_to_input_parts_reg[i] = (input_parts_counter_value == i); //when counter == i, save input to input_parts_reg[i]
            if(save_to_input_parts_reg[i])      //when selected to save, set the register input to be iot_in
                input_to_input_parts_reg[i] = part_data_in;
            else
                input_to_input_parts_reg[i] = 0; //else set to 0
        end
        
    end

    //control when to save the input parts data to input_parts_reg
    always @(posedge clk, posedge rst) begin: input_parts_sequential
        integer  i;
        if(rst) begin
            for(i=0; i<16; i=i+1) begin
                input_parts_reg[i] <= 0;  //set all to 0
            end
        end
        else begin
            for(i=0; i<16; i=i+1) begin
                if(save_to_input_parts_reg[i] && part_data_valid)  
                    input_parts_reg[i] <= input_to_input_parts_reg[i];  //save input to input_parts_reg[i] when counter == i and part_data_valid == 1
            end
        end  
    end


     //save the full 128 bits input
    reg save_to_input_128_reg_after_next_cycle; //save to input_128_reg in next cycle 
    reg save_to_input_128_reg; //when got all 16 parts, save to input_128_reg
    reg reset_input_128_reg;
    reg[127:0] input_128_reg;  //128 bits

    assign received_128_bit_data = input_128_reg; //output the 128 bits data
    // assign received_data_valid = save_to_input_128_reg; //output the valid signal


    //sequential part
    always @(posedge clk, posedge rst) begin
        if(rst) begin
            cuerrent_state <= STATE_START;
            input_parts_counter_value <= 4'd0;
            input_128_reg <= 128'd0;
            received_data_valid <= 1'b0;
            save_to_input_128_reg <= 1'b0;
        end
        else begin
            cuerrent_state <= next_state;

            save_to_input_128_reg <= save_to_input_128_reg_after_next_cycle;    
            received_data_valid <= save_to_input_128_reg;

            if(reset_input_parts_counter)
                input_parts_counter_value <= 4'd0;
            else if(count_input_parts_counter)
                input_parts_counter_value <= input_parts_counter_value + 4'd1;

            if(reset_input_128_reg)  //reset input_128_reg
                input_128_reg <= 128'd0;
            else if(save_to_input_128_reg) //save all 16 parts to input_128_reg
                input_128_reg <= {input_parts_reg[0], input_parts_reg[1], input_parts_reg[2], input_parts_reg[3], 
                                    input_parts_reg[4], input_parts_reg[5], input_parts_reg[6], 
                                    input_parts_reg[7], input_parts_reg[8], input_parts_reg[9], 
                                    input_parts_reg[10], input_parts_reg[11], input_parts_reg[12], 
                                    input_parts_reg[13], input_parts_reg[14], input_parts_reg[15]};    
        end
    end


    //FSM
    always @(*) begin

        //default
        next_state = cuerrent_state;

        //input reg counter control
        reset_input_parts_counter = 1'b0;
        count_input_parts_counter = 1'b0;

        //input 128 reg control
        reset_input_128_reg = 1'b0;
        save_to_input_128_reg_after_next_cycle = 1'b0;


        case(cuerrent_state)
            STATE_START: begin
                next_state = STATE_WORKING;
            end
            STATE_WORKING: begin
                if(part_data_valid) begin  //if current part data in is valid
                    count_input_parts_counter = 1'b1;  //count input_parts_counter_value
                    if(input_parts_counter_value == 4'd15) begin
                        save_to_input_128_reg_after_next_cycle = 1'b1;
                    end 
                end
                       
                
            end
            
        endcase
    end



endmodule