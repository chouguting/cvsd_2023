`timescale 1ns/1ps
`define CYCLE       5.0     // CLK period.
`define HCYCLE      (`CYCLE/2)
`define MAX_CYCLE   10000000
`define RST_DELAY   2


`ifdef tb1
    `define INFILE "../00_TESTBED/PATTERN/indata1.dat"
    `define OPFILE "../00_TESTBED/PATTERN/opmode1.dat"
    `define GOLDEN "../00_TESTBED/PATTERN/golden1.dat"
    `define PAT_NUM 80
`elsif tb2
    `define INFILE "../00_TESTBED/PATTERN/indata2.dat"
    `define OPFILE "../00_TESTBED/PATTERN/opmode2.dat"
    `define GOLDEN "../00_TESTBED/PATTERN/golden2.dat"
    `define PAT_NUM 320

`elsif tb3
    `define INFILE "../00_TESTBED/PATTERN/indata3.dat"
    `define OPFILE "../00_TESTBED/PATTERN/opmode3.dat"
    `define GOLDEN "../00_TESTBED/PATTERN/golden3.dat"
    `define PAT_NUM 320

`elsif tb4
    `define INFILE "../00_TESTBED/PATTERN/indata4.dat"
    `define OPFILE "../00_TESTBED/PATTERN/opmode4.dat"
    `define GOLDEN "../00_TESTBED/PATTERN/golden4.dat"
    `define PAT_NUM 708
/////////////////////////////////////////////////////
`elsif tb5
    `define INFILE "../00_TESTBED/Huan_PATTERN/indata1.dat"
    `define OPFILE "../00_TESTBED/Huan_PATTERN/opmode1.dat"
    `define GOLDEN "../00_TESTBED/Huan_PATTERN/golden1.dat"
    `define PAT_NUM 59140

`elsif tb6
    `define INFILE "../00_TESTBED/Huan_PATTERN/indata2.dat"
    `define OPFILE "../00_TESTBED/Huan_PATTERN/opmode2.dat"
    `define GOLDEN "../00_TESTBED/Huan_PATTERN/golden2.dat"
    `define PAT_NUM 56172

`elsif tb7
    `define INFILE "../00_TESTBED/Huan_PATTERN/indata3.dat"
    `define OPFILE "../00_TESTBED/Huan_PATTERN/opmode3.dat"
    `define GOLDEN "../00_TESTBED/Huan_PATTERN/golden3.dat"
    `define PAT_NUM 54308

`elsif tb8
    `define INFILE "../00_TESTBED/Huan_PATTERN/indata4.dat"
    `define OPFILE "../00_TESTBED/Huan_PATTERN/opmode4.dat"
    `define GOLDEN "../00_TESTBED/Huan_PATTERN/golden4.dat"
    `define PAT_NUM 15980

`elsif tb9
    `define INFILE "../00_TESTBED/Huan_PATTERN/indata5.dat"
    `define OPFILE "../00_TESTBED/Huan_PATTERN/opmode5.dat"
    `define GOLDEN "../00_TESTBED/Huan_PATTERN/golden5.dat"
    `define PAT_NUM 17036

`elsif tb10
    `define INFILE "../00_TESTBED/Huan_PATTERN/indata6.dat"
    `define OPFILE "../00_TESTBED/Huan_PATTERN/opmode6.dat"
    `define GOLDEN "../00_TESTBED/Huan_PATTERN/golden6.dat"
    `define PAT_NUM 16716

`elsif tb11
    `define INFILE "../00_TESTBED/Huan_PATTERN/indata_conv.dat"
    `define OPFILE "../00_TESTBED/Huan_PATTERN/opmode_conv.dat"
    `define GOLDEN "../00_TESTBED/Huan_PATTERN/golden_conv.dat"
    `define PAT_NUM 588

`elsif tb12
    `define INFILE "../00_TESTBED/Huan_PATTERN/indata_display.dat"
    `define OPFILE "../00_TESTBED/Huan_PATTERN/opmode_display.dat"
    `define GOLDEN "../00_TESTBED/Huan_PATTERN/golden_display.dat"
    `define PAT_NUM 2048

`elsif tb13
    `define INFILE "../00_TESTBED/Huan_PATTERN/indata_median.dat"
    `define OPFILE "../00_TESTBED/Huan_PATTERN/opmode_median.dat"
    `define GOLDEN "../00_TESTBED/Huan_PATTERN/golden_median.dat"
    `define PAT_NUM 2352

`elsif tb14
    `define INFILE "../00_TESTBED/Huan_PATTERN/indata_sobel.dat"
    `define OPFILE "../00_TESTBED/Huan_PATTERN/opmode_sobel.dat"
    `define GOLDEN "../00_TESTBED/Huan_PATTERN/golden_sobel.dat"
    `define PAT_NUM 2352
/////////////////////////////////////////////////////

`else
    `define INFILE "../00_TESTBED/PATTERN/indata0.dat"
    `define OPFILE "../00_TESTBED/PATTERN/opmode0.dat"
    `define GOLDEN "../00_TESTBED/PATTERN/golden0.dat"
    `define PAT_NUM 1984

`endif

`define SDFFILE "core_syn.sdf"  // Modify your sdf file name


module testbed;

reg         clk, rst_n;
wire        op_valid;
wire [ 3:0] op_mode;
wire        op_ready;
wire        in_valid;
wire [ 7:0] in_data;
wire        in_ready;
wire        out_valid;
wire [13:0] out_data;

reg  [ 7:0] indata_mem [0:2047];
reg  [ 3:0] opmode_mem [0:1000000];
reg  [13:0] golden_mem [0:10000000];

// ==============================================
// TODO: Declare regs and wires you need
// ==============================================
reg [ 7:0] in_data_r;
reg [ 3:0] op_mode_r;
reg [ 3:0] op_now;
reg [ 3:0] test_OP;
reg [13:0] test_outD;
reg        op_valid_r;
reg        in_valid_r;
reg        op_ready_r;
integer    mode_idx;
integer    data_idx;
integer    i;
integer    j;
integer    error;
integer    correct;
integer    over;

assign in_data = in_data_r;
assign op_valid = op_valid_r;
assign op_mode = op_mode_r;
assign in_valid = in_valid_r;

// For gate-level simulation only
`ifdef SDF
    initial $sdf_annotate(`SDFFILE, u_core);
    initial #1 $display("SDF File %s were used for this simulation.", `SDFFILE);
`endif

// Write out waveform file
initial begin
  $fsdbDumpfile("core.fsdb");
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

// Read in test pattern and golden pattern
initial $readmemb(`INFILE, indata_mem);
initial $readmemb(`OPFILE, opmode_mem);
initial $readmemb(`GOLDEN, golden_mem);

// Clock generation
initial clk = 1'b0;
always begin #(`CYCLE/2) clk = ~clk; end

// Reset generation
initial begin
    mode_idx = 0;
    data_idx = 0;
    j        = 0;
    error    = 0;
    correct  = 0;
    over     = 0;
    reset;
	#(`CYCLE);
	@(posedge clk);
end

// ==============================================
// TODO: Check pattern after process finish
// ==============================================


always @(negedge clk) begin
    if (out_valid) begin
        test_OP = opmode_mem[mode_idx-1];
        test_outD = golden_mem[j];
        if (test_outD !== out_data) begin
            $display (
                "Test[%d]: Error! OP=%b, Golden=%b, Yours=%b " , 
                j, test_OP, test_outD, out_data
            );      
            error = error+1;        
        end else if (test_outD === out_data) begin
            // $display (
            //     "Test[%d]: True! OP=%b, Golden=%b, Yours=%b " , 
            //     j, test_OP, test_outD, out_data
            // );      
            correct = correct + 1;
        end
        j = j + 1;
    end
    if (j < `PAT_NUM)  over = 0;
    else               over = 1;
end
always @(negedge clk) begin
    if(op_ready_r) begin
        op_valid_r = 1;
    end
    else begin
        op_valid_r = 0;
    end
end
always @(negedge clk) begin
    if(op_now==0&&data_idx!=2048) begin
        in_valid_r = 1;
    end
    else begin
        in_valid_r = 0;
    end
end


always @(negedge clk) begin
    if(op_valid) begin
        op_mode_r = opmode_mem[mode_idx];
        op_now = opmode_mem[mode_idx];
        mode_idx = mode_idx + 1;
    end
    else begin
        op_mode_r = 0;
    end
end

always @(negedge clk) begin
    if(in_valid && in_ready) begin
        in_data_r = indata_mem[data_idx];
        data_idx = data_idx + 1;
    end
    else begin
        in_data_r = indata_mem[data_idx];;
    end
end
always @(negedge clk) begin
    op_ready_r = op_ready;  
end

task reset; begin
    rst_n = 1;# ( 0.25 * `CYCLE);
    rst_n = 0;# ((`RST_DELAY - 0.25) * `CYCLE);
    rst_n = 1;# ( `MAX_CYCLE * `CYCLE);
end endtask

initial begin
    wait(over);
    if(error === 0 && correct === `PAT_NUM) begin
        $display("----------------------------------------------");
        $display("-                 ALL PASS!                  -");
        $display("----------------------------------------------");
    end else begin
        $display("----------------------------------------------");
        $display("  Wrong! Total error: %d                      ", error);
        $display("----------------------------------------------");
    end
    # (2 * `CYCLE);
    $finish;
end    

initial begin
    # (`MAX_CYCLE * `CYCLE);
    $display("----------------------------------------------");
    $display("Latency of your design is over 100000 cycles!!");
    $display("----------------------------------------------");
    $finish;
end

endmodule
