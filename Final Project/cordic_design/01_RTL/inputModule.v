module inputModule (
    input          i_clk,
    input          i_rst,
    input          i_input_valid,
    input  [ 47:0] i_data,   //24bit of imaginary part, 24bit of real part {imaginary, real}
    output reg        o_data_valid,
    //H is a 4x4 matrix, each element is 48bit
    output reg [47:0] o_h11,   //index (1,1) of H 
    output reg [47:0] o_h12,   //index (1,2) of H
    output reg [47:0] o_h13,   //index (1,3) of H
    output reg [47:0] o_h14,   //index (1,4) of H
    output reg [47:0] o_h21,   //index (2,1) of H
    output reg [47:0] o_h22,   //index (2,2) of H
    output reg [47:0] o_h23,   //index (2,3) of H
    output reg [47:0] o_h24,   //index (2,4) of H
    output reg [47:0] o_h31,   //index (3,1) of H
    output reg [47:0] o_h32,   //index (3,2) of H
    output reg [47:0] o_h33,   //index (3,3) of H
    output reg [47:0] o_h34,   //index (3,4) of H
    output reg [47:0] o_h41,   //index (4,1) of H
    output reg [47:0] o_h42,   //index (4,2) of H
    output reg [47:0] o_h43,   //index (4,3) of H
    output reg [47:0] o_h44,   //index (4,4) of H

    //Y ins a vector with 4 elements, each element is 48bit
    output reg [47:0] o_y1,   //index (1) of Y
    output reg [47:0] o_y2,   //index (2) of Y
    output reg [47:0] o_y3,   //index (3) of Y
    output reg [47:0] o_y4,   //index (4) of Y
);

    //states: 
    reg[4:0] current_state, next_state;
    //the input data order is:
    //H11, H12, H13, H14, Y1, H21, H22, H23, H24, Y2
    //H31, H32, H33, H34, Y3, H41, H42, H43, H44, Y4
    //20 cycles in total, need 5 bits to represent

    localparam STATE_START = 5'd0;
    localparam STATE_WAIT_H11 = 5'd1;
    localparam STATE_WAIT_H12 = 5'd2;
    localparam STATE_WAIT_H13 = 5'd3;
    localparam STATE_WAIT_H14 = 5'd4;
    localparam STATE_WAIT_Y1 = 5'd5;
    localparam STATE_WAIT_H21 = 5'd6;
    localparam STATE_WAIT_H22 = 5'd7;
    localparam STATE_WAIT_H23 = 5'd8;
    localparam STATE_WAIT_H24 = 5'd9;
    localparam STATE_WAIT_Y2 = 5'd10;
    localparam STATE_WAIT_H31 = 5'd11;
    localparam STATE_WAIT_H32 = 5'd12;
    localparam STATE_WAIT_H33 = 5'd13;
    localparam STATE_WAIT_H34 = 5'd14;
    localparam STATE_WAIT_Y3 = 5'd15;
    localparam STATE_WAIT_H41 = 5'd16;
    localparam STATE_WAIT_H42 = 5'd17;
    localparam STATE_WAIT_H43 = 5'd18;
    localparam STATE_WAIT_H44 = 5'd19;
    localparam STATE_WAIT_Y4 = 5'd20;
    localparam STATE_OUTPUT_READY_AND_WAIT_H11 = 5'd21;


    //controling registers
    reg save_to_h11, save_to_h12, save_to_h13, save_to_h14, save_to_y1;
    reg save_to_h21, save_to_h22, save_to_h23, save_to_h24, save_to_y2;
    reg save_to_h31, save_to_h32, save_to_h33, save_to_h34, save_to_y3;
    reg save_to_h41, save_to_h42, save_to_h43, save_to_h44, save_to_y4;

    //sequential logic
    always @ (posedge i_clk or posedge i_rst) begin : sequential_logic
        if (i_rst) begin
            current_state <= STATE_START;
            //clear all registers
            o_h11 <= 48'd0;
            o_h12 <= 48'd0;
            o_h13 <= 48'd0;
            o_h14 <= 48'd0;
            o_y1 <= 48'd0;
            o_h21 <= 48'd0;
            o_h22 <= 48'd0;
            o_h23 <= 48'd0;
            o_h24 <= 48'd0;
            o_y2 <= 48'd0;
            o_h31 <= 48'd0;
            o_h32 <= 48'd0;
            o_h33 <= 48'd0;
            o_h34 <= 48'd0;
            o_y3 <= 48'd0;
            o_h41 <= 48'd0;
            o_h42 <= 48'd0;
            o_h43 <= 48'd0;
            o_h44 <= 48'd0;
            o_y4 <= 48'd0;

        end
        else begin
            current_state <= next_state;

            if(save_to_h11) begin
                o_h11 <= i_data;
            end
            if(save_to_h12) begin
                o_h12 <= i_data;
            end
            if(save_to_h13) begin
                o_h13 <= i_data;
            end
            if(save_to_h14) begin
                o_h14 <= i_data;
            end
            if(save_to_y1) begin
                o_y1 <= i_data;
            end
            if(save_to_h21) begin
                o_h21 <= i_data;
            end
            if(save_to_h22) begin
                o_h22 <= i_data;
            end
            if(save_to_h23) begin
                o_h23 <= i_data;
            end
            if(save_to_h24) begin
                o_h24 <= i_data;
            end
            if(save_to_y2) begin
                o_y2 <= i_data;
            end
            if(save_to_h31) begin
                o_h31 <= i_data;
            end
            if(save_to_h32) begin
                o_h32 <= i_data;
            end
            if(save_to_h33) begin
                o_h33 <= i_data;
            end
            if(save_to_h34) begin
                o_h34 <= i_data;
            end
            if(save_to_y3) begin
                o_y3 <= i_data;
            end
            if(save_to_h41) begin
                o_h41 <= i_data;
            end
            if(save_to_h42) begin
                o_h42 <= i_data;
            end
            if(save_to_h43) begin
                o_h43 <= i_data;
            end
            if(save_to_h44) begin
                o_h44 <= i_data;
            end
            if(save_to_y4) begin
                o_y4 <= i_data;
            end

        end
    end


    //FSM
    always @(*) begin: FSM_0
        //default
        next_state = current_state;
        o_data_valid = 0;
        
        //controling registers
        save_to_h11 = 0;
        save_to_h12 = 0;
        save_to_h13 = 0;
        save_to_h14 = 0;
        save_to_y1 = 0;
        save_to_h21 = 0;
        save_to_h22 = 0;
        save_to_h23 = 0;
        save_to_h24 = 0;
        save_to_y2 = 0;
        save_to_h31 = 0;
        save_to_h32 = 0;
        save_to_h33 = 0;
        save_to_h34 = 0;
        save_to_y3 = 0;
        save_to_h41 = 0;
        save_to_h42 = 0;
        save_to_h43 = 0;
        save_to_h44 = 0;
        save_to_y4 = 0;

        //states
        case (current_state)
            STATE_START: begin
                next_state = STATE_WAIT_H11;
            end
            STATE_WAIT_H11: begin
                if(i_input_valid) begin
                    save_to_h11 = 1;
                    next_state = STATE_WAIT_H12;
                end
            end
            STATE_WAIT_H12: begin
                if(i_input_valid) begin
                    save_to_h12 = 1;
                    next_state = STATE_WAIT_H13;
                end
            end
            STATE_WAIT_H13: begin
                if(i_input_valid) begin
                    save_to_h13 = 1;
                    next_state = STATE_WAIT_H14;
                end
            end
            STATE_WAIT_H14: begin
                if(i_input_valid) begin
                    save_to_h14 = 1;
                    next_state = STATE_WAIT_Y1;
                end
            end
            STATE_WAIT_Y1: begin
                if(i_input_valid) begin
                    save_to_y1 = 1;
                    next_state = STATE_WAIT_H21;
                end
            end
            STATE_WAIT_H21: begin
                if(i_input_valid) begin
                    save_to_h21 = 1;
                    next_state = STATE_WAIT_H22;
                end
            end
            STATE_WAIT_H22: begin
                if(i_input_valid) begin
                    save_to_h22 = 1;
                    next_state = STATE_WAIT_H23;
                end
            end
            STATE_WAIT_H23: begin
                if(i_input_valid) begin
                    save_to_h23 = 1;
                    next_state = STATE_WAIT_H24;
                end
            end
            STATE_WAIT_H24: begin
                if(i_input_valid) begin
                    save_to_h24 = 1;
                    next_state = STATE_WAIT_Y2;
                end
            end
            STATE_WAIT_Y2: begin
                if(i_input_valid) begin
                    save_to_y2 = 1;
                    next_state = STATE_WAIT_H31;
                end
            end
            STATE_WAIT_H31: begin
                if(i_input_valid) begin
                    save_to_h31 = 1;
                    next_state = STATE_WAIT_H32;
                end
            end
            STATE_WAIT_H32: begin
                if(i_input_valid) begin
                    save_to_h32 = 1;
                    next_state = STATE_WAIT_H33;
                end
            end
            STATE_WAIT_H33: begin
                if(i_input_valid) begin
                    save_to_h33 = 1;
                    next_state = STATE_WAIT_H34;
                end
            end
            STATE_WAIT_H34: begin
                if(i_input_valid) begin
                    save_to_h34 = 1;
                    next_state = STATE_WAIT_Y3;
                end
            end
            STATE_WAIT_Y3: begin
                if(i_input_valid) begin
                    save_to_y3 = 1;
                    next_state = STATE_WAIT_H41;
                end
            end
            STATE_WAIT_H41: begin
                if(i_input_valid) begin
                    save_to_h41 = 1;
                    next_state = STATE_WAIT_H42;
                end
            end
            STATE_WAIT_H42: begin
                if(i_input_valid) begin
                    save_to_h42 = 1;
                    next_state = STATE_WAIT_H43;
                end
            end
            STATE_WAIT_H43: begin
                if(i_input_valid) begin
                    save_to_h43 = 1;
                    next_state = STATE_WAIT_H44;
                end
            end
            STATE_WAIT_H44: begin
                if(i_input_valid) begin
                    save_to_h44 = 1;
                    next_state = STATE_WAIT_Y4;
                end
            end
            STATE_WAIT_Y4: begin
                if(i_input_valid) begin
                    save_to_y4 = 1;
                    next_state = STATE_OUTPUT_READY_AND_WAIT_H11;
                end
            end
            STATE_OUTPUT_READY_AND_WAIT_H11: begin
                o_data_valid = 1; //signal that output is ready
                if(i_input_valid) begin  //if input is valid, then save to h11
                    save_to_h11 = 1; 
                    next_state = STATE_WAIT_H12; //next state is to wait for h12
                end
                else begin  
                    next_state = STATE_WAIT_H11; //if input is not valid, then wait for h11 
                end
            end
        endcase
    end   
endmodule