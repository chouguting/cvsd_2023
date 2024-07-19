module desFfunction(
    input[31:0] function_input,
    input[47:0] key,
    output[31:0] function_output
);
    wire[47:0] expansion_output;
    roundExpander round_expander(
        .expansion_input(function_input),
        .expansion_output(expansion_output)
    );

    wire[47:0] xor_output;
    assign xor_output = expansion_output ^ key;

    wire[3:0] sbox1_output, sbox2_output, sbox3_output, sbox4_output; 
    wire[3:0] sbox5_output, sbox6_output, sbox7_output, sbox8_output;

    sbox1 sbox1_0(
        .sbox1_input(xor_output[47:42]),
        .sbox1_output(sbox1_output)
    );

    sbox2 sbox2_0(
        .sbox2_input(xor_output[41:36]),
        .sbox2_output(sbox2_output)
    );

    sbox3 sbox3_0(
        .sbox3_input(xor_output[35:30]),
        .sbox3_output(sbox3_output)
    );
    
    sbox4 sbox4_0(
        .sbox4_input(xor_output[29:24]),
        .sbox4_output(sbox4_output)
    );

    sbox5 sbox5_0(
        .sbox5_input(xor_output[23:18]),
        .sbox5_output(sbox5_output)
    );

    sbox6 sbox6_0(
        .sbox6_input(xor_output[17:12]),
        .sbox6_output(sbox6_output)
    );

    sbox7 sbox7_0(
        .sbox7_input(xor_output[11:6]),
        .sbox7_output(sbox7_output)
    );

    sbox8 sbox8_0(
        .sbox8_input(xor_output[5:0]),
        .sbox8_output(sbox8_output)
    );

    wire[31:0] sbox_output;
    assign sbox_output = {sbox1_output, sbox2_output, sbox3_output, sbox4_output, sbox5_output, sbox6_output, sbox7_output, sbox8_output};

    roundPermutation round_permutation(
        .unpermuted_input(sbox_output),
        .permuted_output(function_output)
    );


endmodule


module roundExpander(
    input[31:0] expansion_input,
    output[47:0] expansion_output
);
    /*
    Output index	Input index
        47	            0
        46	            31
        45	            30
        44	            29
        43	            28
        42	            27
        41	            28
        40	            27
        39	            26
        38	            25
        37	            24
        36	            23
        35	            24
        34	            23
        33	            22
        32	            21
        31	            20
        30	            19
        29	            20
        28	            19
        27	            18
        26	            17
        25	            16
        24	            15
        23	            16
        22	            15
        21	            14
        20	            13
        19	            12
        18	            11
        17	            12
        16	            11
        15	            10
        14	            9
        13	            8
        12	            7
        11	            8
        10	            7
        9	            6
        8	            5
        7	            4
        6	            3
        5	            4
        4	            3
        3	            2
        2	            1
        1	            0
        0	            31
    */
    assign expansion_output[47] = expansion_input[0];
    assign expansion_output[46] = expansion_input[31];
    assign expansion_output[45] = expansion_input[30];
    assign expansion_output[44] = expansion_input[29];
    assign expansion_output[43] = expansion_input[28];
    assign expansion_output[42] = expansion_input[27];
    assign expansion_output[41] = expansion_input[28];
    assign expansion_output[40] = expansion_input[27];
    assign expansion_output[39] = expansion_input[26];
    assign expansion_output[38] = expansion_input[25];
    assign expansion_output[37] = expansion_input[24];
    assign expansion_output[36] = expansion_input[23];
    assign expansion_output[35] = expansion_input[24];
    assign expansion_output[34] = expansion_input[23];
    assign expansion_output[33] = expansion_input[22];
    assign expansion_output[32] = expansion_input[21];
    assign expansion_output[31] = expansion_input[20];
    assign expansion_output[30] = expansion_input[19];
    assign expansion_output[29] = expansion_input[20];
    assign expansion_output[28] = expansion_input[19];
    assign expansion_output[27] = expansion_input[18];
    assign expansion_output[26] = expansion_input[17];
    assign expansion_output[25] = expansion_input[16];
    assign expansion_output[24] = expansion_input[15];
    assign expansion_output[23] = expansion_input[16];
    assign expansion_output[22] = expansion_input[15];
    assign expansion_output[21] = expansion_input[14];
    assign expansion_output[20] = expansion_input[13];
    assign expansion_output[19] = expansion_input[12];
    assign expansion_output[18] = expansion_input[11];
    assign expansion_output[17] = expansion_input[12];
    assign expansion_output[16] = expansion_input[11];
    assign expansion_output[15] = expansion_input[10];
    assign expansion_output[14] = expansion_input[9];
    assign expansion_output[13] = expansion_input[8];
    assign expansion_output[12] = expansion_input[7];
    assign expansion_output[11] = expansion_input[8];
    assign expansion_output[10] = expansion_input[7];
    assign expansion_output[9] = expansion_input[6];
    assign expansion_output[8] = expansion_input[5];
    assign expansion_output[7] = expansion_input[4];
    assign expansion_output[6] = expansion_input[3];
    assign expansion_output[5] = expansion_input[4];
    assign expansion_output[4] = expansion_input[3];
    assign expansion_output[3] = expansion_input[2];
    assign expansion_output[2] = expansion_input[1];
    assign expansion_output[1] = expansion_input[0];
    assign expansion_output[0] = expansion_input[31];

endmodule


module roundPermutation(
    input[31:0] unpermuted_input,
    output[31:0] permuted_output
);
    /*
    Output index	Input index
        31	            16
        30	            25
        29	            12
        28	            11
        27	            3
        26	            20
        25	            4
        24	            15
        23	            31
        22	            17
        21	            9
        20	            6
        19	            27
        18	            14
        17	            1
        16	            22
        15	            30
        14	            24
        13	            8
        12	            18
        11	            0
        10	            5
        9	            29
        8	            23
        7	            13
        6	            19
        5	            2
        4	            26
        3	            10
        2	            21
        1	            28
        0	            7
    */
    assign permuted_output[31] = unpermuted_input[16];
    assign permuted_output[30] = unpermuted_input[25];
    assign permuted_output[29] = unpermuted_input[12];
    assign permuted_output[28] = unpermuted_input[11];
    assign permuted_output[27] = unpermuted_input[3];
    assign permuted_output[26] = unpermuted_input[20];
    assign permuted_output[25] = unpermuted_input[4];
    assign permuted_output[24] = unpermuted_input[15];
    assign permuted_output[23] = unpermuted_input[31];
    assign permuted_output[22] = unpermuted_input[17];
    assign permuted_output[21] = unpermuted_input[9];
    assign permuted_output[20] = unpermuted_input[6];
    assign permuted_output[19] = unpermuted_input[27];
    assign permuted_output[18] = unpermuted_input[14];
    assign permuted_output[17] = unpermuted_input[1];
    assign permuted_output[16] = unpermuted_input[22];
    assign permuted_output[15] = unpermuted_input[30];
    assign permuted_output[14] = unpermuted_input[24];
    assign permuted_output[13] = unpermuted_input[8];
    assign permuted_output[12] = unpermuted_input[18];
    assign permuted_output[11] = unpermuted_input[0];
    assign permuted_output[10] = unpermuted_input[5];
    assign permuted_output[9] = unpermuted_input[29];
    assign permuted_output[8] = unpermuted_input[23];
    assign permuted_output[7] = unpermuted_input[13];
    assign permuted_output[6] = unpermuted_input[19];
    assign permuted_output[5] = unpermuted_input[2];
    assign permuted_output[4] = unpermuted_input[26];
    assign permuted_output[3] = unpermuted_input[10];
    assign permuted_output[2] = unpermuted_input[21];
    assign permuted_output[1] = unpermuted_input[28];
    assign permuted_output[0] = unpermuted_input[7];
endmodule

module sbox1(
    input [5:0] sbox1_input,
    output reg [3:0] sbox1_output
);
    /*
  S1	x0000x	x0001x	x0010x	x0011x	x0100x	x0101x	x0110x	x0111x	x1000x	x1001x	x1010x	x1011x	x1100x	x1101x	x1110x	x1111x
0yyyy0	14	    4	    13	    1	    2	    15	    11	    8	    3	    10	    6	    12	    5	    9	    0	    7
0yyyy1	0	    15	    7	    4	    14	    2	    13	    1	    10	    6	    12	    11	    9	    5	    3	    8
1yyyy0	4	    1	    14	    8	    13	    6	    2	    11	    15	    12	    9	    7	    3	    10	    5	    0
1yyyy1	15	    12	    8	    2	    4	    9	    1	    7	    5	    11	    3	    14	    10	    0	    6	    13
    */
    always@(*) begin
        case ({sbox1_input[5], sbox1_input[0]})
            2'b00: begin
                case (sbox1_input[4:1])
                    4'b0000: sbox1_output = 4'd14;
                    4'b0001: sbox1_output = 4'd4;
                    4'b0010: sbox1_output = 4'd13;
                    4'b0011: sbox1_output = 4'd1;
                    4'b0100: sbox1_output = 4'd2;
                    4'b0101: sbox1_output = 4'd15;
                    4'b0110: sbox1_output = 4'd11;
                    4'b0111: sbox1_output = 4'd8;
                    4'b1000: sbox1_output = 4'd3;
                    4'b1001: sbox1_output = 4'd10;
                    4'b1010: sbox1_output = 4'd6;
                    4'b1011: sbox1_output = 4'd12;
                    4'b1100: sbox1_output = 4'd5;
                    4'b1101: sbox1_output = 4'd9;
                    4'b1110: sbox1_output = 4'd0;
                    4'b1111: sbox1_output = 4'd7;
                    default: sbox1_output = 4'b0; //should not happen
                endcase
            end
            2'b01: begin
                case (sbox1_input[4:1])
                    4'b0000: sbox1_output = 4'd0;
                    4'b0001: sbox1_output = 4'd15;
                    4'b0010: sbox1_output = 4'd7;
                    4'b0011: sbox1_output = 4'd4;
                    4'b0100: sbox1_output = 4'd14;
                    4'b0101: sbox1_output = 4'd2;
                    4'b0110: sbox1_output = 4'd13;
                    4'b0111: sbox1_output = 4'd1;
                    4'b1000: sbox1_output = 4'd10;
                    4'b1001: sbox1_output = 4'd6;
                    4'b1010: sbox1_output = 4'd12;
                    4'b1011: sbox1_output = 4'd11;
                    4'b1100: sbox1_output = 4'd9;
                    4'b1101: sbox1_output = 4'd5;
                    4'b1110: sbox1_output = 4'd3;
                    4'b1111: sbox1_output = 4'd8;
                    default: sbox1_output = 4'b0; //should not happen
                endcase
                
            end
            2'b10: begin
                case (sbox1_input[4:1])
                    4'b0000: sbox1_output = 4'd4;
                    4'b0001: sbox1_output = 4'd1;
                    4'b0010: sbox1_output = 4'd14;
                    4'b0011: sbox1_output = 4'd8;
                    4'b0100: sbox1_output = 4'd13;
                    4'b0101: sbox1_output = 4'd6;
                    4'b0110: sbox1_output = 4'd2;
                    4'b0111: sbox1_output = 4'd11;
                    4'b1000: sbox1_output = 4'd15;
                    4'b1001: sbox1_output = 4'd12;
                    4'b1010: sbox1_output = 4'd9;
                    4'b1011: sbox1_output = 4'd7;
                    4'b1100: sbox1_output = 4'd3;
                    4'b1101: sbox1_output = 4'd10;
                    4'b1110: sbox1_output = 4'd5;
                    4'b1111: sbox1_output = 4'd0;
                    default: sbox1_output = 4'b0; //should not happen
                endcase
                
            end
            2'b11: begin
                case (sbox1_input[4:1])
                    4'b0000: sbox1_output = 4'd15;
                    4'b0001: sbox1_output = 4'd12;
                    4'b0010: sbox1_output = 4'd8;
                    4'b0011: sbox1_output = 4'd2;
                    4'b0100: sbox1_output = 4'd4;
                    4'b0101: sbox1_output = 4'd9;
                    4'b0110: sbox1_output = 4'd1;
                    4'b0111: sbox1_output = 4'd7;
                    4'b1000: sbox1_output = 4'd5;
                    4'b1001: sbox1_output = 4'd11;
                    4'b1010: sbox1_output = 4'd3;
                    4'b1011: sbox1_output = 4'd14;
                    4'b1100: sbox1_output = 4'd10;
                    4'b1101: sbox1_output = 4'd0;
                    4'b1110: sbox1_output = 4'd6;
                    4'b1111: sbox1_output = 4'd13;
                    default: sbox1_output = 4'b0; //should not happen
                endcase
                
            end
            default: begin
            sbox1_output = 4'b0; //should not happen 
            end
        endcase
    end
    
endmodule


module sbox2(
    input [5:0] sbox2_input,
    output reg [3:0] sbox2_output
);
    /*
    S2	x0000x	x0001x	x0010x	x0011x	x0100x	x0101x	x0110x	x0111x	x1000x	x1001x	x1010x	x1011x	x1100x	x1101x	x1110x	x1111x
0yyyy0	15	    1	    8	    14	    6	    11	    3	    4	    9	    7	    2	    13	    12	    0	    5	    10
0yyyy1	3	    13	    4	    7	    15	    2	    8	    14	    12	    0	    1	    10	    6	    9	    11	    5
1yyyy0	0	    14	    7	    11	    10	    4	    13	    1	    5	    8	    12	    6	    9	    3	    2	    15
1yyyy1	13	    8	    10	    1	    3	    15	    4	    2	    11	    6	    7	    12	    0	    5	    14	    9

    */
    always @(*) begin
        case ({sbox2_input[5], sbox2_input[0]})
            2'b00: begin
                case (sbox2_input[4:1])
                    4'b0000: sbox2_output = 4'd15;
                    4'b0001: sbox2_output = 4'd1;
                    4'b0010: sbox2_output = 4'd8;
                    4'b0011: sbox2_output = 4'd14;
                    4'b0100: sbox2_output = 4'd6;
                    4'b0101: sbox2_output = 4'd11;
                    4'b0110: sbox2_output = 4'd3;
                    4'b0111: sbox2_output = 4'd4;
                    4'b1000: sbox2_output = 4'd9;
                    4'b1001: sbox2_output = 4'd7;
                    4'b1010: sbox2_output = 4'd2;
                    4'b1011: sbox2_output = 4'd13;
                    4'b1100: sbox2_output = 4'd12;
                    4'b1101: sbox2_output = 4'd0;
                    4'b1110: sbox2_output = 4'd5;
                    4'b1111: sbox2_output = 4'd10;
                    default: sbox2_output = 4'b0; //should not happen
                endcase   
            end
            2'b01: begin
                case (sbox2_input[4:1])
                    4'b0000: sbox2_output = 4'd3;
                    4'b0001: sbox2_output = 4'd13;
                    4'b0010: sbox2_output = 4'd4;
                    4'b0011: sbox2_output = 4'd7;
                    4'b0100: sbox2_output = 4'd15;
                    4'b0101: sbox2_output = 4'd2;
                    4'b0110: sbox2_output = 4'd8;
                    4'b0111: sbox2_output = 4'd14;
                    4'b1000: sbox2_output = 4'd12;
                    4'b1001: sbox2_output = 4'd0;
                    4'b1010: sbox2_output = 4'd1;
                    4'b1011: sbox2_output = 4'd10;
                    4'b1100: sbox2_output = 4'd6;
                    4'b1101: sbox2_output = 4'd9;
                    4'b1110: sbox2_output = 4'd11;
                    4'b1111: sbox2_output = 4'd5;
                    default: sbox2_output = 4'b0; //should not happen
                endcase
                
            end
            2'b10: begin
                case (sbox2_input[4:1])
                    4'b0000: sbox2_output = 4'd0;
                    4'b0001: sbox2_output = 4'd14;
                    4'b0010: sbox2_output = 4'd7;
                    4'b0011: sbox2_output = 4'd11;
                    4'b0100: sbox2_output = 4'd10;
                    4'b0101: sbox2_output = 4'd4;
                    4'b0110: sbox2_output = 4'd13;
                    4'b0111: sbox2_output = 4'd1;
                    4'b1000: sbox2_output = 4'd5;
                    4'b1001: sbox2_output = 4'd8;
                    4'b1010: sbox2_output = 4'd12;
                    4'b1011: sbox2_output = 4'd6;
                    4'b1100: sbox2_output = 4'd9;
                    4'b1101: sbox2_output = 4'd3;
                    4'b1110: sbox2_output = 4'd2;
                    4'b1111: sbox2_output = 4'd15;
                    default: sbox2_output = 4'b0; //should not happen
                endcase
                
            end
            2'b11: begin
                case (sbox2_input[4:1])
                    4'b0000: sbox2_output = 4'd13;
                    4'b0001: sbox2_output = 4'd8;
                    4'b0010: sbox2_output = 4'd10;
                    4'b0011: sbox2_output = 4'd1;
                    4'b0100: sbox2_output = 4'd3;
                    4'b0101: sbox2_output = 4'd15;
                    4'b0110: sbox2_output = 4'd4;
                    4'b0111: sbox2_output = 4'd2;
                    4'b1000: sbox2_output = 4'd11;
                    4'b1001: sbox2_output = 4'd6;
                    4'b1010: sbox2_output = 4'd7;
                    4'b1011: sbox2_output = 4'd12;
                    4'b1100: sbox2_output = 4'd0;
                    4'b1101: sbox2_output = 4'd5;
                    4'b1110: sbox2_output = 4'd14;
                    4'b1111: sbox2_output = 4'd9;
                    default: sbox2_output = 4'b0; //should not happen
                endcase
                
            end
            default: begin
            sbox2_output = 4'b0; //should not happen 
            end
        endcase
    end
   
endmodule

module sbox3(
    input [5:0] sbox3_input,
    output reg [3:0] sbox3_output
);
    /*
    S3	x0000x	x0001x	x0010x	x0011x	x0100x	x0101x	x0110x	x0111x	x1000x	x1001x	x1010x	x1011x	x1100x	x1101x	x1110x	x1111x
0yyyy0	10	    0	    9	    14	    6	    3	    15	    5	    1	    13	    12	    7	    11	    4	    2	    8
0yyyy1	13	    7	    0	    9	    3	    4	    6	    10	    2	    8	    5	    14	    12	    11	    15	    1
1yyyy0	13	    6	    4	    9	    8	    15	    3	    0	    11	    1	    2	    12	    5	    10	    14	    7
1yyyy1	1	    10	    13	    0	    6	    9	    8	    7	    4	    15	    14	    3	    11	    5	    2	    12
    */
    always @(*) begin
        case ({sbox3_input[5], sbox3_input[0]})
            2'b00: begin
                case (sbox3_input[4:1])
                    4'b0000: sbox3_output = 4'd10;
                    4'b0001: sbox3_output = 4'd0;
                    4'b0010: sbox3_output = 4'd9;
                    4'b0011: sbox3_output = 4'd14;
                    4'b0100: sbox3_output = 4'd6;
                    4'b0101: sbox3_output = 4'd3;
                    4'b0110: sbox3_output = 4'd15;
                    4'b0111: sbox3_output = 4'd5;
                    4'b1000: sbox3_output = 4'd1;
                    4'b1001: sbox3_output = 4'd13;
                    4'b1010: sbox3_output = 4'd12;
                    4'b1011: sbox3_output = 4'd7;
                    4'b1100: sbox3_output = 4'd11;
                    4'b1101: sbox3_output = 4'd4;
                    4'b1110: sbox3_output = 4'd2;
                    4'b1111: sbox3_output = 4'd8;
                    default: sbox3_output = 4'b0; //should not happen 
                endcase
                
            end
            2'b01: begin
                case (sbox3_input[4:1])
                    4'b0000: sbox3_output = 4'd13;
                    4'b0001: sbox3_output = 4'd7;
                    4'b0010: sbox3_output = 4'd0;
                    4'b0011: sbox3_output = 4'd9;
                    4'b0100: sbox3_output = 4'd3;
                    4'b0101: sbox3_output = 4'd4;
                    4'b0110: sbox3_output = 4'd6;
                    4'b0111: sbox3_output = 4'd10;
                    4'b1000: sbox3_output = 4'd2;
                    4'b1001: sbox3_output = 4'd8;
                    4'b1010: sbox3_output = 4'd5;
                    4'b1011: sbox3_output = 4'd14;
                    4'b1100: sbox3_output = 4'd12;
                    4'b1101: sbox3_output = 4'd11;
                    4'b1110: sbox3_output = 4'd15;
                    4'b1111: sbox3_output = 4'd1;
                    default: sbox3_output = 4'b0; //should not happen 
                endcase
                
            end
            2'b10: begin
                case (sbox3_input[4:1])
                    4'b0000: sbox3_output = 4'd13;
                    4'b0001: sbox3_output = 4'd6;
                    4'b0010: sbox3_output = 4'd4;
                    4'b0011: sbox3_output = 4'd9;
                    4'b0100: sbox3_output = 4'd8;
                    4'b0101: sbox3_output = 4'd15;
                    4'b0110: sbox3_output = 4'd3;
                    4'b0111: sbox3_output = 4'd0;
                    4'b1000: sbox3_output = 4'd11;
                    4'b1001: sbox3_output = 4'd1;
                    4'b1010: sbox3_output = 4'd2;
                    4'b1011: sbox3_output = 4'd12;
                    4'b1100: sbox3_output = 4'd5;
                    4'b1101: sbox3_output = 4'd10;
                    4'b1110: sbox3_output = 4'd14;
                    4'b1111: sbox3_output = 4'd7;
                    default: sbox3_output = 4'b0; //should not happen 
                endcase
                
            end
            2'b11: begin
                case (sbox3_input[4:1])
                    4'b0000: sbox3_output = 4'd1;
                    4'b0001: sbox3_output = 4'd10;
                    4'b0010: sbox3_output = 4'd13;
                    4'b0011: sbox3_output = 4'd0;
                    4'b0100: sbox3_output = 4'd6;
                    4'b0101: sbox3_output = 4'd9;
                    4'b0110: sbox3_output = 4'd8;
                    4'b0111: sbox3_output = 4'd7;
                    4'b1000: sbox3_output = 4'd4;
                    4'b1001: sbox3_output = 4'd15;
                    4'b1010: sbox3_output = 4'd14;
                    4'b1011: sbox3_output = 4'd3;
                    4'b1100: sbox3_output = 4'd11;
                    4'b1101: sbox3_output = 4'd5;
                    4'b1110: sbox3_output = 4'd2;
                    4'b1111: sbox3_output = 4'd12;
                    default: sbox3_output = 4'b0; //should not happen 
                endcase
                
            end
            default: begin
            sbox3_output = 4'b0; //should not happen 
            end
        endcase
    end
    
endmodule


module sbox4 (
    input [5:0] sbox4_input,
    output reg [3:0] sbox4_output
);
    /*
    S4	x0000x	x0001x	x0010x	x0011x	x0100x	x0101x	x0110x	x0111x	x1000x	x1001x	x1010x	x1011x	x1100x	x1101x	x1110x	x1111x
0yyyy0	7	    13	    14	    3	    0	    6	    9	    10	    1	    2	    8	    5	    11	    12	    4	    15
0yyyy1	13	    8	    11	    5	    6	    15	    0	    3	    4	    7	    2	    12	    1	    10	    14	    9
1yyyy0	10	    6	    9	    0	    12	    11	    7	    13	    15	    1	    3	    14	    5	    2	    8	    4
1yyyy1	3	    15	    0	    6	    10	    1	    13	    8	    9	    4	    5	    11	    12	    7	    2	    14

    */
    always @(*) begin
        case ({sbox4_input[5], sbox4_input[0]})
            2'b00: begin
                case (sbox4_input[4:1])
                    4'b0000: sbox4_output = 4'd7;
                    4'b0001: sbox4_output = 4'd13;
                    4'b0010: sbox4_output = 4'd14;
                    4'b0011: sbox4_output = 4'd3;
                    4'b0100: sbox4_output = 4'd0;
                    4'b0101: sbox4_output = 4'd6;
                    4'b0110: sbox4_output = 4'd9;
                    4'b0111: sbox4_output = 4'd10;
                    4'b1000: sbox4_output = 4'd1;
                    4'b1001: sbox4_output = 4'd2;
                    4'b1010: sbox4_output = 4'd8;
                    4'b1011: sbox4_output = 4'd5;
                    4'b1100: sbox4_output = 4'd11;
                    4'b1101: sbox4_output = 4'd12;
                    4'b1110: sbox4_output = 4'd4;
                    4'b1111: sbox4_output = 4'd15;
                    default: sbox4_output = 4'b0; //should not happen   
                endcase
            end
            2'b01: begin
                case (sbox4_input[4:1])
                    4'b0000: sbox4_output = 4'd13;
                    4'b0001: sbox4_output = 4'd8;
                    4'b0010: sbox4_output = 4'd11;
                    4'b0011: sbox4_output = 4'd5;
                    4'b0100: sbox4_output = 4'd6;
                    4'b0101: sbox4_output = 4'd15;
                    4'b0110: sbox4_output = 4'd0;
                    4'b0111: sbox4_output = 4'd3;
                    4'b1000: sbox4_output = 4'd4;
                    4'b1001: sbox4_output = 4'd7;
                    4'b1010: sbox4_output = 4'd2;
                    4'b1011: sbox4_output = 4'd12;
                    4'b1100: sbox4_output = 4'd1;
                    4'b1101: sbox4_output = 4'd10;
                    4'b1110: sbox4_output = 4'd14;
                    4'b1111: sbox4_output = 4'd9;
                    default: sbox4_output = 4'b0; //should not happen   
                endcase
                
            end
            2'b10: begin
                case (sbox4_input[4:1])
                    4'b0000: sbox4_output = 4'd10;
                    4'b0001: sbox4_output = 4'd6;
                    4'b0010: sbox4_output = 4'd9;
                    4'b0011: sbox4_output = 4'd0;
                    4'b0100: sbox4_output = 4'd12;
                    4'b0101: sbox4_output = 4'd11;
                    4'b0110: sbox4_output = 4'd7;
                    4'b0111: sbox4_output = 4'd13;
                    4'b1000: sbox4_output = 4'd15;
                    4'b1001: sbox4_output = 4'd1;
                    4'b1010: sbox4_output = 4'd3;
                    4'b1011: sbox4_output = 4'd14;
                    4'b1100: sbox4_output = 4'd5;
                    4'b1101: sbox4_output = 4'd2;
                    4'b1110: sbox4_output = 4'd8;
                    4'b1111: sbox4_output = 4'd4;
                    default: sbox4_output = 4'b0; //should not happen   
                endcase
                
            end
            2'b11: begin
                case (sbox4_input[4:1])
                    4'b0000: sbox4_output = 4'd3;
                    4'b0001: sbox4_output = 4'd15;
                    4'b0010: sbox4_output = 4'd0;
                    4'b0011: sbox4_output = 4'd6;
                    4'b0100: sbox4_output = 4'd10;
                    4'b0101: sbox4_output = 4'd1;
                    4'b0110: sbox4_output = 4'd13;
                    4'b0111: sbox4_output = 4'd8;
                    4'b1000: sbox4_output = 4'd9;
                    4'b1001: sbox4_output = 4'd4;
                    4'b1010: sbox4_output = 4'd5;
                    4'b1011: sbox4_output = 4'd11;
                    4'b1100: sbox4_output = 4'd12;
                    4'b1101: sbox4_output = 4'd7;
                    4'b1110: sbox4_output = 4'd2;
                    4'b1111: sbox4_output = 4'd14;
                    default: sbox4_output = 4'b0; //should not happen   
                endcase
                
            end
            default: begin
            sbox4_output = 4'b0; //should not happen 
            end
        endcase
    end
    
endmodule

module sbox5(
    input [5:0] sbox5_input,
    output reg [3:0] sbox5_output
);
    /*
    S5	x0000x	x0001x	x0010x	x0011x	x0100x	x0101x	x0110x	x0111x	x1000x	x1001x	x1010x	x1011x	x1100x	x1101x	x1110x	x1111x
0yyyy0	2	    12	    4	    1	    7	    10	    11	    6	    8	    5	    3	    15	    13	    0	    14	    9
0yyyy1	14	    11	    2	    12	    4	    7	    13	    1	    5	    0	    15	    10	    3	    9	    8	    6
1yyyy0	4	    2	    1	    11	    10	    13	    7	    8	    15	    9	    12	    5	    6	    3	    0	    14
1yyyy1	11	    8	    12	    7	    1	    14	    2	    13	    6	    15	    0	    9	    10	    4	    5	    3

    */
    always @(*) begin
        case ({sbox5_input[5], sbox5_input[0]})
            2'b00: begin
                case (sbox5_input[4:1])
                    4'b0000: sbox5_output = 4'd2;
                    4'b0001: sbox5_output = 4'd12;
                    4'b0010: sbox5_output = 4'd4;
                    4'b0011: sbox5_output = 4'd1;
                    4'b0100: sbox5_output = 4'd7;
                    4'b0101: sbox5_output = 4'd10;
                    4'b0110: sbox5_output = 4'd11;
                    4'b0111: sbox5_output = 4'd6;
                    4'b1000: sbox5_output = 4'd8;
                    4'b1001: sbox5_output = 4'd5;
                    4'b1010: sbox5_output = 4'd3;
                    4'b1011: sbox5_output = 4'd15;
                    4'b1100: sbox5_output = 4'd13;
                    4'b1101: sbox5_output = 4'd0;
                    4'b1110: sbox5_output = 4'd14;
                    4'b1111: sbox5_output = 4'd9;
                    default: sbox5_output = 4'b0; //should not happen   
                endcase
            end 
            2'b01: begin
                case (sbox5_input[4:1])
                    4'b0000: sbox5_output = 4'd14;
                    4'b0001: sbox5_output = 4'd11;
                    4'b0010: sbox5_output = 4'd2;
                    4'b0011: sbox5_output = 4'd12;
                    4'b0100: sbox5_output = 4'd4;
                    4'b0101: sbox5_output = 4'd7;
                    4'b0110: sbox5_output = 4'd13;
                    4'b0111: sbox5_output = 4'd1;
                    4'b1000: sbox5_output = 4'd5;
                    4'b1001: sbox5_output = 4'd0;
                    4'b1010: sbox5_output = 4'd15;
                    4'b1011: sbox5_output = 4'd10;
                    4'b1100: sbox5_output = 4'd3;
                    4'b1101: sbox5_output = 4'd9;
                    4'b1110: sbox5_output = 4'd8;
                    4'b1111: sbox5_output = 4'd6;
                    default: sbox5_output = 4'b0; //should not happen   
                endcase  
            end
            2'b10: begin
                case (sbox5_input[4:1])
                    4'b0000: sbox5_output = 4'd4;
                    4'b0001: sbox5_output = 4'd2;
                    4'b0010: sbox5_output = 4'd1;
                    4'b0011: sbox5_output = 4'd11;
                    4'b0100: sbox5_output = 4'd10;
                    4'b0101: sbox5_output = 4'd13;
                    4'b0110: sbox5_output = 4'd7;
                    4'b0111: sbox5_output = 4'd8;
                    4'b1000: sbox5_output = 4'd15;
                    4'b1001: sbox5_output = 4'd9;
                    4'b1010: sbox5_output = 4'd12;
                    4'b1011: sbox5_output = 4'd5;
                    4'b1100: sbox5_output = 4'd6;
                    4'b1101: sbox5_output = 4'd3;
                    4'b1110: sbox5_output = 4'd0;
                    4'b1111: sbox5_output = 4'd14;
                    default: sbox5_output = 4'b0; //should not happen   
                endcase                  
            end
            2'b11: begin
                case (sbox5_input[4:1])
                    4'b0000: sbox5_output = 4'd11;
                    4'b0001: sbox5_output = 4'd8;
                    4'b0010: sbox5_output = 4'd12;
                    4'b0011: sbox5_output = 4'd7;
                    4'b0100: sbox5_output = 4'd1;
                    4'b0101: sbox5_output = 4'd14;
                    4'b0110: sbox5_output = 4'd2;
                    4'b0111: sbox5_output = 4'd13;
                    4'b1000: sbox5_output = 4'd6;
                    4'b1001: sbox5_output = 4'd15;
                    4'b1010: sbox5_output = 4'd0;
                    4'b1011: sbox5_output = 4'd9;
                    4'b1100: sbox5_output = 4'd10;
                    4'b1101: sbox5_output = 4'd4;
                    4'b1110: sbox5_output = 4'd5;
                    4'b1111: sbox5_output = 4'd3;
                    default: sbox5_output = 4'b0; //should not happen   
                endcase               
            end
        endcase
    end
endmodule


module sbox6 (
    input [5:0] sbox6_input,
    output reg [3:0] sbox6_output
);
    /*
    S6	x0000x	x0001x	x0010x	x0011x	x0100x	x0101x	x0110x	x0111x	x1000x	x1001x	x1010x	x1011x	x1100x	x1101x	x1110x	x1111x
0yyyy0	12	    1	    10	    15	    9	    2	    6	    8	    0	    13	    3	    4	    14	    7	    5	    11
0yyyy1	10	    15	    4	    2	    7	    12	    9	    5	    6	    1	    13	    14	    0	    11	    3	    8
1yyyy0	9	    14	    15	    5	    2	    8	    12	    3	    7	    0	    4	    10	    1	    13	    11	    6
1yyyy1	4	    3	    2	    12	    9	    5	    15	    10	    11	    14	    1	    7	    6	    0	    8	    13
    */
    always @(*) begin
        case ({sbox6_input[5], sbox6_input[0]})
            2'b00: begin
                case (sbox6_input[4:1])
                    4'b0000: sbox6_output = 4'd12;
                    4'b0001: sbox6_output = 4'd1;
                    4'b0010: sbox6_output = 4'd10;
                    4'b0011: sbox6_output = 4'd15;
                    4'b0100: sbox6_output = 4'd9;
                    4'b0101: sbox6_output = 4'd2;
                    4'b0110: sbox6_output = 4'd6;
                    4'b0111: sbox6_output = 4'd8;
                    4'b1000: sbox6_output = 4'd0;
                    4'b1001: sbox6_output = 4'd13;
                    4'b1010: sbox6_output = 4'd3;
                    4'b1011: sbox6_output = 4'd4;
                    4'b1100: sbox6_output = 4'd14;
                    4'b1101: sbox6_output = 4'd7;
                    4'b1110: sbox6_output = 4'd5;
                    4'b1111: sbox6_output = 4'd11;
                    default: sbox6_output = 4'b0; //should not happen 
                endcase
                
            end
            2'b01: begin
                case (sbox6_input[4:1])
                    4'b0000: sbox6_output = 4'd10;
                    4'b0001: sbox6_output = 4'd15;
                    4'b0010: sbox6_output = 4'd4;
                    4'b0011: sbox6_output = 4'd2;
                    4'b0100: sbox6_output = 4'd7;
                    4'b0101: sbox6_output = 4'd12;
                    4'b0110: sbox6_output = 4'd9;
                    4'b0111: sbox6_output = 4'd5;
                    4'b1000: sbox6_output = 4'd6;
                    4'b1001: sbox6_output = 4'd1;
                    4'b1010: sbox6_output = 4'd13;
                    4'b1011: sbox6_output = 4'd14;
                    4'b1100: sbox6_output = 4'd0;
                    4'b1101: sbox6_output = 4'd11;
                    4'b1110: sbox6_output = 4'd3;
                    4'b1111: sbox6_output = 4'd8;
                    default: sbox6_output = 4'b0; //should not happen 
                endcase         
            end
            2'b10: begin
                case (sbox6_input[4:1])
                    4'b0000: sbox6_output = 4'd9;
                    4'b0001: sbox6_output = 4'd14;
                    4'b0010: sbox6_output = 4'd15;
                    4'b0011: sbox6_output = 4'd5;
                    4'b0100: sbox6_output = 4'd2;
                    4'b0101: sbox6_output = 4'd8;
                    4'b0110: sbox6_output = 4'd12;
                    4'b0111: sbox6_output = 4'd3;
                    4'b1000: sbox6_output = 4'd7;
                    4'b1001: sbox6_output = 4'd0;
                    4'b1010: sbox6_output = 4'd4;
                    4'b1011: sbox6_output = 4'd10;
                    4'b1100: sbox6_output = 4'd1;
                    4'b1101: sbox6_output = 4'd13;
                    4'b1110: sbox6_output = 4'd11;
                    4'b1111: sbox6_output = 4'd6;
                    default: sbox6_output = 4'b0; //should not happen 
                endcase                        
            end
            2'b11: begin
                case (sbox6_input[4:1])
                    4'b0000: sbox6_output = 4'd4;
                    4'b0001: sbox6_output = 4'd3;
                    4'b0010: sbox6_output = 4'd2;
                    4'b0011: sbox6_output = 4'd12;
                    4'b0100: sbox6_output = 4'd9;
                    4'b0101: sbox6_output = 4'd5;
                    4'b0110: sbox6_output = 4'd15;
                    4'b0111: sbox6_output = 4'd10;
                    4'b1000: sbox6_output = 4'd11;
                    4'b1001: sbox6_output = 4'd14;
                    4'b1010: sbox6_output = 4'd1;
                    4'b1011: sbox6_output = 4'd7;
                    4'b1100: sbox6_output = 4'd6;
                    4'b1101: sbox6_output = 4'd0;
                    4'b1110: sbox6_output = 4'd8;
                    4'b1111: sbox6_output = 4'd13;
                    default: sbox6_output = 4'b0; //should not happen 
                endcase                        
            end
        endcase
    end
    
endmodule


module sbox7(
    input [5:0] sbox7_input,
    output reg [3:0] sbox7_output
);
    /*
    S7	x0000x	x0001x	x0010x	x0011x	x0100x	x0101x	x0110x	x0111x	x1000x	x1001x	x1010x	x1011x	x1100x	x1101x	x1110x	x1111x
0yyyy0	4	    11	    2	    14	    15	    0	    8	    13	    3	    12	    9	    7	    5	    10	    6	    1
0yyyy1	13	    0	    11	    7	    4	    9	    1	    10	    14	    3	    5	    12	    2	    15	    8	    6
1yyyy0	1	    4	    11	    13	    12	    3	    7	    14	    10	    15	    6	    8	    0	    5	    9	    2
1yyyy1	6	    11	    13	    8	    1	    4	    10	    7	    9	    5	    0	    15	    14	    2	    3	    12
    */
    always @(*) begin
        case ({sbox7_input[5], sbox7_input[0]})
            2'b00: begin
                case (sbox7_input[4:1])
                    4'b0000: sbox7_output = 4'd4;
                    4'b0001: sbox7_output = 4'd11;
                    4'b0010: sbox7_output = 4'd2;
                    4'b0011: sbox7_output = 4'd14;
                    4'b0100: sbox7_output = 4'd15;
                    4'b0101: sbox7_output = 4'd0;
                    4'b0110: sbox7_output = 4'd8;
                    4'b0111: sbox7_output = 4'd13;
                    4'b1000: sbox7_output = 4'd3;
                    4'b1001: sbox7_output = 4'd12;
                    4'b1010: sbox7_output = 4'd9;
                    4'b1011: sbox7_output = 4'd7;
                    4'b1100: sbox7_output = 4'd5;
                    4'b1101: sbox7_output = 4'd10;
                    4'b1110: sbox7_output = 4'd6;
                    4'b1111: sbox7_output = 4'd1;
                    default: sbox7_output = 4'b0; //should not happen
                endcase
            end 
            2'b01: begin
                case (sbox7_input[4:1])
                    4'b0000: sbox7_output = 4'd13;
                    4'b0001: sbox7_output = 4'd0;
                    4'b0010: sbox7_output = 4'd11;
                    4'b0011: sbox7_output = 4'd7;
                    4'b0100: sbox7_output = 4'd4;
                    4'b0101: sbox7_output = 4'd9;
                    4'b0110: sbox7_output = 4'd1;
                    4'b0111: sbox7_output = 4'd10;
                    4'b1000: sbox7_output = 4'd14;
                    4'b1001: sbox7_output = 4'd3;
                    4'b1010: sbox7_output = 4'd5;
                    4'b1011: sbox7_output = 4'd12;
                    4'b1100: sbox7_output = 4'd2;
                    4'b1101: sbox7_output = 4'd15;
                    4'b1110: sbox7_output = 4'd8;
                    4'b1111: sbox7_output = 4'd6;
                    default: sbox7_output = 4'b0; //should not happen
                endcase
                
            end
            2'b10: begin
                case (sbox7_input[4:1])
                    4'b0000: sbox7_output = 4'd1;
                    4'b0001: sbox7_output = 4'd4;
                    4'b0010: sbox7_output = 4'd11;
                    4'b0011: sbox7_output = 4'd13;
                    4'b0100: sbox7_output = 4'd12;
                    4'b0101: sbox7_output = 4'd3;
                    4'b0110: sbox7_output = 4'd7;
                    4'b0111: sbox7_output = 4'd14;
                    4'b1000: sbox7_output = 4'd10;
                    4'b1001: sbox7_output = 4'd15;
                    4'b1010: sbox7_output = 4'd6;
                    4'b1011: sbox7_output = 4'd8;
                    4'b1100: sbox7_output = 4'd0;
                    4'b1101: sbox7_output = 4'd5;
                    4'b1110: sbox7_output = 4'd9;
                    4'b1111: sbox7_output = 4'd2;
                    default: sbox7_output = 4'b0; //should not happen
                endcase
                
            end
            2'b11: begin
                case (sbox7_input[4:1])
                    4'b0000: sbox7_output = 4'd6;
                    4'b0001: sbox7_output = 4'd11;
                    4'b0010: sbox7_output = 4'd13;
                    4'b0011: sbox7_output = 4'd8;
                    4'b0100: sbox7_output = 4'd1;
                    4'b0101: sbox7_output = 4'd4;
                    4'b0110: sbox7_output = 4'd10;
                    4'b0111: sbox7_output = 4'd7;
                    4'b1000: sbox7_output = 4'd9;
                    4'b1001: sbox7_output = 4'd5;
                    4'b1010: sbox7_output = 4'd0;
                    4'b1011: sbox7_output = 4'd15;
                    4'b1100: sbox7_output = 4'd14;
                    4'b1101: sbox7_output = 4'd2;
                    4'b1110: sbox7_output = 4'd3;
                    4'b1111: sbox7_output = 4'd12;
                    default: sbox7_output = 4'b0; //should not happen
                endcase
                
            end
            default: begin
                sbox7_output = 4'b0; //should not happen 
            end
        endcase
        
    end
endmodule

module sbox8(
    input [5:0] sbox8_input,
    output reg [3:0] sbox8_output
);
    /*
    S8	x0000x	x0001x	x0010x	x0011x	x0100x	x0101x	x0110x	x0111x	x1000x	x1001x	x1010x	x1011x	x1100x	x1101x	x1110x	x1111x
0yyyy0	13	    2	    8	    4	    6	    15	    11	    1	    10	    9	    3	    14	    5	    0	    12	    7
0yyyy1	1	    15	    13	    8	    10	    3	    7	    4	    12	    5	    6	    11	    0	    14	    9	    2
1yyyy0	7	    11	    4	    1	    9	    12	    14	    2	    0	    6	    10	    13	    15	    3	    5	    8
1yyyy1	2	    1	    14	    7	    4	    10	    8	    13	    15	    12	    9	    0	    3	    5	    6	    11
*/
    always @(*) begin
        case ({sbox8_input[5], sbox8_input[0]})
            2'b00: begin
                case (sbox8_input[4:1])
                    4'b0000: sbox8_output = 4'd13;
                    4'b0001: sbox8_output = 4'd2;
                    4'b0010: sbox8_output = 4'd8;
                    4'b0011: sbox8_output = 4'd4;
                    4'b0100: sbox8_output = 4'd6;
                    4'b0101: sbox8_output = 4'd15;
                    4'b0110: sbox8_output = 4'd11;
                    4'b0111: sbox8_output = 4'd1;
                    4'b1000: sbox8_output = 4'd10;
                    4'b1001: sbox8_output = 4'd9;
                    4'b1010: sbox8_output = 4'd3;
                    4'b1011: sbox8_output = 4'd14;
                    4'b1100: sbox8_output = 4'd5;
                    4'b1101: sbox8_output = 4'd0;
                    4'b1110: sbox8_output = 4'd12;
                    4'b1111: sbox8_output = 4'd7;
                    default: sbox8_output = 4'b0; //should not happen
                    
                endcase
            end 
            2'b01: begin
                case (sbox8_input[4:1])
                    4'b0000: sbox8_output = 4'd1;
                    4'b0001: sbox8_output = 4'd15;
                    4'b0010: sbox8_output = 4'd13;
                    4'b0011: sbox8_output = 4'd8;
                    4'b0100: sbox8_output = 4'd10;
                    4'b0101: sbox8_output = 4'd3;
                    4'b0110: sbox8_output = 4'd7;
                    4'b0111: sbox8_output = 4'd4;
                    4'b1000: sbox8_output = 4'd12;
                    4'b1001: sbox8_output = 4'd5;
                    4'b1010: sbox8_output = 4'd6;
                    4'b1011: sbox8_output = 4'd11;
                    4'b1100: sbox8_output = 4'd0;
                    4'b1101: sbox8_output = 4'd14;
                    4'b1110: sbox8_output = 4'd9;
                    4'b1111: sbox8_output = 4'd2;
                    default: sbox8_output = 4'b0; //should not happen 
                endcase
                
            end
            2'b10: begin
                case (sbox8_input[4:1])
                    4'b0000: sbox8_output = 4'd7;
                    4'b0001: sbox8_output = 4'd11;
                    4'b0010: sbox8_output = 4'd4;
                    4'b0011: sbox8_output = 4'd1;
                    4'b0100: sbox8_output = 4'd9;
                    4'b0101: sbox8_output = 4'd12;
                    4'b0110: sbox8_output = 4'd14;
                    4'b0111: sbox8_output = 4'd2;
                    4'b1000: sbox8_output = 4'd0;
                    4'b1001: sbox8_output = 4'd6;
                    4'b1010: sbox8_output = 4'd10;
                    4'b1011: sbox8_output = 4'd13;
                    4'b1100: sbox8_output = 4'd15;
                    4'b1101: sbox8_output = 4'd3;
                    4'b1110: sbox8_output = 4'd5;
                    4'b1111: sbox8_output = 4'd8;
                    default: sbox8_output = 4'b0; //should not happen 
                endcase
                
            end
            2'b11: begin
                case (sbox8_input[4:1])
                    4'b0000: sbox8_output = 4'd2;
                    4'b0001: sbox8_output = 4'd1;
                    4'b0010: sbox8_output = 4'd14;
                    4'b0011: sbox8_output = 4'd7;
                    4'b0100: sbox8_output = 4'd4;
                    4'b0101: sbox8_output = 4'd10;
                    4'b0110: sbox8_output = 4'd8;
                    4'b0111: sbox8_output = 4'd13;
                    4'b1000: sbox8_output = 4'd15;
                    4'b1001: sbox8_output = 4'd12;
                    4'b1010: sbox8_output = 4'd9;
                    4'b1011: sbox8_output = 4'd0;
                    4'b1100: sbox8_output = 4'd3;
                    4'b1101: sbox8_output = 4'd5;
                    4'b1110: sbox8_output = 4'd6;
                    4'b1111: sbox8_output = 4'd11;
                    default: sbox8_output = 4'b0; //should not happen 
                endcase
                
            end
            default: begin
                sbox8_output = 4'b0; //should not happen 
            end
            
        endcase
    end
endmodule

