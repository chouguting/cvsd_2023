`timescale 1ns/100ps
`define CYCLE       10.0
`define HCYCLE      (`CYCLE/2)
`define MAX_CYCLE   120000
`define TEST_NUM    1000

module fpAdderTest;



    reg [31:0] i_data_a;
    reg [31:0] i_data_b;
    reg i_operation;
    wire [31:0] o_cal_result;
    fpAdder fp0(.i_data_a(i_data_a), .i_data_b(i_data_b), .i_operation(i_operation), .o_cal_result(o_cal_result));

    reg [64:0] program [0:`TEST_NUM];
    reg [31:0] answer [0:`TEST_NUM];
    reg [64:0] fetch;

    integer i,j,outfile,pat_error;

    initial begin
        // outfile=$fopen("fpAdderTestResult.txt");          //open one file for writing
        // if(!outfile) begin
        //     $display("Can not write file!");
        //     $finish;
        // end
        $fsdbDumpfile("fpAdder.fsdb"); 
        $fsdbDumpvars;  
        $readmemb("FP_ADD_IN.dat",program);
        $readmemb("FP_ADD_OUT.dat",answer);
        
        
        pat_error=0;
        
        i_data_a=0;i_data_b=0;i_operation=0;
        
            // test for instruction 0: Add
            for(i=0;i<`TEST_NUM;i=i+1) begin
                fetch=program[i];
                i_data_a=fetch[63:32];i_data_b=fetch[31:0];i_operation=fetch[64];
                #20 
                    if(o_cal_result !== answer[i]) 
                    begin
                    $display("[%d] %b + %b = %b. But your output is %b.",i, i_data_a,i_data_b,answer[i],o_cal_result);
                    pat_error=pat_error+1;
                    end   
                    else   
                    begin
                    $display("[%d] Good!! %b + %b = %b. ",i, i_data_a,i_data_b,o_cal_result);
                    
                    end                        
            
            end
            
            // test for instruction 1: Sub
            // for(i=0;i<16;i=i+1)
            // begin
            // for(j=0;j<16;j=j+1)
            // begin
            //     fetch=program[i*16+j+256];
            //     inputA=fetch[8:5];inputB=fetch[4:1];instruction=fetch[0];
            //     #20 
            //         if(alu_out !== answer[i*16+j+256]) 
            //         begin
            //         $fdisplay(outfile,"%b - %b should be %b. But your output is %b.",inputA,inputB,answer[i*16+j+256],alu_out);
            //         pat_error=pat_error+1;
            //         end                           
            // end
            // end
                
            if(!pat_error)
                $display("\nCongratulations!! Your Verilog Code is correct!!\n");
            else
                $display("\nYour Verilog Code has %d errors. \nPlease read alu_out.txt for details.\n",pat_error);
        #10 $finish;
    end


endmodule