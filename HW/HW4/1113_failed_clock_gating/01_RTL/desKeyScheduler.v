module desKeyScheduler(
    input clk,
    input rst,
    input enable,
    input mode,  // 0: encrypt, 1: decrypt
    input next_key,
    input[63:0] main_key,
    output[47:0] key_out
);

    //two modes
    localparam MODE_ENCRYPT = 1'd0;
    localparam MODE_DECRYPT = 1'd1;



    wire[55:0] permuted_cipher_key;
    pc1Permutation pc1_permutation_0(
        .unpermuted_key(main_key),
        .permuted_key(permuted_cipher_key)
    );  //permutation and get the permuted cipher key


    reg[27:0] key_reg_left_part;  //store the left part of the key
    reg[27:0] key_reg_right_part;  //store the right part of the key

     //in des, we break the key into 2 parts, and do the circular shift seperately
    reg load_key_reg; //load shifter result to key_reg
    reg reset_key_reg; //reset key_reg

    //schedule counter
    reg[3:0] schedule_counter_value;  // schedule counter's value
    reg reset_schedule_counter; 
    reg count_schedule_counter;

    

    //shifter
    //select the source of the shifter
    //only if the first iteration, the source of the shifter is the cipher key
    reg shifter_source;  // 0: cipher key, 1: key_reg
    localparam SHIFTER_SOURCE_CIPHER_KEY = 0;
    localparam SHIFTER_SOURCE_KEY_REG = 1;

    wire[27:0] input_for_shifter_left_part;
    wire[27:0] input_for_shifter_right_part;
    
    //we divide the key into 2 parts, and than do the circular shift seperately
    assign input_for_shifter_left_part = (shifter_source == SHIFTER_SOURCE_CIPHER_KEY) ? permuted_cipher_key[55:28] : key_reg_left_part;
    assign input_for_shifter_right_part = (shifter_source == SHIFTER_SOURCE_CIPHER_KEY) ? permuted_cipher_key[27:0] : key_reg_right_part;

    //there are 2 kinds of left shifter for each part, one is 1 bit, the other is 2 bit
    wire[27:0] left_part_left_shifter_1bit_out; //left part, left shifter, 1 bit
    wire[27:0] right_part_left_shifter_1bit_out; //right part, left shifter, 1 bit
    wire[27:0] left_part_left_shifter_2bit_out; //left part, left shifter, 2 bit
    wire[27:0] right_part_left_shifter_2bit_out; //right part, left shifter, 2 bit


    //left shifter
    circularLeftShifter1bit circular_left_shifter_1bit_for_left_part(
        .input_data(input_for_shifter_left_part),
        .output_data(left_part_left_shifter_1bit_out)
    );

    circularLeftShifter1bit circular_left_shifter_1bit_for_right_part(
        .input_data(input_for_shifter_right_part),
        .output_data(right_part_left_shifter_1bit_out)
    );


    circularLeftShifter2bit circular_left_shifter_2bit_for_left_part(
        .input_data(input_for_shifter_left_part),
        .output_data(left_part_left_shifter_2bit_out)
    );

    circularLeftShifter2bit circular_left_shifter_2bit_for_right_part(
        .input_data(input_for_shifter_right_part),
        .output_data(right_part_left_shifter_2bit_out)
    );

    //right shifter
    //there are 2 kinds of right shifter for each part, one is 1 bit, the other is 2 bit
    wire[27:0] left_part_right_shifter_1bit_out; //left part, right shifter, 1 bit
    wire[27:0] right_part_right_shifter_1bit_out; //right part, right shifter, 1 bit
    wire[27:0] left_part_right_shifter_2bit_out; //left part, right shifter, 2 bit
    wire[27:0] right_part_right_shifter_2bit_out; //right part, right shifter, 2 bit

    circularRightShifter1bit circular_right_shifter_1bit_for_left_part(
        .input_data(input_for_shifter_left_part),
        .output_data(left_part_right_shifter_1bit_out)
    );

    circularRightShifter1bit circular_right_shifter_1bit_for_right_part(
        .input_data(input_for_shifter_right_part),
        .output_data(right_part_right_shifter_1bit_out)
    );

    circularRightShifter2bit circular_right_shifter_2bit_for_left_part(
        .input_data(input_for_shifter_left_part),
        .output_data(left_part_right_shifter_2bit_out)
    );

    circularRightShifter2bit circular_right_shifter_2bit_for_right_part(
        .input_data(input_for_shifter_right_part),
        .output_data(right_part_right_shifter_2bit_out)
    );


    //shifter select
    //select the shifter we use in this iteration
    //the selected shifter result will be loaded to key_reg
    reg[1:0] shifter_select;  
    localparam SHIFTER_SELECT_LEFT_1BIT = 2'd0;
    localparam SHIFTER_SELECT_LEFT_2BIT = 2'd1;
    localparam SHIFTER_SELECT_RIGHT_1BIT = 2'd2;
    localparam SHIFTER_SELECT_RIGHT_2BIT = 2'd3;

    //PC2 permutation
    //before output the key, we need to do the PC2 permutation
    //the source of the PC2 permutation have 4 possibilities
    //when encrypt, the source of the PC2 permutation can be left_shift_1_bit or left_shift_2_bit
    //when decrypt, the source of the PC2 permutation can be cipher_key or key_reg
    reg[1:0] pc2_input_select;
    localparam PC2_INPUT_SELECT_LEFT_SHIFT_1_BIT = 2'd0;
    localparam PC2_INPUT_SELECT_LEFT_SHIFT_2_BIT = 2'd1;
    localparam PC2_INPUT_SELECT_KEY_REG = 2'd2;
    localparam PC2_INPUT_SELECT_CIPHER_KEY = 2'd3;
    reg[55:0] input_for_pc2_permutation;

    //select the input for the PC2 permutation
    always @(*) begin
        case(pc2_input_select)
            PC2_INPUT_SELECT_LEFT_SHIFT_1_BIT: input_for_pc2_permutation = {left_part_left_shifter_1bit_out, right_part_left_shifter_1bit_out};
            PC2_INPUT_SELECT_LEFT_SHIFT_2_BIT: input_for_pc2_permutation = {left_part_left_shifter_2bit_out, right_part_left_shifter_2bit_out};
            PC2_INPUT_SELECT_KEY_REG: input_for_pc2_permutation = {key_reg_left_part, key_reg_right_part};
            PC2_INPUT_SELECT_CIPHER_KEY: input_for_pc2_permutation = permuted_cipher_key;
            default: input_for_pc2_permutation = 56'd0; //should not happen

        endcase
    end

  
    //do the PC2 permutation
    pc2Permutation pc2_permutation_0(
        .unpermuted_key(input_for_pc2_permutation),
        .permuted_key(key_out)
    );



    always @(posedge clk, posedge rst) begin
        if(rst) begin
            schedule_counter_value <= 4'd0;
            key_reg_left_part <= 28'd0;
            key_reg_right_part <= 28'd0;
        end
        else if(enable) begin
            if(reset_schedule_counter)
                schedule_counter_value <= 4'd0;
            else if(count_schedule_counter)
                schedule_counter_value <= schedule_counter_value + 4'd1;

            if(reset_key_reg) begin
                key_reg_left_part <= 28'd0;
                key_reg_right_part <= 28'd0;
            end
            else
            if( load_key_reg) begin
                case(shifter_select)
                    SHIFTER_SELECT_LEFT_1BIT: begin
                        key_reg_left_part <= left_part_left_shifter_1bit_out;
                        key_reg_right_part <= right_part_left_shifter_1bit_out;
                    end
                    SHIFTER_SELECT_LEFT_2BIT: begin
                        key_reg_left_part <= left_part_left_shifter_2bit_out;
                        key_reg_right_part <= right_part_left_shifter_2bit_out;
                    end
                    SHIFTER_SELECT_RIGHT_1BIT: begin
                        key_reg_left_part <= left_part_right_shifter_1bit_out;
                        key_reg_right_part <= right_part_right_shifter_1bit_out;
                    end
                    SHIFTER_SELECT_RIGHT_2BIT: begin
                        key_reg_left_part <= left_part_right_shifter_2bit_out;
                        key_reg_right_part <= right_part_right_shifter_2bit_out;
                    end
                endcase
                // key_reg_left_part <= (shifter_select == SHIFTER_SELECT_LEFT_1BIT) ? left_part_left_shifter_1bit_out : left_part_left_shifter_2bit_out;
                // key_reg_right_part <= (shifter_select == SHIFTER_SELECT_LEFT_1BIT) ? right_part_left_shifter_1bit_out : right_part_left_shifter_2bit_out;
            end
        end 
    end

    //controller
    always @(*) begin
        //default
        load_key_reg = 1'b0;
        reset_key_reg = 1'b0;

        reset_schedule_counter = 1'b0;
        count_schedule_counter = 1'b0;

        shifter_source = SHIFTER_SOURCE_CIPHER_KEY;
        shifter_select = SHIFTER_SELECT_LEFT_1BIT;

        pc2_input_select = PC2_INPUT_SELECT_LEFT_SHIFT_1_BIT;

        if(next_key == 1'b1) begin
            count_schedule_counter = 1'b1;
            load_key_reg = 1'b1;
        end

        case (mode)
            MODE_ENCRYPT: begin
                case(schedule_counter_value)
                    0: begin
                        
                        shifter_source = SHIFTER_SOURCE_CIPHER_KEY;
                        shifter_select = SHIFTER_SELECT_LEFT_1BIT;
                        pc2_input_select = PC2_INPUT_SELECT_LEFT_SHIFT_1_BIT;
                    end
                    1: begin
                        
                        shifter_source = SHIFTER_SOURCE_KEY_REG;
                        shifter_select = SHIFTER_SELECT_LEFT_1BIT;
                        pc2_input_select = PC2_INPUT_SELECT_LEFT_SHIFT_1_BIT;
                    end
                    2, 3, 4, 5, 6, 7: begin
                        shifter_source = SHIFTER_SOURCE_KEY_REG;
                        shifter_select = SHIFTER_SELECT_LEFT_2BIT;
                        pc2_input_select = PC2_INPUT_SELECT_LEFT_SHIFT_2_BIT;
                    end
                    8: begin
                        shifter_source = SHIFTER_SOURCE_KEY_REG;
                        shifter_select = SHIFTER_SELECT_LEFT_1BIT;
                        pc2_input_select = PC2_INPUT_SELECT_LEFT_SHIFT_1_BIT;
                    end
                    9, 10, 11, 12, 13, 14: begin
                        shifter_source = SHIFTER_SOURCE_KEY_REG;
                        shifter_select = SHIFTER_SELECT_LEFT_2BIT;
                        pc2_input_select = PC2_INPUT_SELECT_LEFT_SHIFT_2_BIT;
                    end
                    15: begin
                        shifter_source = SHIFTER_SOURCE_KEY_REG;
                        shifter_select = SHIFTER_SELECT_LEFT_1BIT;
                        pc2_input_select = PC2_INPUT_SELECT_LEFT_SHIFT_1_BIT;
                        reset_schedule_counter = 1'b1;
                        reset_key_reg = 1'b1;
                    end
                endcase 
            end
            MODE_DECRYPT: begin
                case (schedule_counter_value)
                    0: begin
                        shifter_source = SHIFTER_SOURCE_CIPHER_KEY;
                        shifter_select = SHIFTER_SELECT_RIGHT_1BIT;
                        pc2_input_select = PC2_INPUT_SELECT_CIPHER_KEY;
                    end
                    1, 2, 3, 4, 5, 6: begin
                        shifter_source = SHIFTER_SOURCE_KEY_REG;
                        shifter_select = SHIFTER_SELECT_RIGHT_2BIT;
                        pc2_input_select = PC2_INPUT_SELECT_KEY_REG;
                    end
                    7: begin
                        shifter_source = SHIFTER_SOURCE_KEY_REG;
                        shifter_select = SHIFTER_SELECT_RIGHT_1BIT;
                        pc2_input_select = PC2_INPUT_SELECT_KEY_REG;
                    end
                    8, 9, 10, 11, 12, 13: begin
                        shifter_source = SHIFTER_SOURCE_KEY_REG;
                        shifter_select = SHIFTER_SELECT_RIGHT_2BIT;
                        pc2_input_select = PC2_INPUT_SELECT_KEY_REG;
                    end
                    14: begin
                        shifter_source = SHIFTER_SOURCE_KEY_REG;
                        shifter_select = SHIFTER_SELECT_RIGHT_1BIT;
                        pc2_input_select = PC2_INPUT_SELECT_KEY_REG;
                    end
                    15: begin
                        shifter_source = SHIFTER_SOURCE_KEY_REG;
                        shifter_select = SHIFTER_SELECT_RIGHT_2BIT;
                        pc2_input_select = PC2_INPUT_SELECT_KEY_REG;
                        reset_schedule_counter = 1'b1;
                        reset_key_reg = 1'b1;
                    end

                endcase
                
            end
             
             
        endcase


              
    end
endmodule

module circularLeftShifter1bit(
    input[27:0] input_data,
    output[27:0] output_data
);
    assign output_data = {input_data[26:0], input_data[27]};
endmodule

module circularLeftShifter2bit(
    input[27:0] input_data,
    output[27:0] output_data
);
    assign output_data = {input_data[25:0], input_data[27:26]};
endmodule

module circularRightShifter1bit(
    input[27:0] input_data,
    output[27:0] output_data
);
    assign output_data = {input_data[0], input_data[27:1]};
endmodule

module circularRightShifter2bit(
    input[27:0] input_data,
    output[27:0] output_data
);
    assign output_data = {input_data[1:0], input_data[27:2]};
endmodule


module pc1Permutation(
    input [63:0] unpermuted_key,
    output [55:0] permuted_key
);
    /*
    permutation table:
    Output index	Input index
        55	            7
        54	            15
        53	            23
        52	            31
        51	            39
        50	            47
        49	            55
        48	            63
        47	            6
        46	            14
        45	            22
        44	            30
        43	            38
        42	            46
        41	            54
        40	            62
        39	            5
        38	            13
        37	            21
        36	            29
        35	            37
        34	            45
        33	            53
        32	            61
        31	            4
        30	            12
        29	            20
        28	            28
        27	            1
        26	            9
        25	            17
        24	            25
        23	            33
        22	            41
        21	            49
        20	            57
        19	            2
        18	            10
        17	            18
        16	            26
        15	            34
        14	            42
        13	            50
        12	            58
        11	            3
        10	            11
        9	            19
        8	            27
        7	            35
        6	            43
        5	            51
        4	            59
        3	            36
        2	            44
        1	            52
        0	            60

    */
    assign permuted_key[55] = unpermuted_key[7];
    assign permuted_key[54] = unpermuted_key[15];
    assign permuted_key[53] = unpermuted_key[23];
    assign permuted_key[52] = unpermuted_key[31];
    assign permuted_key[51] = unpermuted_key[39];
    assign permuted_key[50] = unpermuted_key[47];
    assign permuted_key[49] = unpermuted_key[55];
    assign permuted_key[48] = unpermuted_key[63];
    assign permuted_key[47] = unpermuted_key[6];
    assign permuted_key[46] = unpermuted_key[14];
    assign permuted_key[45] = unpermuted_key[22];
    assign permuted_key[44] = unpermuted_key[30];
    assign permuted_key[43] = unpermuted_key[38];
    assign permuted_key[42] = unpermuted_key[46];
    assign permuted_key[41] = unpermuted_key[54];
    assign permuted_key[40] = unpermuted_key[62];
    assign permuted_key[39] = unpermuted_key[5];
    assign permuted_key[38] = unpermuted_key[13];
    assign permuted_key[37] = unpermuted_key[21];
    assign permuted_key[36] = unpermuted_key[29];
    assign permuted_key[35] = unpermuted_key[37];
    assign permuted_key[34] = unpermuted_key[45];
    assign permuted_key[33] = unpermuted_key[53];
    assign permuted_key[32] = unpermuted_key[61];
    assign permuted_key[31] = unpermuted_key[4];
    assign permuted_key[30] = unpermuted_key[12];
    assign permuted_key[29] = unpermuted_key[20];
    assign permuted_key[28] = unpermuted_key[28];
    assign permuted_key[27] = unpermuted_key[1];
    assign permuted_key[26] = unpermuted_key[9];
    assign permuted_key[25] = unpermuted_key[17];
    assign permuted_key[24] = unpermuted_key[25];
    assign permuted_key[23] = unpermuted_key[33];
    assign permuted_key[22] = unpermuted_key[41];
    assign permuted_key[21] = unpermuted_key[49];
    assign permuted_key[20] = unpermuted_key[57];
    assign permuted_key[19] = unpermuted_key[2];
    assign permuted_key[18] = unpermuted_key[10];
    assign permuted_key[17] = unpermuted_key[18];
    assign permuted_key[16] = unpermuted_key[26];
    assign permuted_key[15] = unpermuted_key[34];
    assign permuted_key[14] = unpermuted_key[42];
    assign permuted_key[13] = unpermuted_key[50];
    assign permuted_key[12] = unpermuted_key[58];
    assign permuted_key[11] = unpermuted_key[3];
    assign permuted_key[10] = unpermuted_key[11];
    assign permuted_key[9] = unpermuted_key[19];
    assign permuted_key[8] = unpermuted_key[27];
    assign permuted_key[7] = unpermuted_key[35];
    assign permuted_key[6] = unpermuted_key[43];
    assign permuted_key[5] = unpermuted_key[51];
    assign permuted_key[4] = unpermuted_key[59];
    assign permuted_key[3] = unpermuted_key[36];
    assign permuted_key[2] = unpermuted_key[44];
    assign permuted_key[1] = unpermuted_key[52];
    assign permuted_key[0] = unpermuted_key[60];
endmodule


module pc2Permutation(
    input [55:0] unpermuted_key,
    output [47:0] permuted_key
);
    /*
    Output index	Input index
        47	            42
        46	            39
        45	            45
        44	            32
        43	            55
        42	            51
        41	            53
        40	            28
        39	            41
        38	            50
        37	            35
        36	            46
        35	            33
        34	            37
        33	            44
        32	            52
        31	            30
        30	            48
        29	            40
        28	            49
        27	            29
        26	            36
        25	            43
        24	            54
        23	            15
        22	            4
        21	            25
        20	            19
        19	            9
        18	            1
        17	            26
        16	            16
        15	            5
        14	            11
        13	            23
        12	            8
        11	            12
        10	            7
        9	            17
        8	            0
        7	            22
        6	            3
        5	            10
        4	            14
        3	            6
        2	            20
        1	            27
        0	            24
    */
    assign permuted_key[47] = unpermuted_key[42];
    assign permuted_key[46] = unpermuted_key[39];
    assign permuted_key[45] = unpermuted_key[45];
    assign permuted_key[44] = unpermuted_key[32];
    assign permuted_key[43] = unpermuted_key[55];
    assign permuted_key[42] = unpermuted_key[51];
    assign permuted_key[41] = unpermuted_key[53];
    assign permuted_key[40] = unpermuted_key[28];
    assign permuted_key[39] = unpermuted_key[41];
    assign permuted_key[38] = unpermuted_key[50];
    assign permuted_key[37] = unpermuted_key[35];
    assign permuted_key[36] = unpermuted_key[46];
    assign permuted_key[35] = unpermuted_key[33];
    assign permuted_key[34] = unpermuted_key[37];
    assign permuted_key[33] = unpermuted_key[44];
    assign permuted_key[32] = unpermuted_key[52];
    assign permuted_key[31] = unpermuted_key[30];
    assign permuted_key[30] = unpermuted_key[48];
    assign permuted_key[29] = unpermuted_key[40];
    assign permuted_key[28] = unpermuted_key[49];
    assign permuted_key[27] = unpermuted_key[29];
    assign permuted_key[26] = unpermuted_key[36];
    assign permuted_key[25] = unpermuted_key[43];
    assign permuted_key[24] = unpermuted_key[54];
    assign permuted_key[23] = unpermuted_key[15];
    assign permuted_key[22] = unpermuted_key[4];
    assign permuted_key[21] = unpermuted_key[25];
    assign permuted_key[20] = unpermuted_key[19];
    assign permuted_key[19] = unpermuted_key[9];
    assign permuted_key[18] = unpermuted_key[1];
    assign permuted_key[17] = unpermuted_key[26];
    assign permuted_key[16] = unpermuted_key[16];
    assign permuted_key[15] = unpermuted_key[5];
    assign permuted_key[14] = unpermuted_key[11];
    assign permuted_key[13] = unpermuted_key[23];
    assign permuted_key[12] = unpermuted_key[8];
    assign permuted_key[11] = unpermuted_key[12];
    assign permuted_key[10] = unpermuted_key[7];
    assign permuted_key[9] = unpermuted_key[17];
    assign permuted_key[8] = unpermuted_key[0];
    assign permuted_key[7] = unpermuted_key[22];
    assign permuted_key[6] = unpermuted_key[3];
    assign permuted_key[5] = unpermuted_key[10];
    assign permuted_key[4] = unpermuted_key[14];
    assign permuted_key[3] = unpermuted_key[6];
    assign permuted_key[2] = unpermuted_key[20];
    assign permuted_key[1] = unpermuted_key[27];
    assign permuted_key[0] = unpermuted_key[24];
   
endmodule