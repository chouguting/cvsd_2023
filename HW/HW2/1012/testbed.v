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



