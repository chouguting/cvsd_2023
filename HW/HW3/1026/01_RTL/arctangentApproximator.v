module arctangentApproximator (
    input signed[13:0] i_data_x,
    input signed[13:0] i_data_y,
    output reg signed [3:0] o_degree_approx
);

    localparam DEGREE_0 = 4'd0;
    localparam DEGREE_BETWEEN_0_AND_22_5 = 4'd1;
    localparam DEGREE_22_5 = 4'd2;
    localparam DEGREE_BETWEEN_22_5_AND_45 = 4'd3;
    localparam DEGREE_45 = 4'd4;
    localparam DEGREE_BETWEEN_45_AND_67_5 = 4'd5;
    localparam DEGREE_67_5 = 4'd6;
    localparam DEGREE_BETWEEN_67_5_AND_90 = 4'd7;
    //tan(deg(90)) is infinity, so we don't need to consider this case
    localparam DEGREE_BETWEEN_90_AND_112_5 = 4'd8;
    localparam DEGREE_112_5 = 4'd9;
    localparam DEGREE_BETWEEN_112_5_AND_135 = 4'd10;
    localparam DEGREE_135 = 4'd11;
    localparam DEGREE_BETWEEN_135_AND_157_5 = 4'd12;
    localparam DEGREE_157_5 = 4'd13;
    localparam DEGREE_BETWEEN_157_5_AND_180 = 4'd14;
    localparam DEGREE_180 = 4'd15;

    wire same_sign;
    assign same_sign = (i_data_x[13] == i_data_y[13] ); // 1 if same sign, 0 if different sign


    wire[13:0] abs_x, abs_y;
    assign abs_x = (i_data_x[13] == 1) ? (~i_data_x + 1) : i_data_x; 
    assign abs_y = (i_data_y[13] == 1) ? (~i_data_y + 1) : i_data_y;
    
    wire[21:0] abs_x_extended, abs_y_extended;
    assign abs_x_extended = {8'b0, abs_x }; //extend abs_x to 22 bits (the fraction part will be added after multiplication)
    assign abs_y_extended = {1'b0, abs_y, 7'b0}; //extend abs_y to 22 bits (14 bits plus 7 bits of fraction part,and 1 bit of sign)

    //14bits of integer part, 7 bits of fraction part, and 1 bit of sign bit, 22 bits in total
    
    wire[21:0] x_times_tan_0, x_times_tan_22_5, x_times_tan_45, x_times_tan_67_5;
    assign x_times_tan_0 = 0;
    assign x_times_tan_22_5 = abs_x_extended * 8'b0_0110101; //tan(deg(22.5)) = 0.0110101b
    assign x_times_tan_45 = abs_x_extended * 8'b1_0000000; //tan(deg(45)) = 1.0000000b
    assign x_times_tan_67_5 = abs_x_extended * 9'b10_0110101; //tan(deg(67.5)) = 10.0110101b


    always @(*) begin
        if(same_sign) begin
            if(abs_y_extended == x_times_tan_0)
                o_degree_approx = DEGREE_0;
            else if(abs_y_extended > x_times_tan_0 && abs_y_extended < x_times_tan_22_5)
                o_degree_approx = DEGREE_BETWEEN_0_AND_22_5;
            else if(abs_y_extended == x_times_tan_22_5)
                o_degree_approx = DEGREE_22_5;
            else if(abs_y_extended > x_times_tan_22_5 && abs_y_extended < x_times_tan_45)
                o_degree_approx = DEGREE_BETWEEN_22_5_AND_45;
            else if(abs_y_extended == x_times_tan_45)
                o_degree_approx = DEGREE_45;
            else if(abs_y_extended > x_times_tan_45 && abs_y_extended < x_times_tan_67_5)
                o_degree_approx = DEGREE_BETWEEN_45_AND_67_5;
            else if(abs_y_extended == x_times_tan_67_5)
                o_degree_approx = DEGREE_67_5;
            else //abs_y_extended > x_times_tan_67_5
                o_degree_approx = DEGREE_BETWEEN_67_5_AND_90;
        end
        else begin //sign is different
            if(abs_y_extended == x_times_tan_0)
                o_degree_approx = DEGREE_180;
            else if(abs_y_extended > x_times_tan_0 && abs_y_extended < x_times_tan_22_5)
                o_degree_approx = DEGREE_BETWEEN_157_5_AND_180;
            else if(abs_y_extended == x_times_tan_22_5)
                o_degree_approx = DEGREE_157_5;
            else if(abs_y_extended > x_times_tan_22_5 && abs_y_extended < x_times_tan_45)
                o_degree_approx = DEGREE_BETWEEN_135_AND_157_5;
            else if(abs_y_extended == x_times_tan_45)
                o_degree_approx = DEGREE_135;
            else if(abs_y_extended > x_times_tan_45 && abs_y_extended < x_times_tan_67_5)
                o_degree_approx = DEGREE_BETWEEN_112_5_AND_135;
            else if(abs_y_extended == x_times_tan_67_5)
                o_degree_approx = DEGREE_112_5;
            else //abs_y_extended > x_times_tan_67_5
                o_degree_approx = DEGREE_BETWEEN_90_AND_112_5;
            
        end
        
    end



    //compare the difference between x*tan and y
    // wire[21:0] diff_0, diff_22_5, diff_45, diff_67_5;
    // wire[21:0] diff_0_abs, diff_22_5_abs, diff_45_abs, diff_67_5_abs;
    // assign diff_0 = $signed(abs_y_extended); //y-0=abs(y)
    // assign diff_22_5 = $signed(abs_y_extended) - $signed(x_times_tan_22_5);
    // assign diff_45 = $signed(abs_y_extended) - $signed(x_times_tan_45);
    // assign diff_67_5 = $signed(abs_y_extended) - $signed(x_times_tan_67_5);

    // assign diff_0_abs = (diff_0[21] == 1) ? (~diff_0 + 1) : diff_0;
    // assign diff_22_5_abs = (diff_22_5[21] == 1) ? (~diff_22_5 + 1) : diff_22_5;
    // assign diff_45_abs = (diff_45[21] == 1) ? (~diff_45 + 1) : diff_45;
    // assign diff_67_5_abs = (diff_67_5[21] == 1) ? (~diff_67_5 + 1) : diff_67_5;

    //find the minimum difference degree
    // wire[21:0] min_01_value, min_23_value;
    // wire[2:0] min_01_degree, min_23_degree, min_0123_degree;
    
    // assign min_01_value = (diff_0_abs < diff_22_5_abs) ? diff_0_abs : diff_22_5_abs;
    // assign min_23_value = (diff_45_abs < diff_67_5_abs) ? diff_45_abs : diff_67_5_abs;

    // assign min_01_degree = (diff_0_abs < diff_22_5_abs) ? DEGREE_0 : DEGREE_22_5;
    // assign min_23_degree = (diff_45_abs < diff_67_5_abs) ? DEGREE_45 : DEGREE_67_5;
    // assign min_0123_degree = (min_01_value < min_23_value) ? min_01_degree : min_23_degree;

    //output the degree
    // always @(*) begin
    //     if(same_sign == 1) begin
    //         o_degree_approx = min_0123_degree;
    //     end
    //     else begin //different sign
    //         case (min_0123_degree)
    //             DEGREE_0: o_degree_approx = DEGREE_180; //-tan(deg(0)) = tan(deg(180))
    //             DEGREE_22_5: o_degree_approx = DEGREE_157_5; //-tan(deg(22.5)) = tan(deg(157.5))
    //             DEGREE_45: o_degree_approx = DEGREE_135; //-tan(deg(45)) = tan(deg(135))
    //             DEGREE_67_5: o_degree_approx = DEGREE_112_5; //-tan(deg(67.5)) = tan(deg(112.5))
    //             default: o_degree_approx = min_0123_degree; //should not happen
    //         endcase      
    //     end
        
    // end







endmodule