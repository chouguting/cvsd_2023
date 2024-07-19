`timescale 1ns/100ps
`define CYCLE       5.0     // CLK period.
`define HCYCLE      (`CYCLE/2)
// `define MAX_CYCLE   10000000
`define MAX_CYCLE   10000

`define RST_DELAY   2


`ifdef tb1
    `define INFILE "../00_TESTBED/PATTERN/indata1.dat"
    `define OPFILE "../00_TESTBED/PATTERN/opmode1.dat"
    `define GOLDEN "../00_TESTBED/PATTERN/golden1.dat"
    `define OP_LENGTH 41
    `define GEOLDEN_NUM 80
`elsif tb2
    `define INFILE "../00_TESTBED/PATTERN/indata2.dat"
    `define OPFILE "../00_TESTBED/PATTERN/opmode2.dat"
    `define GOLDEN "../00_TESTBED/PATTERN/golden2.dat"
`elsif tb3
    `define INFILE "../00_TESTBED/PATTERN/indata3.dat"
    `define OPFILE "../00_TESTBED/PATTERN/opmode3.dat"
    `define GOLDEN "../00_TESTBED/PATTERN/golden3.dat"
`elsif tb4
    `define INFILE "../00_TESTBED/PATTERN/indata4.dat"
    `define OPFILE "../00_TESTBED/PATTERN/opmode4.dat"
    `define GOLDEN "../00_TESTBED/PATTERN/golden4.dat"
`else
    `define INFILE "../00_TESTBED/PATTERN/indata0.dat"
    `define OPFILE "../00_TESTBED/PATTERN/opmode0.dat"
    `define GOLDEN "../00_TESTBED/PATTERN/golden0.dat"
    `define OP_LENGTH 41
    `define GEOLDEN_NUM 1984
`endif

`define SDFFILE "core_syn.sdf"  // Modify your sdf file name


module testbed;

// reg         clk, rst_n;
// wire        op_valid;
// wire [ 3:0] op_mode;
// wire        op_ready;
// wire        in_valid;
// wire [ 7:0] in_data;
// wire        in_ready;
// wire        out_valid;
// wire [13:0] out_data;

reg         clk, rst_n;
reg        op_valid;
reg  [ 3:0] op_mode;
wire        op_ready;
reg        in_valid;
reg [ 7:0] in_data;
wire        in_ready;
wire        out_valid;
wire [13:0] out_data;

reg  [ 7:0] indata_mem [0:2047];
reg  [ 3:0] opmode_mem [0:1023];
reg  [13:0] golden_mem [0:4095];


// ==============================================
// TODO: Declare regs and wires you need
// ==============================================
integer indata_mem_index;
integer opmode_mem_index;
integer golden_mem_index;
integer errorCount;


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
    rst_n = 1; # (               0.25 * `CYCLE);
    rst_n = 0; # ((`RST_DELAY - 0.25) * `CYCLE);
    rst_n = 1; # (         `MAX_CYCLE * `CYCLE);
    $display("Error! Runtime exceeded!");
    $finish;
end

// ==============================================
// TODO: Check pattern after process finish
// ==============================================

initial begin: tests
    integer i, j;
    #0 op_valid = 0; op_mode = 0;  in_valid = 0; in_data = 0;
    errorCount = 0;
    indata_mem_index = 0;
    opmode_mem_index = 0;
    golden_mem_index = 0;
    for(i = 0;i< (`OP_LENGTH);i=i+1) begin
        @(negedge clk);
        wait (op_ready === 1) 
        @(negedge clk);
        @(negedge clk);
        op_valid = 1; op_mode = opmode_mem[i]; 
        @(negedge clk);
        op_valid = 0; 
        if(opmode_mem[i] === 0) begin
            for(j = 0;j<2048;j=j+1) begin
                @(negedge clk);
                if (in_ready === 1)begin
                    in_valid = 1;
                    in_data = indata_mem[indata_mem_index];
                    indata_mem_index = indata_mem_index + 1;
                end
            end
        end
    end
    
    
    // i = 0;
    // while(i<2048) begin
    //     @(negedge clk);
    //     if (in_ready === 1)begin
            
    //         in_valid = 1;
    //         in_data = i;
    //         i = i + 1;
    //     end
    // end
    // i = 0;
    // while(i<2048) begin
    //     @(negedge clk);
    //     i = i + 1;
    // end
    // #(`CYCLE*10) $finish;
end

always@(negedge clk) begin
    integer s;
    if(out_valid) begin
        if(out_data !== golden_mem[golden_mem_index]) begin
            $display("Error! golden_mem[%5d] = %d, out_data = %d", golden_mem_index, golden_mem[golden_mem_index], out_data);
            errorCount = errorCount + 1;
        end
        else begin
            $display("Good!! golden_mem[%5d] = %d, out_data = %d", golden_mem_index, golden_mem[golden_mem_index], out_data);
        end
        golden_mem_index = golden_mem_index + 1;
        if(golden_mem_index === `GEOLDEN_NUM) begin
            if(errorCount === 0)begin
                $display("Filished!! All data are correct!");
            end
            else begin
                $display("Filished!! errorCount = %d", errorCount);
            end
            
            for(s=0;s<5;s++) begin
                @(negedge clk);
            end
            $finish;
        end
    end
    
end


endmodule
