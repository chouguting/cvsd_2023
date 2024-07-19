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
    reg    [DATA_W-1:0] o_data_temp;

    //single cycle calculation for  I0~I4
    reg  signed  [DATA_W-1:0] single_cycle_calculate_out; 

    //
    wire  signed  [DATA_W*2-1:0] signed_mult_result; 



    //state parameter
    localparam START = 4'd0;
    localparam READY = 4'd1;
    localparam WAIT =  4'd2;
    localparam CALCULATE =  4'd3;
    localparam FINISH =  4'd4;

    //FSM state
    reg[3:0] current_state, next_state;


    always@(posedge i_clk or negedge i_rst_n) begin
        if(!i_rst_n) begin
            current_state <= START;
            o_data <= 0;
        end
        else begin
            current_state <= next_state;
            o_data <= o_data_temp;
        end
    end



    //FSM
    always@(*) begin
        //default value
        next_state = current_state;
        o_data_temp = 0;
        o_busy = 1;
        o_valid = 0;

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
                o_data_temp = single_cycle_calculate_out;
                next_state = FINISH;
            end
            FINISH: begin
                o_valid = 1;
                next_state = READY;
            end
        endcase
    end

    //multiply with sign extension
    // assign signed_mult_result = {{DATA_W{i_data_a[DATA_W-1]}},i_data_a} * {{DATA_W{i_data_b[DATA_W-1]}},i_data_b};
    assign signed_mult_result = i_data_a * i_data_b;

    //single cycle calculation
    always@(*) begin
        //default
        single_cycle_calculate_out = 0;
        case (i_inst)
            0 : begin
                single_cycle_calculate_out = i_data_a + i_data_b;
                if( i_data_a[DATA_W-1] == 1'b0 &&i_data_b[DATA_W-1] == 1'b0 && single_cycle_calculate_out[DATA_W-1] == 1'b1) 
                    single_cycle_calculate_out = {1'b0, {(DATA_W-1){1'b1}}};
                else if ( i_data_a[DATA_W-1] == 1'b1 &&i_data_b[DATA_W-1] == 1'b1 && single_cycle_calculate_out[DATA_W-1] == 1'b0) 
                    single_cycle_calculate_out = {1'b1, {(DATA_W-1){1'b0}}};
            end
            1 : begin
                single_cycle_calculate_out = i_data_a - i_data_b;    
                if( i_data_a[DATA_W-1] == 1'b0 && i_data_b[DATA_W-1] == 1'b1 && single_cycle_calculate_out[DATA_W-1] == 1'b1) 
                    single_cycle_calculate_out = {1'b0, {(DATA_W-1){1'b1}}};
                else if ( i_data_a[DATA_W-1] == 1'b1 &&i_data_b[DATA_W-1] == 1'b0 && single_cycle_calculate_out[DATA_W-1] == 1'b0) 
                    single_cycle_calculate_out = {1'b1, {(DATA_W-1){1'b0}}};
            end
            2: begin
                //check the integer part
                // the maximum value of a 6 bit two's complement integer is 011111b = 31, 
                // when adding the fraction part, 31.xxx is possible
                // the minimum value of a 6 bit two's complement integer is 100000b = -32, 
                // when adding the fraction part, -32.xx is not possible
                if($signed(signed_mult_result[DATA_W*2-1:FRAC_W*2]) > 31)  
                    single_cycle_calculate_out = {1'b0, {(DATA_W-1){1'b1}}};
                else if($signed(signed_mult_result[DATA_W*2-1:FRAC_W*2]) <= -32)
                    single_cycle_calculate_out = {1'b1, {(DATA_W-1){1'b0}}};
                else begin
                    if(signed_mult_result[FRAC_W-1:0] > {1'b1,{(FRAC_W-1){1'b0}}})
                        single_cycle_calculate_out = signed_mult_result[DATA_W-1+FRAC_W:FRAC_W] + 1;
                    else
                        single_cycle_calculate_out = signed_mult_result[DATA_W-1+FRAC_W:FRAC_W];
                end
            end

        endcase
    end
    
    

endmodule


module twosComplementConverter #(
    parameter DATA_W = 8
)(
    input wire[DATA_W-1:0] in_num,
    output wire[DATA_W-1:0] out_converted
);
    assign out_converted = ~in_num + 1'b1;
endmodule
