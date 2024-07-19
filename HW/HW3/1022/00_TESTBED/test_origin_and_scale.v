`timescale 1ns/100ps
`define CYCLE       5.0     // CLK period.
`define HCYCLE      (`CYCLE/2)
`define MAX_CYCLE   10000
`define RST_DELAY   2


module test_origin_and_scale;

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
  $fsdbDumpfile("origin_and_scale.fsdb");
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
    integer i, error;
    #0 op_valid = 0; op_mode = 0;  in_valid = 0; in_data = 0;

    //test origin right shift 10 times
    for(i=0;i<10;i=i+1) begin
        while(1) begin
            @(negedge clk);
            if (op_ready === 1)begin
                @(negedge clk);
                op_valid = 1; op_mode = 1; 
                @(negedge clk);
                op_valid = 0; 
                break;
            end
        end
    end

    //test origin down shift 10 times
    for(i=0;i<10;i=i+1) begin
        while(1) begin
            @(negedge clk);
            if (op_ready === 1)begin
                @(negedge clk);
                op_valid = 1; op_mode = 4; 
                @(negedge clk);
                op_valid = 0; 
                break;
            end
        end
    end

    //test origin left shift 10 times
    for(i=0;i<10;i=i+1) begin
        while(1) begin
            @(negedge clk);
            if (op_ready === 1)begin
                @(negedge clk);
                op_valid = 1; op_mode = 2; 
                @(negedge clk);
                op_valid = 0; 
                break;
            end
        end
    end

    //test origin up shift 10 times
    for(i=0;i<10;i=i+1) begin
        while(1) begin
            @(negedge clk);
            if (op_ready === 1)begin
                @(negedge clk);
                op_valid = 1; op_mode = 3; 
                @(negedge clk);
                op_valid = 0; 
                break;
            end
        end
    end

    //test scale down 5 times
    for(i=0;i<5;i=i+1) begin
        while(1) begin
            @(negedge clk);
            if (op_ready === 1)begin
                @(negedge clk);
                op_valid = 1; op_mode = 5; 
                @(negedge clk);
                op_valid = 0; 
                break;
            end
        end
    end

    //test scale up 5 times
    for(i=0;i<5;i=i+1) begin
        while(1) begin
            @(negedge clk);
            if (op_ready === 1)begin
                @(negedge clk);
                op_valid = 1; op_mode = 6; 
                @(negedge clk);
                op_valid = 0; 
                break;
            end
        end
    end
    
    #(`CYCLE*10) $finish;
end



endmodule
