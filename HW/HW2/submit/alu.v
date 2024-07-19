module alu(
    input[31:0] i_data_a, i_data_b,
    input[3:0] i_operation,
    output reg[31:0] o_alu_result,
    output reg o_overflow_flag,
    output o_equal
);
    localparam ALU_INT_ADD = 4'd0;
    localparam ALU_INT_SUB = 4'd1;
    localparam ALU_INT_MULT = 4'd2;
    localparam ALU_FP_ADD = 4'd3;
    localparam ALU_FP_SUB = 4'd4;
    localparam ALU_FP_MULT = 4'd5;
    localparam ALU_AND = 4'd7;
    localparam ALU_OR = 4'd8;
    localparam ALU_NOR = 4'd9;
    
    localparam ALU_LESS = 4'd10;
    localparam ALU_L_SHIFT = 4'd11;
    localparam ALU_R_SHIFT = 4'd12;
    localparam ALU_INT_ADDU = 4'd13;
    localparam ALU_INT_SUBU = 4'd14;

    assign o_equal = (i_data_a == i_data_b);

    wire signed[61:0] multiplication_result;
    assign multiplication_result = $signed(i_data_a) * $signed(i_data_b);


    //modules
    reg fpAdder_operation;
    wire [31:0] fpAdder_result;
    wire [31:0] fpMultiplier_result;
    fpAdder fpa0(.i_data_a(i_data_a), .i_data_b(i_data_b),.i_operation(fpAdder_operation), .o_cal_result(fpAdder_result));
    fpMultiplier fpm0(.i_data_a(i_data_a), .i_data_b(i_data_b), .o_cal_result(fpMultiplier_result));


    always @(*) begin
        //default
        o_alu_result = 0;
        o_overflow_flag = 0;
        fpAdder_operation = 0;
        
        case (i_operation)
            ALU_INT_ADD: begin
                o_alu_result = i_data_a + i_data_b;
                //overflow
                if(i_data_a[31] == 1'b1 && i_data_b[31] == 1'b1 && o_alu_result[31]==1'b0) begin
                    o_overflow_flag = 1'b1;
                    o_alu_result = 32'sh80000000;
                end
                else if(i_data_a[31] == 1'b0 && i_data_b[31] == 1'b0 && o_alu_result[31]==1'b1) begin
                    o_overflow_flag = 1'b1;
                    o_alu_result = 32'sh7FFFFFFF;
                end
            end 
            ALU_INT_SUB: begin
                o_alu_result = i_data_a - i_data_b;
                //overflow
                if(i_data_a[31] == 1'b1 && i_data_b[31] == 1'b0 && o_alu_result[31]==1'b0) begin
                    o_overflow_flag = 1'b1;
                    o_alu_result = 32'sh80000000;
                end
                else if(i_data_a[31] == 1'b0 && i_data_b[31] == 1'b1 && o_alu_result[31]==1'b1) begin
                    o_overflow_flag = 1'b1;
                    o_alu_result = 32'sh7FFFFFFF;
                end
            end
            ALU_INT_MULT: begin
                o_alu_result = multiplication_result[31:0];
                if(multiplication_result > 32'sh7FFFFFFF) begin
                    o_overflow_flag = 1'b1;
                end
                else if(multiplication_result < 32'sh80000000) begin
                    o_overflow_flag = 1'b1;
                end
            end
            ALU_FP_ADD: begin
                fpAdder_operation = 0;
                o_alu_result = fpAdder_result;
            end
            ALU_FP_SUB: begin
                fpAdder_operation = 1;
                o_alu_result = fpAdder_result;
            end
            ALU_FP_MULT: begin
                o_alu_result = fpMultiplier_result;
            end
            ALU_AND: begin
                o_alu_result = i_data_a & i_data_b;
            end
            ALU_OR: begin
                o_alu_result = i_data_a | i_data_b;
            end
            ALU_NOR: begin
                o_alu_result = ~(i_data_a | i_data_b);
            end
            ALU_LESS: begin
                if($signed(i_data_a) < $signed(i_data_b)) begin
                    o_alu_result = 32'h1;
                end
                else begin
                    o_alu_result = 32'h0;
                end
            end
            ALU_L_SHIFT: begin
                o_alu_result = i_data_a << i_data_b;
            end
            ALU_R_SHIFT: begin
                o_alu_result = i_data_a >> i_data_b;
            end
            ALU_INT_ADDU: begin
                {o_overflow_flag, o_alu_result} = i_data_a + i_data_b;
            end
            ALU_INT_SUBU: begin
                o_alu_result = i_data_a - i_data_b;
                if(i_data_a < i_data_b) begin
                    o_overflow_flag = 1'b1;
                end
            end
            
        endcase
    end

    

    



endmodule