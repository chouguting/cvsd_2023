module alu #(
    parameter INT_W  = 6,
    parameter FRAC_W = 10,
    parameter INST_W = 4,
    parameter DATA_W = INT_W + FRAC_W
)(
    input                     i_clk,
    input                     i_rst_n,
    input signed [DATA_W-1:0] i_data_a,
    input signed [DATA_W-1:0] i_data_b,
    input        [INST_W-1:0] i_inst,
    output   reg              o_valid,
    output   reg              o_busy,
    output   reg    [DATA_W-1:0] o_data
);

    //temp output for fsm
    reg save_to_o_data;  //pass o_data_temp to o_data when save_to_o_data=1


    //single cycle calculation  unit for  I0~I4
    reg save_calculation_result;
    reg  signed  [DATA_W-1:0] calculation_unit_out; 
    reg signed   [DATA_W-1:0]  calculation_unit_out_saved; //saved cal_out
    //input for calculation unit
    reg signed [DATA_W-1:0] cal_in_a, cal_in_b;
    reg[3:0] cal_a_source, cal_b_source; //input source control for calculation unit
    //SOURCE PARAMETER
    localparam SOURCE_i_data_a = 4'd0;
    localparam SOURCE_i_data_b = 4'd1;
    localparam SOURCE_cal_out_saved = 4'd2;
    localparam SOURCE_o_data = 4'd3;
    localparam SOURCE_GPR_0 = 4'd4;
    localparam SOURCE_GPR_1 = 4'd5;
    localparam SOURCE_GPR_2 = 4'd6;


    //add some general_purpose_registers
    reg signed [DATA_W-1:0] general_purpose_register_0, general_purpose_register_1, general_purpose_register_2;
    reg signed  [DATA_W-1:0] GPR_in_0, GPR_in_1, GPR_in_2;
    reg save_to_GPR_0, save_to_GPR_1, save_to_GPR_2;
 





    reg  [INST_W-1:0] calculation_control;
    //operations for calculation unit
    localparam CAL_SIGNED_FX_ADD = 4'd0;
    localparam CAL_SIGNED_FX_SUB = 4'd1;
    localparam CAL_SIGNED_FX_MULT = 4'd2;
    localparam CAL_PASS_A = 4'd3;
    localparam CAL_GELU = 4'd4;


    //special calculations
    wire  signed  [DATA_W*2-1:0] signed_mult_result; 
    wire  signed  [DATA_W-1:0] gelu_result;

    // assign big_mult_before_tanh = (16'sb0000001100110001) * i_data_a * ((i_data_a * i_data_a * 16'sb0000000000101110) + {{17{1'b0}},1'b1,{30{1'b0}}});


    

    //FSM state
    reg[4:0] current_state, next_state;
    //state parameter
    localparam START = 5'd0;
    localparam READY = 5'd1;
    localparam WAIT =  5'd2;
    localparam CALCULATE =  5'd3;
    localparam FINISH =  5'd4;

    //states for multicycle calculations
    localparam CONTINUE_MAC =  5'd5;


  


    





    always@(posedge i_clk or negedge i_rst_n) begin
        if(!i_rst_n) begin
            current_state <= START;
            o_data <= 0;
            calculation_unit_out_saved <= 0;
            general_purpose_register_0 <= 0;
            general_purpose_register_1 <= 0;
            general_purpose_register_2 <= 0;

        end
        else begin
            current_state <= next_state;
            if(save_to_o_data) o_data <= calculation_unit_out;
            if(save_calculation_result) calculation_unit_out_saved <= calculation_unit_out;
            if(save_to_GPR_0) general_purpose_register_0 <= GPR_in_0;
            if(save_to_GPR_1) general_purpose_register_1 <= GPR_in_1;
            if(save_to_GPR_2) general_purpose_register_2 <= GPR_in_2;

        end
    end

    



    //FSM
    always@(*) begin
        //default value
        next_state = current_state;
        // o_data_temp = 0;
        o_busy = 1;
        o_valid = 0;
        calculation_control = 0;
        save_to_o_data = 0;
        save_calculation_result = 0;
        cal_a_source = SOURCE_i_data_a;
        cal_b_source = SOURCE_i_data_b;

        //general_purpose_registers control
        save_to_GPR_0 = 0;
        save_to_GPR_1 = 0;
        save_to_GPR_2 = 0;
        GPR_in_0 = 0;
        GPR_in_1 = 0;
        GPR_in_2 = 0;

        case (current_state)
            START: begin
                next_state = READY;
            end 
            READY: begin
                o_busy = 0;  //signal I'm ready
                next_state = WAIT;
            end
            WAIT: begin  //wait for data
                next_state = CALCULATE;
            end
            CALCULATE: begin
                //multicycle calculations
                if(i_inst == 3) begin//MAC
                    calculation_control = CAL_SIGNED_FX_MULT;  //multiplt a and b
                    next_state = CONTINUE_MAC;
                    save_to_o_data = 0;  //don't save o_data yet
                    save_calculation_result = 1;
                end
                else if(i_inst == 4) begin//GELU
                    calculation_control = CAL_GELU;
                    cal_a_source = SOURCE_i_data_a;
                    next_state = FINISH;
                    save_to_o_data = 1;
                end
                else begin
                    calculation_control = i_inst;
                    // o_data_temp = calculation_unit_out;
                    next_state = FINISH;
                    save_to_o_data = 1;  //save on next clk
                end 
            end
            CONTINUE_MAC: begin
                //add a*b and old_o_out;
                calculation_control = CAL_SIGNED_FX_ADD;
                cal_a_source = SOURCE_cal_out_saved;
                cal_b_source = SOURCE_o_data;   
                save_to_o_data = 1;
                next_state = FINISH;
            end
            
            FINISH: begin
                o_valid = 1;
                next_state = READY;
            end
        endcase
    end

    //input control of single cycle calculation unit
    always@(*) begin
        case (cal_a_source)
            SOURCE_i_data_a:
                cal_in_a = i_data_a; 
            SOURCE_i_data_b:
                cal_in_a = i_data_b;     
            SOURCE_cal_out_saved:
                cal_in_a = calculation_unit_out_saved;
            SOURCE_o_data:
                cal_in_a = o_data;
            SOURCE_GPR_0:
                cal_in_a = general_purpose_register_0;
            SOURCE_GPR_1:
                cal_in_a = general_purpose_register_1;
            SOURCE_GPR_2:
                cal_in_a = general_purpose_register_2;    
            default: 
                cal_in_a = i_data_a; 
        endcase

        case (cal_b_source)
            SOURCE_i_data_a:
                cal_in_b = i_data_a; 
            SOURCE_i_data_b:
                cal_in_b = i_data_b; 
            SOURCE_cal_out_saved:
                cal_in_b = calculation_unit_out_saved;
            SOURCE_o_data:
                cal_in_b = o_data;
            SOURCE_GPR_0:
                cal_in_b = general_purpose_register_0;
            SOURCE_GPR_1:
                cal_in_b = general_purpose_register_1;
            SOURCE_GPR_2:
                cal_in_b = general_purpose_register_2;  
            default: 
                cal_in_b = i_data_b; 
        endcase
    end

    //multiply with sign extension
    // assign signed_mult_result = {{DATA_W{i_data_a[DATA_W-1]}},i_data_a} * {{DATA_W{i_data_b[DATA_W-1]}},i_data_b};
    assign signed_mult_result = cal_in_a * cal_in_b;

    GELU gelu_0(.intput_x(cal_in_a),.output_result(gelu_result));
    //single cycle calculation unit
    always@(*) begin
        //default
        calculation_unit_out = 0;
        case (calculation_control)
            CAL_SIGNED_FX_ADD : begin  //Signed Addition (FX)
                calculation_unit_out = cal_in_a + cal_in_b;
                if( cal_in_a[DATA_W-1] == 1'b0 &&cal_in_b[DATA_W-1] == 1'b0 && calculation_unit_out[DATA_W-1] == 1'b1) 
                    calculation_unit_out = {1'b0, {(DATA_W-1){1'b1}}};
                else if ( cal_in_a[DATA_W-1] == 1'b1 &&cal_in_b[DATA_W-1] == 1'b1 && calculation_unit_out[DATA_W-1] == 1'b0) 
                    calculation_unit_out = {1'b1, {(DATA_W-1){1'b0}}};
            end
            CAL_SIGNED_FX_SUB : begin  //Signed Subtraction (FX)
                calculation_unit_out = cal_in_a - cal_in_b;    
                if( cal_in_a[DATA_W-1] == 1'b0 && cal_in_b[DATA_W-1] == 1'b1 && calculation_unit_out[DATA_W-1] == 1'b1) 
                    calculation_unit_out = {1'b0, {(DATA_W-1){1'b1}}};
                else if ( cal_in_a[DATA_W-1] == 1'b1 &&cal_in_b[DATA_W-1] == 1'b0 && calculation_unit_out[DATA_W-1] == 1'b0) 
                    calculation_unit_out = {1'b1, {(DATA_W-1){1'b0}}};
            end
            CAL_SIGNED_FX_MULT: begin  //Signed Multiplication (FX)
                //check the integer part
                // the maximum value of a 6 bit two's complement integer is 011111b = 31, 
                // when adding the fraction part, 31.xxx is possible
                // the minimum value of a 6 bit two's complement integer is 100000b = -32, 
                // when adding the fraction part, -32.xx is not possible
                if($signed(signed_mult_result[DATA_W*2-1:FRAC_W*2]) > 31)  
                    calculation_unit_out = {1'b0, {(DATA_W-1){1'b1}}};
                else if($signed(signed_mult_result[DATA_W*2-1:FRAC_W*2]) <= -32)
                    calculation_unit_out = {1'b1, {(DATA_W-1){1'b0}}};
                else begin
                    if(signed_mult_result[FRAC_W-1:0] >= {1'b1,{(FRAC_W-1){1'b0}}})
                        calculation_unit_out = signed_mult_result[DATA_W-1+FRAC_W:FRAC_W] + 1;
                    else
                        calculation_unit_out = signed_mult_result[DATA_W-1+FRAC_W:FRAC_W];

                    
                end
            end
            CAL_PASS_A: begin
                calculation_unit_out = cal_in_a;
            end
            CAL_GELU: begin
                calculation_unit_out = gelu_result;
            end
            
            

        endcase
    end
    
    

endmodule



module  GELU#(
    parameter INT_W  = 6,
    parameter FRAC_W = 10,
    parameter INST_W = 4,
    parameter DATA_W = INT_W + FRAC_W
)(
    input signed [DATA_W-1:0]   intput_x,
    output reg signed [DATA_W-1:0]  output_result  
);

    wire  signed  [DATA_W*5-1:0] big_mult_before_tanh;

    wire  signed  [DATA_W*2-1:0] x_other_part, x_squared;
    wire  signed  [DATA_W*3-1:0] x_first_part;
    wire  signed  [DATA_W*2-1:0] half_of_x;
    wire  signed  [DATA_W*3-1:0] final_before_round;

    reg signed [DATA_W-1:0] rounded_before_tanh, after_tanh;
    wire signed [DATA_W-1:0] plus_one_after_tanh;


    assign x_squared = intput_x * intput_x;   // x * x
    assign x_first_part = x_squared * 16'sb0000000000101110 + $signed({{17{1'b0}},1'b1,{30{1'b0}}}); //  0.044921875*x^2 + 1
    assign x_other_part = (16'sb0000001100110001) * intput_x;  //0.7978515625 * x
    assign big_mult_before_tanh = x_other_part *x_first_part ;  //0.7978515625x * (1 + 0.044921875*x^2)

    assign plus_one_after_tanh = after_tanh + 16'sb0000010000000000;  //tanh(0.7978515625x * (1 + 0.044921875*x^2)) + 1
    assign half_of_x = intput_x * 16'sb0000001000000000;   //0.5x
    assign final_before_round = half_of_x * plus_one_after_tanh;  //
     

     //ROUND
    always@(*) begin
        //defaults
        rounded_before_tanh = 0;   
        if(big_mult_before_tanh[4*FRAC_W-1:0] >= {1'b1,{(FRAC_W*4-1){1'b0}}})
            rounded_before_tanh = big_mult_before_tanh[DATA_W-1+4*FRAC_W:4*FRAC_W] + 1;
        else
            rounded_before_tanh = big_mult_before_tanh[DATA_W-1+4*FRAC_W:4*FRAC_W];    
    end 


    //tanh and ROUND
    always @(*) begin
        //default
        after_tanh = 0;
        if(rounded_before_tanh <= 16'sb1111101000000000) begin  //x <= -1.5
            after_tanh = 16'sb1111110000000000; //-1
        end
        else if(rounded_before_tanh > 16'sb1111101000000000 && rounded_before_tanh <= 16'sb1111111000000000) begin //x > -1.5 && x <= -0.5
            if({-rounded_before_tanh}[0] == 1'b0)
                after_tanh = -((-rounded_before_tanh >>> 1) + 1'b1) + 16'sb1111111100000000;
            else
                after_tanh = -((-rounded_before_tanh) >>> 1) + 16'sb1111111100000000;
        end
        else if(rounded_before_tanh > 16'sb1111111000000000 && rounded_before_tanh <= 16'sb0000001000000000) begin //x > -0.5 && x <= 0.5
            after_tanh = rounded_before_tanh;
        end
        else if(rounded_before_tanh > 16'sb0000001000000000 && rounded_before_tanh <= 16'sb0000011000000000) begin //x > 0.5 && x <= 1.5
            if(rounded_before_tanh[0] == 1)
                after_tanh = (rounded_before_tanh >>> 1) + 1'b1 + 16'sb0000000100000000;
            else
                after_tanh = (rounded_before_tanh >>> 1) + 16'sb0000000100000000;
        end
        else if(rounded_before_tanh > 16'sb0000011000000000 ) begin //x > 1.5
            after_tanh = 16'sb0000010000000000;  //1
        end
    end

    always @(*) begin
        if(final_before_round[2*FRAC_W-1:0] >= {1'b1,{(FRAC_W*2-1){1'b0}}})
            output_result = final_before_round[DATA_W-1+2*FRAC_W:2*FRAC_W] + 1;
        else
            output_result = final_before_round[DATA_W-1+2*FRAC_W:2*FRAC_W];
    end


endmodule

