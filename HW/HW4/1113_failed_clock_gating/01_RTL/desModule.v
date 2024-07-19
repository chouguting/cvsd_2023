module desModule(
    input clk,
    input rst,
    input enable,
    input mode, //0 - encrypt, 1 - decrypt
    input[127:0] des_data_in,
    input des_start,
    output reg[127:0] des_data_out,
    output reg des_out_valid
);

    localparam MODE_ENCRYPT = 1'd0;
    localparam MODE_DECRYPT = 1'd1;

    wire[63:0] des_main_key;
    wire[63:0] des_text_unpermuted;
    wire[63:0] des_text_permuted;
    wire[31:0] des_permuted_text_right_part;
    wire[31:0] des_permuted_text_left_part;

    assign des_main_key = des_data_in[127:64];
    assign des_text_unpermuted = des_data_in[63:0];
    initialPermutation init_perm(
        .unpermuted(des_text_unpermuted),
        .permuted(des_text_permuted)
    );

    assign des_permuted_text_right_part = des_text_permuted[31:0];
    assign des_permuted_text_left_part = des_text_permuted[63:32];


    //key scheduler
    wire [47:0] des_sub_key;
    reg next_sub_key;
    desKeyScheduler key_scheduler_0(
        .clk(clk),
        .rst(rst),
        .enable(enable),
        .mode(mode),
        .next_key(next_sub_key),
        .main_key(des_main_key),
        .key_out(des_sub_key)
    );



    //registers for the des module
    reg[63:0] saved_main_key_reg;  
    reg save_main_key;




    //count current des round, there are 16 rounds: r0, r1, r2, ..., r15
    reg[3:0] des_round_counter;
    reg count_des_round_counter;
    reg reset_des_round_counter;

    //des state
    reg[4:0] current_des_state, next_des_state;
    localparam DES_STATE_START = 5'd0;
    localparam DES_STATE_WAIT_WORK = 5'd1;
    localparam DES_STATE_WORKING = 5'd2;
    localparam DES_STATE_WORK_FINISH = 5'd3;

    //register for the des part
    //we divide 64 bits into 2 parts: left and right
    reg[31:0] des_left_part_reg;
    reg[31:0] des_right_part_reg;
    reg save_to_des_left_part_reg;
    reg save_to_des_right_part_reg;
    reg reset_des_left_part_reg;
    reg reset_des_right_part_reg;


    //F function
    wire[31:0] des_f_function_output;
    wire[31:0] des_f_function_input;
    reg f_function_input_source;
    localparam F_FUNCTION_INPUT_FROM_TEXT = 1'b0; //directly from the permuted text
    localparam F_FUNCTION_INPUT_FROM_R_REG = 1'b1; //from the work register
    assign des_f_function_input = (f_function_input_source == F_FUNCTION_INPUT_FROM_TEXT) ? des_permuted_text_right_part : des_right_part_reg;
    desFfunction des_f_function_0(
        .function_input(des_f_function_input),
        .key(des_sub_key),
        .function_output(des_f_function_output)
    );

    //XOR 
    wire[31:0] des_xor_output;
    wire[31:0] des_xor_input;
    reg xor_input_source;
    localparam XOR_INPUT_FROM_TEXT = 1'b0;
    localparam XOR_INPUT_FROM_L_REG = 1'b1;
    assign des_xor_input = (xor_input_source == XOR_INPUT_FROM_TEXT) ? des_permuted_text_left_part : des_left_part_reg;
    assign des_xor_output = des_xor_input ^ des_f_function_output;

    //final permutation
    wire[63:0] des_final_permutation_output;
    finalPermutation final_permutation_0(
        .unpermuted({des_xor_output, des_right_part_reg}),
        .permuted(des_final_permutation_output)
    );

    


    //sequential part
    always @(posedge clk, posedge rst) begin
        if(rst) begin

            current_des_state <= DES_STATE_START;
            saved_main_key_reg <= 64'd0;
            des_round_counter <= 4'd0;
            des_left_part_reg <= 32'd0;
            des_right_part_reg <= 32'd0;
        end
        else if(enable) begin
            current_des_state <= next_des_state;

            if(save_main_key) begin
                saved_main_key_reg <= des_main_key;
            end

            if(reset_des_round_counter)
                des_round_counter <= 4'd0;
            else if(count_des_round_counter)
                des_round_counter <= des_round_counter + 4'd1;


            if(reset_des_left_part_reg) begin
                des_left_part_reg <= 32'd0;
            end
            else if(save_to_des_left_part_reg) begin
                if(f_function_input_source == F_FUNCTION_INPUT_FROM_TEXT)
                    des_left_part_reg <=  des_permuted_text_right_part;
                else
                    des_left_part_reg <= des_right_part_reg;
            end

            if(reset_des_right_part_reg) begin
                des_right_part_reg <= 32'd0;
            end
            else if(save_to_des_right_part_reg) begin
                des_right_part_reg <= des_xor_output;
            end     
        end
        
    end


    //des FSM
    always @(*) begin
        //defaults
        next_des_state = current_des_state;

        //des counter control
        count_des_round_counter = 1'b0;
        reset_des_round_counter = 1'b0;

        //register control
        save_main_key = 1'b0;
        save_to_des_left_part_reg = 1'b0;
        save_to_des_right_part_reg = 1'b0;
        reset_des_left_part_reg = 1'b0;
        reset_des_right_part_reg = 1'b0;

        //data source control
        f_function_input_source = F_FUNCTION_INPUT_FROM_TEXT;
        xor_input_source = XOR_INPUT_FROM_TEXT;

        des_out_valid = 1'b0;

        //key scheduler control 
        next_sub_key = 1'b0;
        des_data_out = 128'd0;

        case (current_des_state)
            DES_STATE_START: begin
                next_des_state = DES_STATE_WAIT_WORK;
            end
            DES_STATE_WAIT_WORK: begin
                

                if(des_start) begin
                    save_main_key = 1'b1;
                    next_des_state = DES_STATE_WORKING;
                    count_des_round_counter = 1'b1;
                    next_sub_key = 1'b1;
                    save_to_des_left_part_reg = 1'b1;
                    save_to_des_right_part_reg = 1'b1;
                    
                end
            end
            DES_STATE_WORKING: begin
                f_function_input_source = F_FUNCTION_INPUT_FROM_R_REG;
                xor_input_source = XOR_INPUT_FROM_L_REG;
                count_des_round_counter = 1'b1;
                next_sub_key = 1'b1;
                save_to_des_left_part_reg = 1'b1;
                save_to_des_right_part_reg = 1'b1;
                if(des_round_counter == 4'd15) begin
                    next_des_state = DES_STATE_WAIT_WORK;
                    reset_des_round_counter = 1'b1;
                    reset_des_left_part_reg = 1'b1;
                    reset_des_right_part_reg = 1'b1;
                    des_out_valid = 1'b1;
                    des_data_out = {saved_main_key_reg, des_final_permutation_output};
                end
            end

        endcase
    end
endmodule


module initialPermutation(
    input[63:0] unpermuted,
    output[63:0] permuted
);
    /*
        this module will take the unpermuted text and permute it
        following the initial permutation table:
        Output index	Input index
            63	            6
            62	            14
            61	            22
            60	            30
            59	            38
            58	            46
            57	            54
            56	            62
            55	            4
            54	            12
            53	            20
            52	            28
            51	            36
            50	            44
            49	            52
            48	            60
            47	            2
            46	            10
            45	            18
            44	            26
            43	            34
            42	            42
            41	            50
            40	            58
            39	            0
            38	            8
            37	            16
            36	            24
            35	            32
            34	            40
            33	            48
            32	            56
            31	            7
            30	            15
            29	            23
            28	            31
            27	            39
            26	            47
            25	            55
            24	            63
            23	            5
            22	            13
            21	            21
            20	            29
            19	            37
            18	            45
            17	            53
            16	            61
            15	            3
            14	            11
            13	            19
            12	            27
            11	            35
            10	            43
            9	            51
            8	            59
            7	            1
            6	            9
            5	            17
            4	            25
            3	            33
            2	            41
            1	            49
            0	            57
    */
    assign permuted[63] = unpermuted[6];
    assign permuted[62] = unpermuted[14];
    assign permuted[61] = unpermuted[22];
    assign permuted[60] = unpermuted[30];
    assign permuted[59] = unpermuted[38];
    assign permuted[58] = unpermuted[46];
    assign permuted[57] = unpermuted[54];
    assign permuted[56] = unpermuted[62];
    assign permuted[55] = unpermuted[4];
    assign permuted[54] = unpermuted[12];
    assign permuted[53] = unpermuted[20];
    assign permuted[52] = unpermuted[28];
    assign permuted[51] = unpermuted[36];
    assign permuted[50] = unpermuted[44];
    assign permuted[49] = unpermuted[52];
    assign permuted[48] = unpermuted[60];
    assign permuted[47] = unpermuted[2];
    assign permuted[46] = unpermuted[10];
    assign permuted[45] = unpermuted[18];
    assign permuted[44] = unpermuted[26];
    assign permuted[43] = unpermuted[34];
    assign permuted[42] = unpermuted[42];
    assign permuted[41] = unpermuted[50];
    assign permuted[40] = unpermuted[58];
    assign permuted[39] = unpermuted[0];
    assign permuted[38] = unpermuted[8];
    assign permuted[37] = unpermuted[16];
    assign permuted[36] = unpermuted[24];
    assign permuted[35] = unpermuted[32];
    assign permuted[34] = unpermuted[40];
    assign permuted[33] = unpermuted[48];
    assign permuted[32] = unpermuted[56];
    assign permuted[31] = unpermuted[7];
    assign permuted[30] = unpermuted[15];
    assign permuted[29] = unpermuted[23];
    assign permuted[28] = unpermuted[31];
    assign permuted[27] = unpermuted[39];
    assign permuted[26] = unpermuted[47];
    assign permuted[25] = unpermuted[55];
    assign permuted[24] = unpermuted[63];
    assign permuted[23] = unpermuted[5];
    assign permuted[22] = unpermuted[13];
    assign permuted[21] = unpermuted[21];
    assign permuted[20] = unpermuted[29];
    assign permuted[19] = unpermuted[37];
    assign permuted[18] = unpermuted[45];
    assign permuted[17] = unpermuted[53];
    assign permuted[16] = unpermuted[61];
    assign permuted[15] = unpermuted[3];
    assign permuted[14] = unpermuted[11];
    assign permuted[13] = unpermuted[19];
    assign permuted[12] = unpermuted[27];
    assign permuted[11] = unpermuted[35];
    assign permuted[10] = unpermuted[43];
    assign permuted[9] = unpermuted[51];
    assign permuted[8] = unpermuted[59];
    assign permuted[7] = unpermuted[1];
    assign permuted[6] = unpermuted[9];
    assign permuted[5] = unpermuted[17];
    assign permuted[4] = unpermuted[25];
    assign permuted[3] = unpermuted[33];
    assign permuted[2] = unpermuted[41];
    assign permuted[1] = unpermuted[49];
    assign permuted[0] = unpermuted[57];

endmodule


module finalPermutation(
    input[63:0] unpermuted,
    output[63:0] permuted
);
    /*
    Output index	Input index
        63	            24
        62	            56
        61	            16
        60	            48
        59	            8
        58	            40
        57	            0
        56	            32
        55	            25
        54	            57
        53	            17
        52	            49
        51	            9
        50	            41
        49	            1
        48	            33
        47	            26
        46	            58
        45	            18
        44	            50
        43	            10
        42	            42
        41	            2
        40	            34
        39	            27
        38	            59
        37	            19
        36	            51
        35	            11
        34	            43
        33	            3
        32	            35
        31	            28
        30	            60
        29	            20
        28	            52
        27	            12
        26	            44
        25	            4
        24	            36
        23	            29
        22	            61
        21	            21
        20	            53
        19	            13
        18	            45
        17	            5
        16	            37
        15	            30
        14	            62
        13	            22
        12	            54
        11	            14
        10	            46
        9	            6
        8	            38
        7	            31
        6	            63
        5	            23
        4	            55
        3	            15
        2	            47
        1	            7
        0	            39

    */
    assign permuted[63] = unpermuted[24];
    assign permuted[62] = unpermuted[56];
    assign permuted[61] = unpermuted[16];
    assign permuted[60] = unpermuted[48];
    assign permuted[59] = unpermuted[8];
    assign permuted[58] = unpermuted[40];
    assign permuted[57] = unpermuted[0];
    assign permuted[56] = unpermuted[32];
    assign permuted[55] = unpermuted[25];
    assign permuted[54] = unpermuted[57];
    assign permuted[53] = unpermuted[17];
    assign permuted[52] = unpermuted[49];
    assign permuted[51] = unpermuted[9];
    assign permuted[50] = unpermuted[41];
    assign permuted[49] = unpermuted[1];
    assign permuted[48] = unpermuted[33];
    assign permuted[47] = unpermuted[26];
    assign permuted[46] = unpermuted[58];
    assign permuted[45] = unpermuted[18];
    assign permuted[44] = unpermuted[50];
    assign permuted[43] = unpermuted[10];
    assign permuted[42] = unpermuted[42];
    assign permuted[41] = unpermuted[2];
    assign permuted[40] = unpermuted[34];
    assign permuted[39] = unpermuted[27];
    assign permuted[38] = unpermuted[59];
    assign permuted[37] = unpermuted[19];
    assign permuted[36] = unpermuted[51];
    assign permuted[35] = unpermuted[11];
    assign permuted[34] = unpermuted[43];
    assign permuted[33] = unpermuted[3];
    assign permuted[32] = unpermuted[35];
    assign permuted[31] = unpermuted[28];
    assign permuted[30] = unpermuted[60];
    assign permuted[29] = unpermuted[20];
    assign permuted[28] = unpermuted[52];
    assign permuted[27] = unpermuted[12];
    assign permuted[26] = unpermuted[44];
    assign permuted[25] = unpermuted[4];
    assign permuted[24] = unpermuted[36];
    assign permuted[23] = unpermuted[29];
    assign permuted[22] = unpermuted[61];
    assign permuted[21] = unpermuted[21];
    assign permuted[20] = unpermuted[53];
    assign permuted[19] = unpermuted[13];
    assign permuted[18] = unpermuted[45];
    assign permuted[17] = unpermuted[5];
    assign permuted[16] = unpermuted[37];
    assign permuted[15] = unpermuted[30];
    assign permuted[14] = unpermuted[62];
    assign permuted[13] = unpermuted[22];
    assign permuted[12] = unpermuted[54];
    assign permuted[11] = unpermuted[14];
    assign permuted[10] = unpermuted[46];
    assign permuted[9] = unpermuted[6];
    assign permuted[8] = unpermuted[38];
    assign permuted[7] = unpermuted[31];
    assign permuted[6] = unpermuted[63];
    assign permuted[5] = unpermuted[23];
    assign permuted[4] = unpermuted[55];
    assign permuted[3] = unpermuted[15];
    assign permuted[2] = unpermuted[47];
    assign permuted[1] = unpermuted[7];
    assign permuted[0] = unpermuted[39];


endmodule