`timescale 1ns/100ps
`define CYCLE       10.0
`define HCYCLE      (`CYCLE/2)
`define MAX_CYCLE   120000
`define RST_DELAY   2

`ifdef p0
    `define Inst "../00_TESTBED/PATTERN/p0/inst.dat"
	`define Stat "../00_TESTBED/PATTERN/p0/status.dat"
	`define Mem  "../00_TESTBED/PATTERN/p0/data.dat"
	`define STATUS_NUM 88
	`define MEMORY_SIZE 64
`endif

`ifdef p1
    `define Inst "../00_TESTBED/PATTERN/p1/inst.dat"
	`define Stat "../00_TESTBED/PATTERN/p1/status.dat"
	`define Mem  "../00_TESTBED/PATTERN/p1/data.dat"
	`define STATUS_NUM 13
	`define MEMORY_SIZE 64
`endif
// `define MEMORY_SIZE 64
// `ifdef p0
//     `define Inst   "../00_TESTBED/2022_PATTERN/p0/inst.dat"
//     `define Mem   "../00_TESTBED/2022_PATTERN/p0/data.dat"
//     `define Stat "../00_TESTBED/2022_PATTERN/p0/status.dat"
//     `define STATUS_NUM 71
// `elsif p1
//     `define Inst   "../00_TESTBED/2022_PATTERN/p1/inst.dat"
//     `define Mem   "../00_TESTBED/2022_PATTERN/p1/data.dat"
//     `define Stat "../00_TESTBED/2022_PATTERN/p1/status.dat"
//     `define STATUS_NUM 11
// `elsif h0
//     `define Inst   "../00_TESTBED/2022_PATTERN/h0/inst.dat"
//     `define Mem   "../00_TESTBED/2022_PATTERN/h0/data.dat"
//     `define Stat "../00_TESTBED/2022_PATTERN/h0/status.dat"
//     `define STATUS_NUM 13
// `elsif h1
//     `define Inst   "../00_TESTBED/2022_PATTERN/h1/inst.dat"
//     `define Mem   "../00_TESTBED/2022_PATTERN/h1/data.dat"
//     `define Stat "../00_TESTBED/2022_PATTERN/h1/status.dat"
//     `define STATUS_NUM 160
// `elsif h2
//     `define Inst   "../00_TESTBED/2022_PATTERN/h2/inst.dat"
//     `define Mem   "../00_TESTBED/2022_PATTERN/h2/data.dat"
//     `define Stat "../00_TESTBED/2022_PATTERN/h2/status.dat"
//     `define STATUS_NUM 160
// `elsif h3
//     `define Inst   "../00_TESTBED/2022_PATTERN/h3/inst.dat"
//     `define Mem   "../00_TESTBED/2022_PATTERN/h3/data.dat"
//     `define Stat "../00_TESTBED/2022_PATTERN/h3/status.dat"
//     `define STATUS_NUM 156
// `elsif h4
//     `define Inst   "../00_TESTBED/2022_PATTERN/h4/inst.dat"
//     `define Mem   "../00_TESTBED/2022_PATTERN/h4/data.dat"
//     `define Stat "../00_TESTBED/2022_PATTERN/h4/status.dat"
//     `define STATUS_NUM 94
// `elsif h5
//     `define Inst   "../00_TESTBED/2022_PATTERN/h5/inst.dat"
//     `define Mem   "../00_TESTBED/2022_PATTERN/h5/data.dat"
//     `define Stat "../00_TESTBED/2022_PATTERN/h5/status.dat"
//     `define STATUS_NUM 34
// `elsif h6
//     `define Inst   "../00_TESTBED/2022_PATTERN/h6/inst.dat"
//     `define Mem   "../00_TESTBED/2022_PATTERN/h6/data.dat"
//     `define Stat "../00_TESTBED/2022_PATTERN/h6/status.dat"
//     `define STATUS_NUM 158
// `elsif h7
//     `define Inst   "../00_TESTBED/2022_PATTERN/h7/inst.dat"
//     `define Mem   "../00_TESTBED/2022_PATTERN/h7/data.dat"
//     `define Stat "../00_TESTBED/2022_PATTERN/h7/status.dat"
//     `define STATUS_NUM 97
// `elsif h8
//     `define Inst   "../00_TESTBED/2022_PATTERN/h8/inst.dat"
//     `define Mem   "../00_TESTBED/2022_PATTERN/h8/data.dat"
//     `define Stat "../00_TESTBED/2022_PATTERN/h8/status.dat"
//     `define STATUS_NUM 33
// `elsif h9
//     `define Inst   "../00_TESTBED/2022_PATTERN/h9/inst.dat"
//     `define Mem   "../00_TESTBED/2022_PATTERN/h9/data.dat"
//     `define Stat "../00_TESTBED/2022_PATTERN/h9/status.dat"
//     `define STATUS_NUM 35
// `elsif h10
//     `define Inst   "../00_TESTBED/2022_PATTERN/h10/inst.dat"
//     `define Mem   "../00_TESTBED/2022_PATTERN/h10/data.dat"
//     `define Stat "../00_TESTBED/2022_PATTERN/h10/status.dat"
//     `define STATUS_NUM 66
// `elsif h11
//     `define Inst   "../00_TESTBED/2022_PATTERN/h11/inst.dat"
//     `define Mem   "../00_TESTBED/2022_PATTERN/h11/data.dat"
//     `define Stat "../00_TESTBED/2022_PATTERN/h11/status.dat"
//     `define STATUS_NUM 98
// `elsif h12
//     `define Inst   "../00_TESTBED/2022_PATTERN/h12/inst.dat"
//     `define Mem   "../00_TESTBED/2022_PATTERN/h12/data.dat"
//     `define Stat "../00_TESTBED/2022_PATTERN/h12/status.dat"
//     `define STATUS_NUM 34
// `elsif h13
//     `define Inst   "../00_TESTBED/2022_PATTERN/h13/inst.dat"
//     `define Mem   "../00_TESTBED/2022_PATTERN/h13/data.dat"
//     `define Stat "../00_TESTBED/2022_PATTERN/h13/status.dat"
//     `define STATUS_NUM 65
// `elsif h14
//     `define Inst   "../00_TESTBED/2022_PATTERN/h14/inst.dat"
//     `define Mem   "../00_TESTBED/2022_PATTERN/h14/data.dat"
//     `define Stat "../00_TESTBED/2022_PATTERN/h14/status.dat"
//     `define STATUS_NUM 34
// `elsif h15
//     `define Inst   "../00_TESTBED/2022_PATTERN/h15/inst.dat"
//     `define Mem   "../00_TESTBED/2022_PATTERN/h15/data.dat"
//     `define Stat "../00_TESTBED/2022_PATTERN/h15/status.dat"
//     `define STATUS_NUM 2
// `elsif h16
//     `define Inst   "../00_TESTBED/2022_PATTERN/h16/inst.dat"
//     `define Mem   "../00_TESTBED/2022_PATTERN/h16/data.dat"
//     `define Stat "../00_TESTBED/2022_PATTERN/h16/status.dat"
//     `define STATUS_NUM 1
// `elsif h17
//     `define Inst   "../00_TESTBED/2022_PATTERN/h17/inst.dat"
//     `define Mem   "../00_TESTBED/2022_PATTERN/h17/data.dat"
//     `define Stat "../00_TESTBED/2022_PATTERN/h17/status.dat"
//     `define STATUS_NUM 1006
// `elsif h18
//     `define Inst   "../00_TESTBED/2022_PATTERN/h18/inst.dat"
//     `define Mem   "../00_TESTBED/2022_PATTERN/h18/data.dat"
//     `define Stat "../00_TESTBED/2022_PATTERN/h18/status.dat"
//     `define STATUS_NUM 5
// `elsif h19
//     `define Inst   "../00_TESTBED/2022_PATTERN/h19/inst.dat"
//     `define Mem   "../00_TESTBED/2022_PATTERN/h19/data.dat"
//     `define Stat "../00_TESTBED/2022_PATTERN/h19/status.dat"
//     `define STATUS_NUM 5
// `endif

module testbed;

	reg clk, rst_n;
	wire [ 31 : 0 ] imem_addr;
	wire [ 31 : 0 ] imem_inst;
	wire            dmem_we;
	wire [ 31 : 0 ] dmem_addr;
	wire [ 31 : 0 ] dmem_wdata;
	wire [ 31 : 0 ] dmem_rdata;
	wire [  1 : 0 ] mips_status;
	wire            mips_status_valid;

	integer                  status_index;
	integer status_error, memory_error;
	reg[1:0]      status_data [0:`STATUS_NUM-1];
	reg[31:0]     memory [0:`MEMORY_SIZE-1];

	 

	initial begin
		$fsdbDumpfile("mips.fsdb"); 
        // $fsdbDumpvars;  
		$fsdbDumpvars(0, "testbed","+mda"); 
		$readmemb (`Inst, u_inst_mem.mem_r);
		$readmemb (`Stat, status_data);
		$readmemb (`Mem, memory);
		status_index = 0;
		status_error = 0;
		memory_error = 0;
	end

	
	initial clk = 0;
    always #(`CYCLE/2.0) clk = ~clk; 


	core u_core (
		.i_clk(clk),
		.i_rst_n(rst_n),
		.o_i_addr(imem_addr),
		.i_i_inst(imem_inst),
		.o_d_we(dmem_we),
		.o_d_addr(dmem_addr),
		.o_d_wdata(dmem_wdata),
		.i_d_rdata(dmem_rdata),
		.o_status(mips_status),
		.o_status_valid(mips_status_valid)
	);

	inst_mem  u_inst_mem (
		.i_clk(clk),
		.i_rst_n(rst_n),
		.i_addr(imem_addr),
		.o_inst(imem_inst)
	);

	data_mem  u_data_mem (
		.i_clk(clk),
		.i_rst_n(rst_n),
		.i_we(dmem_we),
		.i_addr(dmem_addr),
		.i_wdata(dmem_wdata),
		.o_rdata(dmem_rdata)
	);


	initial begin
		rst_n = 0;
		reset;
		#`MAX_CYCLE $finish;
		
	end

	task reset; begin
        # ( 0.25 * `CYCLE);
        rst_n = 0;    
        # ((`RST_DELAY) * `CYCLE);
        rst_n = 1;    
    end endtask

	task check_memory; 
	begin: mem_check
		integer i;
		integer error;
		error = 0;
		for(i=0; i<`MEMORY_SIZE; i=i+1) begin
			if(memory[i] === u_data_mem.mem_r[i]) begin
				$display("Memory[%6d] Good!! golden=%d yours=%d", i, memory[i], u_data_mem.mem_r[i]);
			end
			else begin
				$display("Memory[%6d] Error!! golden=%d yours=%d", i, memory[i], u_data_mem.mem_r[i]);
				error = error + 1;
			end
		end
		if(error === 0) begin
			$display("Memory check pass!!");
		end else begin
			$display("Memory check fail!!");
		end
		memory_error = error;
	end endtask


	always @(negedge clk) begin
		if(mips_status_valid) begin

			if(mips_status === status_data[status_index]) begin
				$display("[%6d]Good!!\tgolden=%d yours=%d\tpc=%3d\top=%3d\tinst=%b", status_index, status_data[status_index], mips_status, imem_addr-4,imem_inst[31:26], imem_inst);
			end else begin
				$display("[%6d]Error\tgolden=%d yours=%d\tpc=%3d\top=%3d\tinst=%b", status_index, status_data[status_index], mips_status, imem_addr-4,imem_inst[31:26], imem_inst);
				status_error = status_error + 1;
			end

			status_index = status_index + 1;
			
			if(mips_status === `MIPS_END || mips_status===`MIPS_OVERFLOW) begin
				check_memory;
				$display("All test done!!");
				$display("Status check pass!! total_error=%d", status_error);
				$display("Memory check pass!! total_error=%d", memory_error);
				$finish;
			end
		end
		
	end

	




endmodule



