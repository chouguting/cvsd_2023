module outputModule(
    input        clk,
    input        rst,
    input[127:0] data_for_output,
    input        data_valid,
    output reg[127:0]  output_data,  //output 8 bits at a time
    output reg      output_valid
);


    always @(posedge clk, posedge rst) begin
        if(rst) begin
            output_data <= 128'd0;
            output_valid <= 1'b0;
        end
        else begin
            output_data <= data_for_output;
            output_valid <= data_valid;
        end
    end
endmodule