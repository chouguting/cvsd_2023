module fpAdder(
    // input i_clk, i_reset,
    input[31:0] i_data_a, i_data_b,
    input i_operation, //operation=0: ADD, operation=1:SUB
    // output reg output_ready,
    output reg[31:0]  o_cal_result
);

    localparam  BIG_ALU_SIZE = 50;
    localparam  MISSING_ONE_LOCATION = BIG_ALU_SIZE - 3;
    wire a_sign, b_sign;
    wire [7:0] a_expon, b_expon;
    reg  [7:0]  bigger_expon;
    wire [22:0] a_mantissa, b_mantissa;

    assign a_sign = i_data_a[31];
    assign b_sign = i_data_b[31] ^ i_operation;  //+a-(-b) = a+b, +a-(+b) = a-b
    assign a_expon = i_data_a[30:23];
    assign b_expon = i_data_b[30:23];
    assign a_mantissa = i_data_a[22:0];
    assign b_mantissa = i_data_b[22:0];

    reg a_expon_bigger_flag; //indicate a's exponent is bigger

    //difference
    reg[8:0] exponent_difference;
    always @(*) begin
        if(a_expon >= b_expon) begin
            exponent_difference = a_expon - b_expon;
            a_expon_bigger_flag = 1;
            bigger_expon = a_expon;
        end
        else begin
            exponent_difference = b_expon - a_expon;
            a_expon_bigger_flag = 0;
            bigger_expon = b_expon;
        end
    end

    //big alu part
    reg[BIG_ALU_SIZE-1:0] smaller_number, bigger_number;
    

    always @(*) begin
        if(a_expon_bigger_flag) begin
            bigger_number = {3'b001,a_mantissa,24'b0};
            smaller_number = {3'b001,b_mantissa,24'b00};
        end
        else begin
            bigger_number = {3'b001,b_mantissa,24'b00};
            smaller_number = {3'b001,a_mantissa,24'b00};
        end
    end

    //smaller number have to shift
    wire[BIG_ALU_SIZE-1:0] smaller_number_shifted;
    assign smaller_number_shifted = smaller_number >> exponent_difference;
    

    reg[BIG_ALU_SIZE-1:0] smaller_number_before_alu, bigger_number_before_alu;
    //complement before add
    always @(*) begin
        if(a_expon_bigger_flag) begin //a is bigger
            if(a_sign==1)
                bigger_number_before_alu = ~bigger_number +1'b1;
            else
                bigger_number_before_alu = bigger_number;
            
            if(b_sign==1) 
                smaller_number_before_alu = ~smaller_number_shifted + 1'b1;
            else
                smaller_number_before_alu = smaller_number_shifted;
        end
        else begin //b is bigger
            if(b_sign==1)
                bigger_number_before_alu = ~bigger_number +1'b1;
            else
                bigger_number_before_alu = bigger_number;
            
            if(a_sign==1) 
                smaller_number_before_alu = ~smaller_number_shifted + 1'b1;
            else
                smaller_number_before_alu = smaller_number_shifted;
        end
    end


    //big alu
    wire [BIG_ALU_SIZE-1:0] calculate_result;
    assign calculate_result = smaller_number_before_alu + bigger_number_before_alu;

    //evaluate sign of result
    wire result_sign;
    assign result_sign = calculate_result[BIG_ALU_SIZE-1];

    //if result is negative, convert back to positive
    reg [BIG_ALU_SIZE-1:0] calculate_result_positive;
    always @(*) begin
        if(result_sign == 1) 
            calculate_result_positive = ~calculate_result + 1'b1;
        else 
            calculate_result_positive = calculate_result;
    end

    wire[5:0] leading_one_location;
    wire signed [5:0] normalize_shift_amount; 
    assign normalize_shift_amount = leading_one_location - MISSING_ONE_LOCATION;
    wire[BIG_ALU_SIZE-1:0] normalized_result;
    wire[22:0] mantissa_result;
    wire[7:0] exponent_result;

    //normalize
    leading_one_finder_shifter_50_bit lof0(
        .input_pattern(calculate_result_positive),
        .location(leading_one_location),
        .shifted_pattern(normalized_result)
    );

    assign mantissa_result = normalized_result[BIG_ALU_SIZE-2:BIG_ALU_SIZE-24];
    assign exponent_result = $signed(bigger_expon) + $signed(normalize_shift_amount);

    //rounding
    wire guard_bit, round_bit, sticky_bit;
    assign guard_bit = normalized_result[BIG_ALU_SIZE-24];  //bit 26
    assign round_bit = normalized_result[BIG_ALU_SIZE-25];  //bit 25
    assign sticky_bit = |normalized_result[BIG_ALU_SIZE-26:0]; //bit 24 to 0

    //output
    // assign o_cal_result = (normalized_result[2])?{result_sign, exponent_result, mantissa_result}+1:{result_sign, exponent_result, mantissa_result};
    always @(*) begin
        if((round_bit==1'b1 && sticky_bit==1'b1) || (guard_bit==1'b1 && round_bit==1'b1)) begin
            if(&mantissa_result) begin //if mantissa part is all 1, we add one to the exponent
                if(&exponent_result) begin //but if the exponent part is all 1 we don't add one
                    o_cal_result = {result_sign, exponent_result, 23'b0};
                end
                else begin
                    o_cal_result = {result_sign, exponent_result+1, 23'b0};
                end
            end
            else begin
                o_cal_result = {result_sign, exponent_result, mantissa_result} +1;
            end
        end
        else
            o_cal_result = {result_sign, exponent_result, mantissa_result};
    end


    



endmodule


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