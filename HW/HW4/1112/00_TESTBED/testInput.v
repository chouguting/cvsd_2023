`timescale 1ns/10ps
`define SDFFILE     "./IOTDF_syn.sdf"     //Modify your sdf file name
`define CYCLE       6.5                   //Modify your CYCLE 
`define DEL         1.0
`define PAT_NUM     60
`define End_CYCLE  1000000 


module test;
reg           clk;
reg           rst;
reg           in_en;
reg  [7:0]    iot_in;
reg  [2:0]    fn_sel;
wire          busy;
wire          valid;
wire [127:0]  iot_out;
integer cycle_count;

localparam PAT_NUM = 60;




reg  [127:0]  pat_mem[0:PAT_NUM-1];
reg  [127:0]  in_tmp;
reg  [127:0]  out_tmp;
integer       i, j, x, in_l, out_h, out_l, pass, err, err_a;



IOTDF u_IOTDF( .clk        (clk        ),
               .rst        (rst        ),
               .in_en      (in_en      ), 
               .iot_in     (iot_in     ),
               .fn_sel     (fn_sel     ),
               .busy       (busy       ), 
               .valid      (valid      ), 
               .iot_out    (iot_out    )
               //.r_load_cnt (r_load_cnt),
               //.r_state    (r_state)
             );



initial begin
   cycle_count = 0;
   @(negedge clk);
   while (1) begin
      cycle_count = cycle_count + 1;
      @(negedge clk);
   end
end

initial	 $readmemh("../00_TESTBED/pattern1_data/pattern1.dat", pat_mem);


initial begin
   clk           = 1'b0;   
   rst           = 1'b0;
   in_en         = 1'b0;   
   i             = 0;
   j             = 0;
   x             = 0;
   in_l          = 0;
   out_h         = 0;
   out_l         = 0;
   pass          = 0;
   err           = 0;
   err_a         = 0;

end

always begin #(`CYCLE/2)  clk = ~clk; end


initial begin
    $fsdbDumpfile("test_input.fsdb");
    $fsdbDumpvars;
    $fsdbDumpMDA;
end

initial begin
   @(posedge clk)  #`DEL  rst = 1'b1;
   #`CYCLE                rst = 1'b0;

    $display("-----------------------------------------------------\n");  
    $display("Start to Send IOT Data & Compare ...");       
    $display("\n");       
   @(posedge clk)  ;
    while (i < PAT_NUM) begin
      if(!busy)begin     
         in_tmp   = pat_mem[i];
         in_l=127 - j*8; // j is begin from 0

         #`DEL;
         iot_in   =   in_tmp[in_l -: 8];
         // $display("P%02d:  iot_in=%02h, in_tmp[in_l -: 8] =  %02h", x, iot_in, in_tmp[in_l -: 8]);
         in_en    =   1'b1;  

         if(j<15)     j=j+1;
         else begin
                      j=0;
                      i=i+1;              
         end
      end
      else begin
         #`DEL;
         iot_in   = 8'h0;
         in_en    = 1'b0;  
      end
      @(posedge clk);  
    end
    if(busy)begin
	#`DEL;
        iot_in   = 8'h0;          
    	in_en    = 1'b0;
    end

   #(`CYCLE*60);
    $finish;
end




   
endmodule



