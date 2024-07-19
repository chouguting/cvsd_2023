module binaryGrayConverter(
    input clk,
    input rst,
    input mode, //0 for binary to gray, 1 for gray to binary
    input converter_start,
    input [127:0] data_in,
    output reg [127:0] data_out,
    output reg data_out_valid
);
    localparam MODE_BIN_TO_GRAY = 1'b0;
    localparam MODE_GRAY_TO_BIN = 1'b1;

    reg[127:0] data_reg;
    reg save_to_data_reg;
    reg reset_data_reg;

    reg[1:0] current_state, next_state;
    localparam STATE_START = 2'd0;
    localparam STATE_WAIT = 2'd1;
    localparam STATE_CONVERT_BIN_TO_GRAY = 2'd2;
    localparam STATE_CONVERT_GRAY_TO_BIN = 2'd3;

    //round counter
    reg[3:0] converter_round_counter;
    reg reset_converter_round_counter;
    reg count_converter_round_counter;

    //binary to gray
    //g(127) = b(127) = b(127) ^ 0
    //g(n) = b(n) ^ b(n+1)  for n = 126 to 0
    reg[7:0] bin_to_gray_xor_input_1;
    reg[7:0] bin_to_gray_xor_input_2;
    wire[7:0]   bin_to_gray_xor_output;
    binaryToGrayXor8bit bin_to_gray_xor8bit_0(
        .data_in_1(bin_to_gray_xor_input_1),
        .data_in_2(bin_to_gray_xor_input_2),
        .xor_data_out(bin_to_gray_xor_output)
    );

    //input source select
    always @(*) begin
        case (converter_round_counter)
            0: begin //first round we use data_in
                bin_to_gray_xor_input_1 = data_in[7:0];
                bin_to_gray_xor_input_2 = data_in[8:1];
            end
            1: begin //starting from second round, we use data_reg 
                bin_to_gray_xor_input_1 = data_reg[15:8];
                bin_to_gray_xor_input_2 = data_reg[16:9];
            end
            2: begin
                bin_to_gray_xor_input_1 = data_reg[23:16];
                bin_to_gray_xor_input_2 = data_reg[24:17];
            end
            3: begin
                bin_to_gray_xor_input_1 = data_reg[31:24];
                bin_to_gray_xor_input_2 = data_reg[32:25];
            end
            4: begin
                bin_to_gray_xor_input_1 = data_reg[39:32];
                bin_to_gray_xor_input_2 = data_reg[40:33];
            end
            5: begin
                bin_to_gray_xor_input_1 = data_reg[47:40];
                bin_to_gray_xor_input_2 = data_reg[48:41];
            end
            6: begin
                bin_to_gray_xor_input_1 = data_reg[55:48];
                bin_to_gray_xor_input_2 = data_reg[56:49];
            end
            7: begin
                bin_to_gray_xor_input_1 = data_reg[63:56];
                bin_to_gray_xor_input_2 = data_reg[64:57];
            end
            8: begin
                bin_to_gray_xor_input_1 = data_reg[71:64];
                bin_to_gray_xor_input_2 = data_reg[72:65];
            end
            9: begin
                bin_to_gray_xor_input_1 = data_reg[79:72];
                bin_to_gray_xor_input_2 = data_reg[80:73];
            end
            10: begin
                bin_to_gray_xor_input_1 = data_reg[87:80];
                bin_to_gray_xor_input_2 = data_reg[88:81];
            end
            11: begin
                bin_to_gray_xor_input_1 = data_reg[95:88];
                bin_to_gray_xor_input_2 = data_reg[96:89];
            end
            12: begin
                bin_to_gray_xor_input_1 = data_reg[103:96];
                bin_to_gray_xor_input_2 = data_reg[104:97];
            end
            13: begin
                bin_to_gray_xor_input_1 = data_reg[111:104];
                bin_to_gray_xor_input_2 = data_reg[112:105];
            end
            14: begin //starting from second round, we use data_reg 
                bin_to_gray_xor_input_1 = data_reg[119:112];
                bin_to_gray_xor_input_2 = data_reg[120:113];
            end
            15: begin //first round we use data_in
                bin_to_gray_xor_input_1 = data_reg[127:120];
                bin_to_gray_xor_input_2 = {1'b0, data_reg[127:121]};
            end
            default: begin //should never happen
                bin_to_gray_xor_input_1 = 0;
                bin_to_gray_xor_input_2 = 0;
            end

        endcase
    end

    //gray to binary
    reg gray_to_bin_xor_carry_in;
    reg[7:0] gray_to_bin_xor_input;
    wire[7:0] gray_to_bin_xor_output;
    wire gray_to_bin_next_xor_carry;

    //save the carry of xor unit
    reg gray_to_bin_xor_carry_reg;
    reg reset_g2b_xor_carry_reg;
    reg save_g2b_xor_carry_reg;

    grayToBinaryXorUnit gray_to_bin_xor_unit_0(
        .last_xor_result(gray_to_bin_xor_carry_in),
        .data_in(gray_to_bin_xor_input),
        .data_out(gray_to_bin_xor_output),
        .next_xor_result(gray_to_bin_next_xor_carry)
    );

    always @(*) begin
        case (converter_round_counter)
            0: begin
                gray_to_bin_xor_carry_in = 0;
                gray_to_bin_xor_input = data_in[127:120];
            end
            1: begin
                gray_to_bin_xor_carry_in = gray_to_bin_xor_carry_reg;
                gray_to_bin_xor_input = data_reg[119:112];
            end
            2: begin
                gray_to_bin_xor_carry_in = gray_to_bin_xor_carry_reg;
                gray_to_bin_xor_input = data_reg[111:104];
            end
            3: begin
                gray_to_bin_xor_carry_in = gray_to_bin_xor_carry_reg;
                gray_to_bin_xor_input = data_reg[103:96];
            end
            4: begin
                gray_to_bin_xor_carry_in = gray_to_bin_xor_carry_reg;
                gray_to_bin_xor_input = data_reg[95:88];
            end
            5: begin
                gray_to_bin_xor_carry_in = gray_to_bin_xor_carry_reg;
                gray_to_bin_xor_input = data_reg[87:80];
            end
            6: begin
                gray_to_bin_xor_carry_in = gray_to_bin_xor_carry_reg;
                gray_to_bin_xor_input = data_reg[79:72];
            end
            7: begin
                gray_to_bin_xor_carry_in = gray_to_bin_xor_carry_reg;
                gray_to_bin_xor_input = data_reg[71:64];
            end
            8: begin
                gray_to_bin_xor_carry_in = gray_to_bin_xor_carry_reg;
                gray_to_bin_xor_input = data_reg[63:56];
            end
            9: begin
                gray_to_bin_xor_carry_in = gray_to_bin_xor_carry_reg;
                gray_to_bin_xor_input = data_reg[55:48];
            end
            10: begin
                gray_to_bin_xor_carry_in = gray_to_bin_xor_carry_reg;
                gray_to_bin_xor_input = data_reg[47:40];
            end
            11: begin
                gray_to_bin_xor_carry_in = gray_to_bin_xor_carry_reg;
                gray_to_bin_xor_input = data_reg[39:32];
            end
            12: begin
                gray_to_bin_xor_carry_in = gray_to_bin_xor_carry_reg;
                gray_to_bin_xor_input = data_reg[31:24];
            end
            13: begin
                gray_to_bin_xor_carry_in = gray_to_bin_xor_carry_reg;
                gray_to_bin_xor_input = data_reg[23:16];
            end
            14: begin
                gray_to_bin_xor_carry_in = gray_to_bin_xor_carry_reg;
                gray_to_bin_xor_input = data_reg[15:8];
            end
            15: begin
                gray_to_bin_xor_carry_in = gray_to_bin_xor_carry_reg;
                gray_to_bin_xor_input = data_reg[7:0];
            end
            default: begin //should never happen
                gray_to_bin_xor_carry_in = 0;
                gray_to_bin_xor_input = 0;
            end
        endcase
        
    end

    //control the data saved to data_reg
    reg[127:0] data_reg_input;
    always @(*) begin
        case (mode)
            MODE_BIN_TO_GRAY: begin
                case(converter_round_counter) 
                    0: begin
                        data_reg_input = {data_in[127:8], bin_to_gray_xor_output};
                    end
                    1: begin
                        data_reg_input = {data_reg[127:16], bin_to_gray_xor_output, data_reg[7:0]};
                    end
                    2: begin
                        data_reg_input = {data_reg[127:24], bin_to_gray_xor_output, data_reg[15:0]};
                    end
                    3: begin
                        data_reg_input = {data_reg[127:32], bin_to_gray_xor_output, data_reg[23:0]};
                    end
                    4: begin
                        data_reg_input = {data_reg[127:40], bin_to_gray_xor_output, data_reg[31:0]};
                    end
                    5: begin
                        data_reg_input = {data_reg[127:48], bin_to_gray_xor_output, data_reg[39:0]};
                    end
                    6: begin
                        data_reg_input = {data_reg[127:56], bin_to_gray_xor_output, data_reg[47:0]};
                    end
                    7: begin
                        data_reg_input = {data_reg[127:64], bin_to_gray_xor_output, data_reg[55:0]};
                    end
                    8: begin
                        data_reg_input = {data_reg[127:72], bin_to_gray_xor_output, data_reg[63:0]};
                    end
                    9: begin
                        data_reg_input = {data_reg[127:80], bin_to_gray_xor_output, data_reg[71:0]};
                    end
                    10: begin
                        data_reg_input = {data_reg[127:88], bin_to_gray_xor_output, data_reg[79:0]};
                    end
                    11: begin
                        data_reg_input = {data_reg[127:96], bin_to_gray_xor_output, data_reg[87:0]};
                    end
                    12: begin
                        data_reg_input = {data_reg[127:104], bin_to_gray_xor_output, data_reg[95:0]};
                    end
                    13: begin
                        data_reg_input = {data_reg[127:112], bin_to_gray_xor_output, data_reg[103:0]};
                    end
                    14: begin //starting from second round, we use data_reg 
                            //the calculated part is from 119 to 112
                        data_reg_input = {data_reg[127:120], bin_to_gray_xor_output, data_reg[111:0]};
                    end
                    15: begin //first round we use data_in
                        data_reg_input = {bin_to_gray_xor_output, data_reg[119:0]};
                    end   
                    default: begin //should never happen
                        data_reg_input = 0;
                    end
                endcase
                
            end
            MODE_GRAY_TO_BIN: begin
                case(converter_round_counter) 
                    0: begin //first round we use data_in
                        data_reg_input = {gray_to_bin_xor_output, data_in[119:0]};
                    end
                    1: begin //form second round, we use data_reg
                        data_reg_input = {data_reg[127:120], gray_to_bin_xor_output, data_reg[111:0]};
                    end
                    2: begin
                        data_reg_input = {data_reg[127:112], gray_to_bin_xor_output, data_reg[103:0]};
                    end
                    3: begin
                        data_reg_input = {data_reg[127:104], gray_to_bin_xor_output, data_reg[95:0]};
                    end
                    4: begin
                        data_reg_input = {data_reg[127:96], gray_to_bin_xor_output, data_reg[87:0]};
                    end
                    5: begin
                        data_reg_input = {data_reg[127:88], gray_to_bin_xor_output, data_reg[79:0]};
                    end
                    6: begin
                        data_reg_input = {data_reg[127:80], gray_to_bin_xor_output, data_reg[71:0]};
                    end
                    7: begin
                        data_reg_input = {data_reg[127:72], gray_to_bin_xor_output, data_reg[63:0]};
                    end
                    8: begin
                        data_reg_input = {data_reg[127:64], gray_to_bin_xor_output, data_reg[55:0]};
                    end
                    9: begin
                        data_reg_input = {data_reg[127:56], gray_to_bin_xor_output, data_reg[47:0]};
                    end
                    10: begin
                        data_reg_input = {data_reg[127:48], gray_to_bin_xor_output, data_reg[39:0]};
                    end
                    11: begin
                        data_reg_input = {data_reg[127:40], gray_to_bin_xor_output, data_reg[31:0]};
                    end
                    12: begin
                        data_reg_input = {data_reg[127:32], gray_to_bin_xor_output, data_reg[23:0]};
                    end
                    13: begin
                        data_reg_input = {data_reg[127:24], gray_to_bin_xor_output, data_reg[15:0]};
                    end
                    14: begin 
                        data_reg_input = {data_reg[127:16], gray_to_bin_xor_output, data_reg[7:0]};
                    end
                    15: begin 
                        data_reg_input = {data_reg[127:8], gray_to_bin_xor_output};
                    end   
                    default: begin //should never happen
                        data_reg_input = 0;
                    end
                endcase
                
            end
            default: begin //should never happen
                data_reg_input = 0;
            end
             
        endcase
        
    end


    always @(posedge clk, posedge rst) begin
        if(rst) begin
            current_state <= STATE_START;
            converter_round_counter <= 0;
            data_reg <= 0;
            gray_to_bin_xor_carry_reg <= 0;
        end
        else begin
            current_state <= next_state;

            if(reset_converter_round_counter) 
                converter_round_counter <= 0;
            else if(count_converter_round_counter)
                converter_round_counter <= converter_round_counter + 1;

            if(reset_data_reg) 
                data_reg <= 0;
            else if(save_to_data_reg)
                data_reg <= data_reg_input;

            if(reset_g2b_xor_carry_reg)
                gray_to_bin_xor_carry_reg <= 0;
            else if(save_g2b_xor_carry_reg)
                gray_to_bin_xor_carry_reg <= gray_to_bin_next_xor_carry;
        end
        
    end


    //FSM
    always @(*) begin
        //defaults
        next_state = current_state;
        save_to_data_reg = 0;
        reset_data_reg = 0;
        reset_converter_round_counter = 0;
        count_converter_round_counter = 0;

        data_out_valid = 0;
        data_out = 0;


        reset_g2b_xor_carry_reg = 0;
        save_g2b_xor_carry_reg = 0;

        case (current_state)
            STATE_START: begin
                next_state = STATE_WAIT;
            end
            STATE_WAIT: begin
                if(converter_start) begin
                    save_to_data_reg = 1;
                    if(mode == MODE_BIN_TO_GRAY)
                        next_state = STATE_CONVERT_BIN_TO_GRAY;
                    else if(mode == MODE_GRAY_TO_BIN) begin
                        next_state = STATE_CONVERT_GRAY_TO_BIN;
                        save_g2b_xor_carry_reg = 1;
                    end
                        
                    count_converter_round_counter = 1;
                end
                
            end
            STATE_CONVERT_BIN_TO_GRAY: begin
                save_to_data_reg = 1;
                count_converter_round_counter = 1;
                if(converter_round_counter == 15) begin
                    next_state = STATE_WAIT;
                    reset_converter_round_counter = 1;
                    reset_data_reg = 1;
                    data_out_valid = 1;
                    data_out = {bin_to_gray_xor_output, data_reg[119:0]};
                end
            end
            STATE_CONVERT_GRAY_TO_BIN: begin
                save_to_data_reg = 1;
                count_converter_round_counter = 1;
                save_g2b_xor_carry_reg = 1;
                if(converter_round_counter == 15) begin
                    next_state = STATE_WAIT;
                    reset_converter_round_counter = 1;
                    reset_data_reg = 1;
                    data_out_valid = 1;
                    reset_g2b_xor_carry_reg = 1;
                    data_out = {data_reg[127:8], gray_to_bin_xor_output};
                end
            end
        endcase
    end


endmodule

module binaryToGrayXor8bit(
    input [7:0] data_in_1,
    input [7:0] data_in_2,
    output [7:0] xor_data_out
);
    assign xor_data_out[7] = data_in_1[7] ^ data_in_2[7];
    assign xor_data_out[6] = data_in_1[6] ^ data_in_2[6];
    assign xor_data_out[5] = data_in_1[5] ^ data_in_2[5];
    assign xor_data_out[4] = data_in_1[4] ^ data_in_2[4];
    assign xor_data_out[3] = data_in_1[3] ^ data_in_2[3];
    assign xor_data_out[2] = data_in_1[2] ^ data_in_2[2];
    assign xor_data_out[1] = data_in_1[1] ^ data_in_2[1];
    assign xor_data_out[0] = data_in_1[0] ^ data_in_2[0];

endmodule

module grayToBinaryXorUnit(
    input last_xor_result,
    input [7:0] data_in,
    output [7:0] data_out,
    output wire next_xor_result
);
    assign data_out[7] = data_in[7] ^ last_xor_result;
    assign data_out[6] = data_in[6] ^ data_out[7];
    assign data_out[5] = data_in[5] ^ data_out[6];
    assign data_out[4] = data_in[4] ^ data_out[5];
    assign data_out[3] = data_in[3] ^ data_out[4];
    assign data_out[2] = data_in[2] ^ data_out[3];
    assign data_out[1] = data_in[1] ^ data_out[2];
    assign data_out[0] = data_in[0] ^ data_out[1];
    assign next_xor_result = data_out[0];
endmodule