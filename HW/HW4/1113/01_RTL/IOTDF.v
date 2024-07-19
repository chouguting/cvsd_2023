`timescale 1ns/10ps
module IOTDF( clk, rst, in_en, iot_in, fn_sel, busy, valid, iot_out);
input          clk;
input          rst;
input          in_en;
input  [7:0]   iot_in; //input 8 bits at a time
input  [2:0]   fn_sel;
output reg    busy;
output      valid;
output [127:0] iot_out;

    //functions
    localparam FUNCTION_DES_ENCRYPT = 3'b001;
    localparam FUNCTION_DES_DECRYPT = 3'b010;
    localparam FUNCTION_CRC = 3'b011;
    localparam FUNCTION_BINARY_TO_GRAY = 3'b100;

    wire[127:0] received_128_bit_data;
    wire        received_data_valid;
    inputReceiver input_receiver_0(
        .clk(clk),
        .rst(rst),
        .part_data_valid(in_en),
        .part_data_in(iot_in),
        .received_128_bit_data(received_128_bit_data),
        .received_data_valid(received_data_valid)
    );

    wire[127:0] des_data_out;
    wire        des_out_valid;
    wire    des_mode;
    assign des_mode = (fn_sel == FUNCTION_DES_ENCRYPT) ? 1'b0 : 1'b1;
    desModule des_module_0(
        .clk(clk),
        .rst(rst),
        .mode(des_mode),  //0 for encrypt, 1 for decrypt
        .des_data_in(received_128_bit_data),
        .des_start(received_data_valid),
        .des_data_out(des_data_out),
        .des_out_valid(des_out_valid)
    );

    wire[127:0] crc_data_out;
    wire        crc_out_valid;
    crcModule crc_module_0(
        .clk(clk),
        .rst(rst),
        .data_in(received_128_bit_data),
        .crc_start(received_data_valid),
        .crc_out_data(crc_data_out),
        .crc_out_valid(crc_out_valid)
    );

    wire[127:0] binary_gray_data_out;
    wire        binary_gray_data_out_valid;
    binaryGrayConverter binary_gray_converter_0(
        .clk(clk),
        .rst(rst),
        .mode(0), //0 for binary to gray, 1 for gray to binary
        .converter_start(received_data_valid),
        .data_in(received_128_bit_data),
        .data_out(binary_gray_data_out),
        .data_out_valid(binary_gray_data_out_valid)
    );

    wire[127:0] output_data;
    wire        output_valid;

    assign output_data = 
    (fn_sel == FUNCTION_DES_ENCRYPT) ? des_data_out : 
    (fn_sel == FUNCTION_DES_DECRYPT) ? des_data_out :
    (fn_sel == FUNCTION_CRC)? crc_data_out:
    (fn_sel == FUNCTION_BINARY_TO_GRAY)? binary_gray_data_out: 0;

    assign output_valid =
    (fn_sel == FUNCTION_DES_ENCRYPT) ? des_out_valid :
    (fn_sel == FUNCTION_DES_DECRYPT) ? des_out_valid : 
    (fn_sel == FUNCTION_CRC)? crc_out_valid:
    (fn_sel == FUNCTION_BINARY_TO_GRAY)? binary_gray_data_out_valid: 0;



    outputModule output_module_0(
        .clk(clk),
        .rst(rst),
        .data_for_output(output_data),
        .data_valid(output_valid),
        .output_data(iot_out),
        .output_valid(valid)
    );





    //states
    reg[3:0] cuerrent_state, next_state;
    localparam STATE_START = 4'd0;
    localparam STATE_WORKING = 4'd1;





    always @(posedge clk, posedge rst) begin
        if(rst) begin
            cuerrent_state <= STATE_START;
            
        end
        else begin
            cuerrent_state <= next_state;  
        end
    end


    //FSM
    always @(*) begin

        //default
        next_state = cuerrent_state;
        busy = 1'b1;

        

        case(cuerrent_state)
            STATE_START: begin
                next_state = STATE_WORKING;
                busy = 1'b1;
            end
            STATE_WORKING: begin
                busy = 1'b0;
            end
            
        endcase
    end


endmodule
