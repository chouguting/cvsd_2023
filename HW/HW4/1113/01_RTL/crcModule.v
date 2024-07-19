module crcModule (
    input clk,
    input rst,
    input [127:0] data_in,
    input crc_start,
    output reg[127:0] crc_out_data,
    output reg crc_out_valid
);

    //states
    reg[1:0] current_state, next_state;
    localparam STATE_START = 2'd0;
    localparam STATE_WAIT = 2'd1;
    localparam STATE_CALCULATE_CRC = 2'd2;


    //round counter
    //there are 131 bits to calculate
    //we need celling(131/9) = 15 rounds
    reg[3:0] crc_round_counter;
    reg reset_crc_round_counter;
    reg count_crc_round_counter;


    //the generator polynomial is x^3 + x + 1
    //we need to calculate the result of 128+3 = 131 bits

    //we calculate 9 bits at a time
    //input data for first iteration
    wire[8:0] crc_unit_data_in_first_iteration;
    assign crc_unit_data_in_first_iteration = data_in[127:119];

    //saved data for second iteration and so on
    //we need to save 131 - 9 = 122 bits
    reg[121:0] saved_data_reg;
    reg reset_saved_data_reg;
    reg save_to_saved_data_reg;
    reg left_shift_9bit_saved_data_reg;

    //input data for second iteration and so on
    wire[8:0] crc_unit_data_in_after_first_iteration;
    assign crc_unit_data_in_after_first_iteration = saved_data_reg[121:113];

    wire[8:0] crc_unit_data_in;
    reg crc_data_in_source_select;
    localparam CRC_SOURCE_DATA_IN = 1'b0;
    localparam CRC_SOURCE_SAVED_DATA_REG = 1'b1;
    assign crc_unit_data_in = (crc_data_in_source_select == CRC_SOURCE_DATA_IN) ? crc_unit_data_in_first_iteration : crc_unit_data_in_after_first_iteration;

    reg saved_remainder_reg[0:3]; //save four remainders of 1 bit each
    reg reset_remainder_reg;
    reg save_to_remainder_reg;

    //actual crc calculation
    //there are 9 crc units
    wire crc_unit_pass_out[0:8];
    wire crc_unit_first_position_out[0:8];
    wire crc_unit_second_position_out[0:8];
    wire crc_unit_third_position_out[0:8];
    

    //crcunit 0
    crcUnit crc_unit_0(
        .unit_data_in(crc_unit_data_in[8]),
        .unit_data_pass_out(crc_unit_pass_out[0]),
        .first_position_in(saved_remainder_reg[0]), //first position is the first remainder
        .first_position_out(crc_unit_first_position_out[0]), 
        .second_position_in(saved_remainder_reg[1]), //second position is the second remainder
        .second_position_out(crc_unit_second_position_out[0]), 
        .third_position_in(saved_remainder_reg[2]), //third position is the third remainder
        .third_position_out(crc_unit_third_position_out[0]), 
        .fourth_position_in(saved_remainder_reg[3]) //fourth position is the fourth remainder
    );


    genvar crc_unit_index;
    generate 
        for(crc_unit_index = 1; crc_unit_index <=8 ; crc_unit_index= crc_unit_index+1) begin: crc_unit_generate
            crcUnit crc_unit_0(
                .unit_data_in(crc_unit_data_in[8-crc_unit_index]),
                .unit_data_pass_out(crc_unit_pass_out[crc_unit_index]),
                .first_position_in(crc_unit_pass_out[crc_unit_index-1]), //first position is the pass output of previous crcunit
                .first_position_out(crc_unit_first_position_out[crc_unit_index]),
                .second_position_in(crc_unit_first_position_out[crc_unit_index-1]), //second position is the first position output of previous crcunit
                .second_position_out(crc_unit_second_position_out[crc_unit_index]),
                .third_position_in(crc_unit_second_position_out[crc_unit_index-1]), //third position is the second position output of previous crcunit
                .third_position_out(crc_unit_third_position_out[crc_unit_index]),
                .fourth_position_in(crc_unit_third_position_out[crc_unit_index-1]) //fourth position is the third position output of previous crcunit
            );
        end
    endgenerate
    

    




    //sequential logic
    always @(posedge clk, posedge rst) begin
        if(rst) begin
            current_state <= STATE_START;
            crc_round_counter <= 0;
            saved_data_reg <= 0;
            saved_remainder_reg[0] <= 0;
            saved_remainder_reg[1] <= 0;
            saved_remainder_reg[2] <= 0;
            saved_remainder_reg[3] <= 0;
        end
        else begin
            current_state <= next_state;

            if(reset_crc_round_counter)
                crc_round_counter <= 0;
            else if(count_crc_round_counter)
                crc_round_counter <= crc_round_counter + 1'b1;

            if(reset_saved_data_reg) 
                saved_data_reg <= 0;
            else if(save_to_saved_data_reg)
                saved_data_reg <= {data_in[118:0], 3'b000}; //save after first iteration
            else if(left_shift_9bit_saved_data_reg)
                saved_data_reg <= {saved_data_reg[112:0], 9'b000000000}; //left shift 9 bits

            if(reset_remainder_reg) begin
                saved_remainder_reg[0] <= 0;
                saved_remainder_reg[1] <= 0;
                saved_remainder_reg[2] <= 0;
                saved_remainder_reg[3] <= 0;
            end
            else if(save_to_remainder_reg) begin
                saved_remainder_reg[0] <= crc_unit_pass_out[8];
                saved_remainder_reg[1] <= crc_unit_first_position_out[8];
                saved_remainder_reg[2] <= crc_unit_second_position_out[8];
                saved_remainder_reg[3] <= crc_unit_third_position_out[8];
            end
        end
        
    end

    //FSM
    always @(*) begin
        //defaults
        next_state = current_state;
        crc_data_in_source_select = CRC_SOURCE_DATA_IN;

        reset_crc_round_counter = 0;
        count_crc_round_counter = 0;

        reset_saved_data_reg = 0;
        save_to_saved_data_reg = 0;
        left_shift_9bit_saved_data_reg = 0;

        reset_remainder_reg = 0;
        save_to_remainder_reg = 0;

        crc_out_valid = 0;
        crc_out_data = 0;



        case (current_state)
            STATE_START: begin
                next_state = STATE_WAIT;
            end
            STATE_WAIT: begin
                if(crc_start) begin
                    next_state = STATE_CALCULATE_CRC;
                    crc_data_in_source_select = CRC_SOURCE_DATA_IN;
                    save_to_saved_data_reg = 1;
                    save_to_remainder_reg = 1;
                    count_crc_round_counter = 1;
                end
            end
            STATE_CALCULATE_CRC: begin
                crc_data_in_source_select = CRC_SOURCE_SAVED_DATA_REG;
                save_to_remainder_reg = 1;
                left_shift_9bit_saved_data_reg = 1;
                count_crc_round_counter = 1;

                if(crc_round_counter == 14) begin
                    next_state = STATE_WAIT;
                    reset_crc_round_counter = 1;
                    reset_saved_data_reg = 1;
                    reset_remainder_reg = 1;
                    crc_out_valid = 1;
                    crc_out_data = {125'b0, crc_unit_third_position_out[5], crc_unit_second_position_out[5], crc_unit_first_position_out[5]};
                end
            end
            
        endcase

        
    end




    
endmodule


//crc unit for one bit stream
//the generator polynomial is x^3 + x + 1
module crcUnit(
    input unit_data_in,
    output unit_data_pass_out,
    input first_position_in,
    output first_position_out,
    input second_position_in,
    output second_position_out,
    input third_position_in,
    output third_position_out,
    input  fourth_position_in
);
    assign unit_data_pass_out = unit_data_in;
    assign first_position_out = first_position_in ^ fourth_position_in;
    assign second_position_out = second_position_in ^ fourth_position_in;
    assign third_position_out = third_position_in;
endmodule