`timescale 1ns/100ps
`define CYCLE       5.0     // CLK period.
`define HCYCLE      (`CYCLE/2)
`define MAX_CYCLE   10000000
`define RST_DELAY   2


module test_sram_write;

reg         clk, rst_n;
reg        op_valid;
reg  [ 3:0] op_mode;
wire        op_ready;
reg        in_valid;
reg [ 7:0] in_data;
wire        in_ready;
wire        out_valid;
wire [13:0] out_data;




// Write out waveform file
initial begin
  $fsdbDumpfile("write_sram.fsdb");
  $fsdbDumpvars(0, "+mda");
end


core u_core (
	.i_clk       (clk),
	.i_rst_n     (rst_n),
	.i_op_valid  (op_valid),
	.i_op_mode   (op_mode),
    .o_op_ready  (op_ready),
	.i_in_valid  (in_valid),
	.i_in_data   (in_data),
	.o_in_ready  (in_ready),
	.o_out_valid (out_valid),
	.o_out_data  (out_data)
);


// Clock generation
initial clk = 1'b0;
always begin #(`CYCLE/2) clk = ~clk; end

// Reset generation
initial begin
    rst_n = 1; # (               0.25 * `CYCLE);
    rst_n = 0; # ((`RST_DELAY - 0.25) * `CYCLE);
    rst_n = 1; # (         `MAX_CYCLE * `CYCLE);
    $display("Error! Runtime exceeded!");
    $finish;
end

initial begin: tests
    integer i;
    #0 op_valid = 0; op_mode = 0;  in_valid = 0; in_data = 0;
    @(negedge clk);
    wait (op_ready === 1) 
    @(negedge clk);
    @(negedge clk);
    op_valid = 1; op_mode = 0; 
    @(negedge clk);
    op_valid = 0; 
    
    i = 0;
    while(i<2048) begin
        @(negedge clk);
        if (in_ready === 1)begin
            
            in_valid = 1;
            in_data = i;
            i = i + 1;
        end
    end
    i = 0;
    while(i<2048) begin
        @(negedge clk);
        i = i + 1;
    end
    #(`CYCLE*10) $finish;
end



endmodule
