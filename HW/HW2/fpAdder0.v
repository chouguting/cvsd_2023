module fpAdder(
    // input i_clk, i_reset,
    input[31:0] i_data_a, i_data_b,
    input i_operation, //operation=0: ADD, operation=1:SUB
    // output reg output_ready,
    output[31:0]  o_cal_result
);

    wire a_sign, b_sign;
    wire [7:0] a_expon, b_expon, bigger_expon;
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
    reg[26:0] smaller_number, bigger_number;
    

    always @(*) begin
        if(a_expon_bigger_flag) begin
            bigger_number = {3'b001,a_mantissa,1'b0};
            smaller_number = {3'b001,b_mantissa,1'b0};
        end
        else begin
            bigger_number = {3'b001,b_mantissa,1'b0};
            smaller_number = {3'b001,a_mantissa,1'b0};
        end
    end

    //smaller number have to shift
    wire[26:0] smaller_number_shifted;
    assign smaller_number_shifted = smaller_number >> exponent_difference;

    reg[26:0] smaller_number_before_alu, bigger_number_before_alu;
    //complement before add
    always @(*) begin
        if(a_expon_bigger_flag) begin //a is bigger
            if(a_sign==1 && b_sign == 0) begin
                bigger_number_before_alu = ~bigger_number +1'b1;
                smaller_number_before_alu = smaller_number_shifted;
            end
            else if(a_sign==0 && b_sign == 1) begin
                bigger_number_before_alu = bigger_number;
                smaller_number_before_alu = ~smaller_number_shifted + 1'b1;
            end
            else begin //a_sign == b_sign
                smaller_number_before_alu = smaller_number_shifted;
                bigger_number_before_alu = bigger_number;
            end
        end
        else begin //b is bigger
            if(a_sign==1 && b_sign == 0) begin
                bigger_number_before_alu = bigger_number;
                smaller_number_before_alu = ~smaller_number_shifted + 1'b1;
            end
            else if(a_sign==0 && b_sign == 1) begin
                bigger_number_before_alu = ~bigger_number + 1'b1;
                smaller_number_before_alu = smaller_number_shifted;
            end
            else begin //a
                smaller_number_before_alu = smaller_number_shifted;
                bigger_number_before_alu = bigger_number;
            end
        end
    end


    //big alu
    wire [26:0] calculate_result;
    assign calculate_result = smaller_number_before_alu + bigger_number_before_alu;

    //evaluate sign of result
    wire result_sign;
    assign result_sign = calculate_result[26];

    //if result is negative, convert back to positive
    reg [26:0] calculate_result_positive;
    always @(*) begin
        if(result_sign == 1) 
            calculate_result_positive = ~calculate_result + 1'b1;
        else 
            calculate_result_positive = calculate_result;
    end

    wire[4:0] leading_one_location;
    wire signed [4:0] normalize_shift_amount; 
    assign normalize_shift_amount = 24 - leading_one_location;
    wire[26:0] normalized_result;
    wire[22:0] mantissa_result;
    wire[7:0] exponent_result;

    //normalize
    leading_one_finder_shifter_27_bit lof0(
        .input_pattern(calculate_result_positive),
        .location(leading_one_location),
        .shifted_pattern(normalized_result)
    );

    assign mantissa_result = normalized_result[23:1];
    exponent_result = $signed(bigger_expon) + $signed(normalize_shift_amount);

    //output
    assign o_cal_result = {result_sign, exponent_result, mantissa_result};



    



endmodule


module leading_one_finder_shifter_27_bit (
    input[26:0] input_pattern,
    output[4:0] reg location,
    output[26:0] shifted_pattern
);
    //find leading one
    always@(*)begin
        if(input_pattern[26] == 1) begin
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

    shifted_pattern = input_pattern << (26 - location);

    
endmodule