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
                    o_cal_result = {result_sign, exponent_result+1'b1, 23'b0};
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

