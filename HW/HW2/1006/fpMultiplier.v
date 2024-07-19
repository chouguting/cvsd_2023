module fpMultiplier (
    input[31:0] i_data_a, i_data_b,
    output reg[31:0]  o_cal_result
);

    wire [7:0] a_expon, b_expon;
    wire [22:0] a_mantissa, b_mantissa;

    assign a_sign = i_data_a[31];
    assign b_sign = i_data_b[31];  
    assign a_expon = i_data_a[30:23];
    assign b_expon = i_data_b[30:23];
    assign a_mantissa = i_data_a[22:0];
    assign b_mantissa = i_data_b[22:0];


    //calculate sign
    wire sign_result;
    assign sign_result = a_sign ^ b_sign; //


    //mantissa multiplication
    wire[49:0] multiplication_result = {1'b1,a_mantissa} * {1'b1,b_mantissa};

    //exponent result
    wire[7:0] exponent_temp;
    assign exponent_temp = a_expon + b_expon - 127;

    //find leading one
    wire [5:0]  leading_one_location;
    wire [49:0] multiplication_result_normalized;
    leading_one_finder_shifter_50_bit lofs_mult(.input_pattern(multiplication_result),.location(leading_one_location),.shifted_pattern(multiplication_result_normalized));

    wire[7:0] exponent_after_normalized;
    assign exponent_after_normalized = exponent_temp + leading_one_location - 46;

    //mantissa result
    wire[22:0] mantissa_result;
    assign mantissa_result = multiplication_result_normalized[48:26];

    //rounding
    wire guard_bit, round_bit, sticky_bit;
    assign guard_bit = multiplication_result_normalized[26];  //bit 26
    assign round_bit = multiplication_result_normalized[25];  //bit 25
    assign sticky_bit = |multiplication_result_normalized[24:0]; //bit 24 to 0


    always @(*) begin
        if((round_bit==1'b1 && sticky_bit==1'b1) || (guard_bit==1'b1 && round_bit==1'b1)) begin
            if(&mantissa_result) begin //if mantissa part is all 1, we add one to the exponent
                if(&exponent_after_normalized) begin //but if the exponent part is all 1 we don't add one
                    o_cal_result = {sign_result, exponent_after_normalized, 23'b0};
                end
                else begin
                    o_cal_result = {sign_result, exponent_after_normalized + 1'b1, 23'b0};
                end
            end
            else begin
                o_cal_result = {sign_result, exponent_after_normalized, mantissa_result} +1;
            end
        end
        else
            o_cal_result = {sign_result, exponent_after_normalized, mantissa_result};
    end

    
endmodule