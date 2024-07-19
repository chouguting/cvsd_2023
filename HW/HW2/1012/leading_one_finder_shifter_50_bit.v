
module leading_one_finder_shifter_50_bit (
    input[49:0] input_pattern,
    output reg [5:0]  location,
    output[49:0] shifted_pattern
);
    //find leading one
    always@(*)begin
        if(input_pattern[49] == 1) begin
            location = 49;
        end
        else if(input_pattern[48] == 1) begin
            location = 48;
        end
        else if(input_pattern[47] == 1) begin
            location = 47;
        end
        else if(input_pattern[46] == 1) begin
            location = 46;
        end
        else if(input_pattern[45] == 1) begin
            location = 45;
        end
        else if(input_pattern[44] == 1) begin
            location = 44;
        end
        else if(input_pattern[43] == 1) begin
            location = 43;
        end
        else if(input_pattern[42] == 1) begin
            location = 42;
        end
        else if(input_pattern[41] == 1) begin
            location = 41;
        end
        else if(input_pattern[40] == 1) begin
            location = 40;
        end
        else if(input_pattern[39] == 1) begin
            location = 39;
        end
        else if(input_pattern[38] == 1) begin
            location = 38;
        end
        else if(input_pattern[37] == 1) begin
            location = 37;
        end
        else if(input_pattern[36] == 1) begin
            location = 36;
        end
        else if(input_pattern[35] == 1) begin
            location = 35;
        end
        else if(input_pattern[34] == 1) begin
            location = 34;
        end
        else if(input_pattern[33] == 1) begin
            location = 33;
        end
        else if(input_pattern[32] == 1) begin
            location = 32;
        end
        else if(input_pattern[31] == 1) begin
            location = 31;
        end
        else if(input_pattern[30] == 1) begin
            location = 30;
        end
        else if(input_pattern[29] == 1) begin
            location = 29;
        end
        else if(input_pattern[28] == 1) begin
            location = 28;
        end
        else if(input_pattern[27] == 1) begin
            location = 27;
        end
        else if(input_pattern[26] == 1) begin
            location = 26;
        end
        else if(input_pattern[25] == 1)begin
            location = 25;
        end
        else if(input_pattern[24] == 1)begin
            location = 24;
        end
        else if(input_pattern[23] == 1)begin
            location = 23;
        end
        else if(input_pattern[22] == 1)begin
            location = 22;
        end
        else if(input_pattern[21] == 1)begin
            location = 21;
        end
        else if(input_pattern[20] == 1)begin
            location = 20;
        end
        else if(input_pattern[19] == 1)begin
            location = 19;
        end
        else if(input_pattern[18] == 1)begin
            location = 18;
        end
        else if(input_pattern[17] == 1)begin
            location = 17;
        end
        else if(input_pattern[16] == 1)begin
            location = 16;
        end
        else if(input_pattern[15] == 1)begin
            location = 15;
        end
        else if(input_pattern[14] == 1)begin
            location = 14;
        end
        else if(input_pattern[13] == 1)begin
            location = 13;
        end
        else if(input_pattern[12] == 1)begin
            location = 12;
        end
        else if(input_pattern[11] == 1)begin
            location = 11;
        end
        else if(input_pattern[10] == 1)begin
            location = 10;
        end
        else if(input_pattern[9] == 1)begin
            location = 9;
        end
        else if(input_pattern[8] == 1)begin
            location = 8;
        end
        else if(input_pattern[7] == 1)begin
            location = 7;
        end
        else if(input_pattern[6] == 1)begin
            location = 6;
        end
        else if(input_pattern[5] == 1)begin
            location = 5;
        end
        else if(input_pattern[4] == 1)begin
            location = 4;
        end
        else if(input_pattern[3] == 1)begin
            location = 3;
        end
        else if(input_pattern[2] == 1)begin
            location = 2;
        end
        else if(input_pattern[1] == 1)begin
            location = 1;
        end
        else if(input_pattern[0] == 1)begin
            location = 0;
        end
        else begin
            location = 0;
        end       

    end

    assign shifted_pattern = input_pattern << (49 - location);

    
endmodule