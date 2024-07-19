module convolutionEngine (
    input i_clk,
    input i_rst_n,
    input i_start,
    input[1:0] i_filter_mode, //0: fixed_filter, 1: median filter 2: sobel filter+NMS
    output reg o_ready,
    output reg o_finished,
    output reg o_output_valid,
    output reg [13:0] o_output_data,
    input[3:0] i_origin_x, 
    input[3:0] i_origin_y,
    input[1:0] i_channel_window, //control the depth of convolution, 0: 8 channels, 1: 16 channels, 2: 32 channels
    output reg[3:0] o_mmu_x_index,
    output reg[3:0] o_mmu_y_index,
    //output reg[4:0] o_mmu_channel_index, //select bank
    output reg o_mmu_bank_select, //select bank
    input [7:0] i_sram0_input,
    input [7:0] i_sram1_input,
    input [7:0] i_sram2_input,
    input [7:0] i_sram3_input,
    input [7:0] i_sram4_input,
    input [7:0] i_sram5_input,
    input [7:0] i_sram6_input,
    input [7:0] i_sram7_input,
    input [7:0] i_sram8_input,
    input [7:0] i_sram9_input,
    input [7:0] i_sram10_input,
    input [7:0] i_sram11_input,
    input [7:0] i_sram12_input,
    input [7:0] i_sram13_input,
    input [7:0] i_sram14_input,
    input [7:0] i_sram15_input 
);
    //filter mode
    localparam FILTER_MODE_FIXED = 2'd0;
    localparam FILTER_MODE_MEDIAN = 2'd1;
    localparam FILTER_MODE_SOBEL_NMS = 2'd2;

    //channel window
    localparam CHANNEL_WINDOW_32 = 2'd2;
	localparam CHANNEL_WINDOW_16 = 2'd1;
	localparam CHANNEL_WINDOW_8 = 2'd0; 

    //sram data
    wire[7:0] sram_data[0:15];
    assign sram_data[0] = i_sram0_input;
    assign sram_data[1] = i_sram1_input;
    assign sram_data[2] = i_sram2_input;
    assign sram_data[3] = i_sram3_input;
    assign sram_data[4] = i_sram4_input;
    assign sram_data[5] = i_sram5_input;
    assign sram_data[6] = i_sram6_input;
    assign sram_data[7] = i_sram7_input;
    assign sram_data[8] = i_sram8_input;
    assign sram_data[9] = i_sram9_input;
    assign sram_data[10] = i_sram10_input;
    assign sram_data[11] = i_sram11_input;
    assign sram_data[12] = i_sram12_input;
    assign sram_data[13] = i_sram13_input;
    assign sram_data[14] = i_sram14_input;
    assign sram_data[15] = i_sram15_input;


    //states
    reg[4:0] current_state, next_state;
    localparam STATE_START = 5'd0;
    localparam STATE_WAIT = 5'd1;
    localparam STATE_COMPUTE_FIXED = 5'd2;
    localparam STATE_COMPUTE_FIXED_SECOND_BANK = 5'd3;
    localparam STATE_COMPUTE_MEDIAN = 5'd4;
    localparam STATE_OUTPUT_MEDIAN = 5'd5;
    localparam STATE_COMPUTE_SOBEL = 5'd6;
    localparam STATE_OUTPUT_SOBEL = 5'd8;
    localparam STATE_FINISH = 5'd10;

    //line buffer
    reg reset_line_buffer;
    reg shift_line_buffer;
    reg [7:0] line_buffer_sram[0:15][0:10];

    //counter
    reg[5:0] counter0_value;
    reg count_counter0, reset_counter0;

    //index counters
    reg [3:0] x_index_counter_value, y_index_counter_value;
    reg count_x_index_counter, count_y_index_counter;
    reg set_x_index_counter_to_conv_origin, set_y_index_counter_to_conv_origin;

    //multiplied with kernel
    //the convolution kernel is 3*3 with fixed value for every channel
    // the value of kenel:
    /*
    1/16 1/8 1/16  => kernel 0: 1/16, kernel 1: 1/8, kernel 2: 1/16
    1/8  1/4 1/8   => kernel 3: 1/8, kernel 4: 1/4, kernel 5: 1/8
    1/16 1/8 1/16  => kernel 6: 1/16, kernel 7: 1/8, kernel 8: 1/16
    */
    //we can right shift the result by 4 to get the result of 1/16
    //we can right shift the result by 3 to get the result of 1/8
    //we can right shift the result by 2 to get the result of 1/4
    //since the max shift is 4, we can use 8+4 = 12 bits to store the result
    reg[11:0] multiplied_with_kernel[0:15][0:8]; //for every channel, we have 9 data
    //the output is 14 bit, 14+4 = 18 bits
    reg[17:0] multiplied_with_kernel_sigle_channel_sum[0:15]; //for every channel, we have 1 data, the maximum of a single channel is 255
    reg[17:0] multiplied_with_kernel_all_channel_sum; //result of every channel is added together, we have 1 data for one origin
    reg[13:0] conv_result_rounded; //the result is rounded to 14 bits

    //when the channel window is 32, we have to store the 4 conv result of the first 16 channels first
    reg[17:0] saved_conv_result[0:3]; 
    reg[3:0] conv_result_counter_value;
    reg count_conv_result_counter;
    reg reset_conv_result_counter;
    reg save_conv_result; //save the result of the first 16 channels
    reg reset_conv_result;

    reg[17:0] conv_result_added_with_stored_conv_result; //add the result of the first 16 channels with the result of the last 16 channels
    reg[13:0] conv_result_added_with_stored_conv_result_rounded;

    always @(*) begin: mult_with_kernel
        integer i, j;
        for (i = 0; i <16 ; i=i+1) begin
            multiplied_with_kernel[i][8] = {4'b0, line_buffer_sram[i][0]};  //kernel 8: 1/16
            multiplied_with_kernel[i][7] = {3'b0, line_buffer_sram[i][1],1'b0};  //kernel 7: 1/8
            multiplied_with_kernel[i][6] = {4'b0, line_buffer_sram[i][2]};  //kernel 6: 1/16
            multiplied_with_kernel[i][5] = {3'b0, line_buffer_sram[i][4],1'b0};  //kernel 5: 1/8
            multiplied_with_kernel[i][4] = {2'b0, line_buffer_sram[i][5],2'b0};  //kernel 4: 1/4
            multiplied_with_kernel[i][3] = {3'b0, line_buffer_sram[i][6],1'b0};  //kernel 3: 1/8
            multiplied_with_kernel[i][2] = {4'b0, line_buffer_sram[i][8]};  //kernel 2: 1/16
            multiplied_with_kernel[i][1] = {3'b0, line_buffer_sram[i][9],1'b0};  //kernel 1: 1/8
            multiplied_with_kernel[i][0] = {4'b0, line_buffer_sram[i][10]};  //kernel 0: 1/16
        end

        for(i=0;i<16;i=i+1) begin
            multiplied_with_kernel_sigle_channel_sum[i] = 
                    ((multiplied_with_kernel[i][0] + multiplied_with_kernel[i][1]) + (multiplied_with_kernel[i][2] 
                    + multiplied_with_kernel[i][3])) + ((multiplied_with_kernel[i][4] + multiplied_with_kernel[i][5] )
                    + ((multiplied_with_kernel[i][6] + multiplied_with_kernel[i][7]) + multiplied_with_kernel[i][8]));  
        end

        if(i_channel_window == CHANNEL_WINDOW_8) begin //add only 8 channel
            multiplied_with_kernel_all_channel_sum = ((multiplied_with_kernel_sigle_channel_sum[0] + multiplied_with_kernel_sigle_channel_sum[1]  )
                                                + (multiplied_with_kernel_sigle_channel_sum[2] + multiplied_with_kernel_sigle_channel_sum[3] ))
                                                + ((multiplied_with_kernel_sigle_channel_sum[4] + multiplied_with_kernel_sigle_channel_sum[5] )
                                                + (multiplied_with_kernel_sigle_channel_sum[6] + multiplied_with_kernel_sigle_channel_sum[7] ));
        end
        else begin
            multiplied_with_kernel_all_channel_sum = (((multiplied_with_kernel_sigle_channel_sum[0] + multiplied_with_kernel_sigle_channel_sum[1]  )
                                                + (multiplied_with_kernel_sigle_channel_sum[2] + multiplied_with_kernel_sigle_channel_sum[3] ))
                                                + ((multiplied_with_kernel_sigle_channel_sum[4] + multiplied_with_kernel_sigle_channel_sum[5] )
                                                + (multiplied_with_kernel_sigle_channel_sum[6] + multiplied_with_kernel_sigle_channel_sum[7] )))
                                                + (((multiplied_with_kernel_sigle_channel_sum[8] + multiplied_with_kernel_sigle_channel_sum[9] )
                                                + (multiplied_with_kernel_sigle_channel_sum[10] + multiplied_with_kernel_sigle_channel_sum[11] )) 
                                                + ((multiplied_with_kernel_sigle_channel_sum[12] + multiplied_with_kernel_sigle_channel_sum[13] ) 
                                                + (multiplied_with_kernel_sigle_channel_sum[14] + multiplied_with_kernel_sigle_channel_sum[15] )));
            
        end

        //rounding
        if(multiplied_with_kernel_all_channel_sum[3] == 1 && multiplied_with_kernel_all_channel_sum[16:4] != {13{1'b1}}) begin //if the 4th bit is 1, we add 1 to the result, but if the result is max number
            if(multiplied_with_kernel_all_channel_sum[17] == 1) //if there are any carry, we set the result to 255 
                conv_result_rounded = {1'b0,{13{1'b1}}}; //max value
            else
                conv_result_rounded = multiplied_with_kernel_all_channel_sum[17:4] + 1'b1;
        end
        else begin
            conv_result_rounded = multiplied_with_kernel_all_channel_sum[17:4];
        end

        conv_result_added_with_stored_conv_result = multiplied_with_kernel_all_channel_sum + saved_conv_result[conv_result_counter_value];
        //rounding
        if(conv_result_added_with_stored_conv_result[3] == 1 && conv_result_added_with_stored_conv_result[16:4] != {13{1'b1}}) begin
            if(conv_result_added_with_stored_conv_result[17] == 1)
                conv_result_added_with_stored_conv_result_rounded = {1'b0,{13{1'b1}}};
            else
                conv_result_added_with_stored_conv_result_rounded = conv_result_added_with_stored_conv_result[17:4] + 1'b1;
        end
        else begin
            conv_result_added_with_stored_conv_result_rounded = conv_result_added_with_stored_conv_result[17:4];
        end
        
    end

    //Median filter
    wire[7:0] median_result[0:3]; //median result dor for 4 channels
    genvar mf_i;
    generate 
        for(mf_i = 0; mf_i<4;mf_i=mf_i+1) begin :generate_median_finder
            medianFinder medianFinder0(
                .i_data0(line_buffer_sram[mf_i][10]),
                .i_data1(line_buffer_sram[mf_i][9]),
                .i_data2(line_buffer_sram[mf_i][8]),
                .i_data3(line_buffer_sram[mf_i][6]),
                .i_data4(line_buffer_sram[mf_i][5]),
                .i_data5(line_buffer_sram[mf_i][4]),
                .i_data6(line_buffer_sram[mf_i][2]),
                .i_data7(line_buffer_sram[mf_i][1]),
                .i_data8(line_buffer_sram[mf_i][0]),
                .o_median(median_result[mf_i])
            );
        end
    endgenerate

    //each channel has 4 median result, for 4 channels, we have 16 median result to save
    reg[7:0] saved_median_result[0:3][0:3];
    reg[3:0] median_result_counter_value;
    reg count_median_result_counter;
    reg reset_median_result_counter;
    reg save_median_result, reset_median_result; //save the result 


    //sobel filter
    //we use 3*3 sobel filter on only 4 channels
    //sobel filter for x direction
    /*
        -1 0 1  =>   kernel 0: -1, kernel 1: 0, kernel 2: 1
        -2 0 2  =>   kernel 3: -2, kernel 4: 0, kernel 5: 2
        -1 0 1  =>   kernel 6: -1, kernel 7: 0, kernel 8: 1
    */
    reg signed[13:0] sobel_x_multiply_with_kernel[0:3][0:8]; //for every channel, we have 9 data
    reg signed[13:0] sobel_x_single_channel_sum[0:3]; //for every channel, we have 1 data
    reg [13:0] sobel_x_single_channel_sum_abs[0:3]; //for every channel, we have 1 data, absolute value of sobel_x_single_channel_sum
    //sobel filter for y direction
    /*
        -1 -2 -1   =>   kernel 0: -1, kernel 1: -2, kernel 2: -1
         0  0  0   =>   kernel 3:  0, kernel 4:  0, kernel 5:  0
         1  2  1   =>   kernel 6:  1, kernel 7:  2, kernel 8:  1
    */
    reg signed[13:0] sobel_y_multiply_with_kernel[0:3][0:8]; //for every channel, we have 9 data
    reg signed[13:0] sobel_y_single_channel_sum[0:3]; //for every channel, we have 1 data
    reg [13:0] sobel_y_single_channel_sum_abs[0:3]; //for every channel, we have 1 data, absolute value of sobel_y_single_channel_sum
    reg [13:0] sobel_gradiant_magtitute[0:3]; //for every channel, we have 1 data, sum of absolute value of sobel_x_single_channel_sum and sobel_y_single_channel_sum
    wire [3:0] sobel_degree[0:3]; //for every channel, we have 1 data, degree of sobel_gradiant_magtitute

    reg[13:0] saved_sobel_result[0:3][0:3]; //4 result for 4 channels
    reg[3:0] saved_sobel_degree[0:3][0:3]; //4 degree for 4 channels
    reg[3:0] sobel_result_counter_value;
    reg count_sobel_result_counter;
    reg reset_sobel_result_counter;
    reg save_sobel_result, reset_sobel_result; //save the result 
    reg save_sobel_degree, reset_sobel_degree; //save the degree

    always @(*) begin: sobel_filter
        integer i;
        for(i=0; i<4; i=i+1) begin
            //extend 8 bits to 14 bits, add 6 bits
            //x direction
            sobel_x_multiply_with_kernel[i][8] = {6'b0, line_buffer_sram[i][0]}; //kernel 8: 1
            sobel_x_multiply_with_kernel[i][7] = 0; //kernel 7: 0
            sobel_x_multiply_with_kernel[i][6] = (~{6'b0, line_buffer_sram[i][2]}) + 1; //kernel 6: -1, two's complement
            sobel_x_multiply_with_kernel[i][5] = {6'b0, line_buffer_sram[i][4]} + {6'b0, line_buffer_sram[i][4]}; //kernel 5: 2, 
            sobel_x_multiply_with_kernel[i][4] = 0; //kernel 4: 0
            sobel_x_multiply_with_kernel[i][3] = (~({6'b0, line_buffer_sram[i][6]} + {6'b0, line_buffer_sram[i][6]})) + 1; //kernel 3: -2, two's complement
            sobel_x_multiply_with_kernel[i][2] = {6'b0, line_buffer_sram[i][8]}; //kernel 2: 1
            sobel_x_multiply_with_kernel[i][1] = 0; //kernel 1: 0
            sobel_x_multiply_with_kernel[i][0] = (~{6'b0, line_buffer_sram[i][10]}) + 1; //kernel 0: -1, two's complement
            //y direction
            sobel_y_multiply_with_kernel[i][8] = {6'b0, line_buffer_sram[i][0]}; //kernel 8: 1
            sobel_y_multiply_with_kernel[i][7] = {6'b0, line_buffer_sram[i][1]} + {6'b0, line_buffer_sram[i][1]}; //kernel 7: 2
            sobel_y_multiply_with_kernel[i][6] = {6'b0, line_buffer_sram[i][2]}; //kernel 6: 1
            sobel_y_multiply_with_kernel[i][5] = 0; //kernel 5: 0
            sobel_y_multiply_with_kernel[i][4] = 0; //kernel 4: 0
            sobel_y_multiply_with_kernel[i][3] = 0; //kernel 3: 0
            sobel_y_multiply_with_kernel[i][2] = (~{6'b0, line_buffer_sram[i][8]}) + 1; //kernel 2: -1, two's complement
            sobel_y_multiply_with_kernel[i][1] = (~({6'b0, line_buffer_sram[i][9]} + {6'b0, line_buffer_sram[i][9]})) + 1; //kernel 1: -2, two's complement
            sobel_y_multiply_with_kernel[i][0] = (~{6'b0, line_buffer_sram[i][10]}) + 1; //kernel 0: -1, two's complement
        end

        //add the result of of kernel 0, 1, 2, 3, 4, 5, 6, 7, 8
        for(i=0; i<4; i=i+1) begin
            //we only have to add kernel 0, 2, 3, 5, 6, 8 when we add the result of x direction
            sobel_x_single_channel_sum[i] = ((sobel_x_multiply_with_kernel[i][0] + sobel_x_multiply_with_kernel[i][2]) + 
                                            (sobel_x_multiply_with_kernel[i][3] + sobel_x_multiply_with_kernel[i][5])) + 
                                            (sobel_x_multiply_with_kernel[i][6] + sobel_x_multiply_with_kernel[i][8]);


            //we only have to add kernel 0, 1, 2, 6, 7, 8 when we add the result of y direction
            sobel_y_single_channel_sum[i] = ((sobel_y_multiply_with_kernel[i][0] + sobel_y_multiply_with_kernel[i][1]) + 
                                            (sobel_y_multiply_with_kernel[i][2] + sobel_y_multiply_with_kernel[i][6])) + 
                                            (sobel_y_multiply_with_kernel[i][7] + sobel_y_multiply_with_kernel[i][8]);
        end 

        //calculate the abs
        for(i=0; i<4; i=i+1) begin
            sobel_x_single_channel_sum_abs[i] = (sobel_x_single_channel_sum[i][13] == 1) ? (~sobel_x_single_channel_sum[i] + 1) : sobel_x_single_channel_sum[i];
            sobel_y_single_channel_sum_abs[i] = (sobel_y_single_channel_sum[i][13] == 1) ? (~sobel_y_single_channel_sum[i] + 1) : sobel_y_single_channel_sum[i];
        end 

        //calculate the gradiant magtitute
        for(i=0; i<4; i=i+1) begin
            sobel_gradiant_magtitute[i] = sobel_x_single_channel_sum_abs[i] + sobel_y_single_channel_sum_abs[i];
        end
    end

    //sobel degree
    localparam DEGREE_0 = 4'd0;
    localparam DEGREE_BETWEEN_0_AND_22_5 = 4'd1;
    localparam DEGREE_22_5 = 4'd2;
    localparam DEGREE_BETWEEN_22_5_AND_45 = 4'd3;
    localparam DEGREE_45 = 4'd4;
    localparam DEGREE_BETWEEN_45_AND_67_5 = 4'd5;
    localparam DEGREE_67_5 = 4'd6;
    localparam DEGREE_BETWEEN_67_5_AND_90 = 4'd7;
    //tan(deg(90)) is infinity, so we don't need to consider this case
    localparam DEGREE_BETWEEN_90_AND_112_5 = 4'd8;
    localparam DEGREE_112_5 = 4'd9;
    localparam DEGREE_BETWEEN_112_5_AND_135 = 4'd10;
    localparam DEGREE_135 = 4'd11;
    localparam DEGREE_BETWEEN_135_AND_157_5 = 4'd12;
    localparam DEGREE_157_5 = 4'd13;
    localparam DEGREE_BETWEEN_157_5_AND_180 = 4'd14;
    localparam DEGREE_180 = 4'd15;

    genvar sd_i;
    generate
        for(sd_i = 0; sd_i<4;sd_i=sd_i+1) begin :generate_sobel_degree
            arctangentApproximator arctan_approx(
                .i_data_x(sobel_x_single_channel_sum[sd_i]),
                .i_data_y(sobel_y_single_channel_sum[sd_i]),
                .o_degree_approx(sobel_degree[sd_i])
            );
        end
    endgenerate

    




    always @(posedge i_clk or negedge i_rst_n) begin: sequential_logic
        integer i, j;
        if(~i_rst_n) begin
            current_state <= STATE_START;
            for (i=0; i<16 ; i=i+1) begin
                for(j=0; j<11;j=j+1) begin
                    line_buffer_sram[i][j] <= 0;
                end
            end

            for(i=0;i<4;i=i+1) begin
                saved_conv_result[i] <= 0;
            end

            for(i=0;i<4;i=i+1) begin
                for(j=0;j<4;j=j+1) begin
                    saved_median_result[i][j] <= 0;
                    saved_sobel_result[i][j] <= 0;
                    saved_sobel_degree[i][j] <= 0;
                end
            end

            x_index_counter_value <= 0;
            y_index_counter_value <= 0;
            counter0_value <= 0;
            conv_result_counter_value <= 0;
            median_result_counter_value <= 0;
            sobel_result_counter_value <= 0;
            
        end
        else begin
            current_state <= next_state;
            //because sram data is not available in the same cycle, 
            //we need to shift the line buffer in the next cycle
            if(reset_line_buffer) begin
                for (i=0; i<16 ; i=i+1) begin
                    for(j=0; j<11;j=j+1) begin
                        line_buffer_sram[i][j] <= 0;
                    end
                end
            end
            else if(shift_line_buffer) begin
                for (i=0; i<16 ; i=i+1) begin
                    for(j=1; j<11;j=j+1) begin
                        line_buffer_sram[i][j] <= line_buffer_sram[i][j-1];
                    end
                    line_buffer_sram[i][0] <= sram_data[i];
                end
            end

            if(reset_conv_result) begin
                for(i=0;i<4;i=i+1) begin
                    saved_conv_result[i] <= 0;
                end
            end
            else if(save_conv_result) begin
                saved_conv_result[conv_result_counter_value] <= multiplied_with_kernel_all_channel_sum;
            end
            
            if(reset_median_result) begin
                for(i=0;i<4;i=i+1) begin
                    for(j=0;j<4;j=j+1) begin
                        saved_median_result[i][j] <= 0;
                    end
                end
            end
            else if(save_median_result) begin
                for(i=0;i<4;i=i+1) begin
                    saved_median_result[i][median_result_counter_value] <= median_result[i];
                end
            end

            if(reset_sobel_result) begin
                for(i=0;i<4;i=i+1) begin
                    for(j=0;j<4;j=j+1) begin
                        saved_sobel_result[i][j] <= 0;
                    end
                end
            end
            else if(save_sobel_result) begin
                for(i=0;i<4;i=i+1) begin
                    saved_sobel_result[i][sobel_result_counter_value] <= sobel_gradiant_magtitute[i];
                end
            end

            if(reset_sobel_degree) begin
                for(i=0;i<4;i=i+1) begin
                    for(j=0;j<4;j=j+1) begin
                        saved_sobel_degree[i][j] <= 0;
                    end
                end
            end
            else if(save_sobel_degree)begin
                for(i=0;i<4;i=i+1) begin
                    saved_sobel_degree[i][sobel_result_counter_value] <= sobel_degree[i];
                end
            end
            

            
            if(reset_counter0) counter0_value <= 0; 
            else if(count_counter0) counter0_value <= counter0_value + 1;
                
            if(reset_conv_result_counter) conv_result_counter_value <= 0;
            else if(count_conv_result_counter) conv_result_counter_value <= conv_result_counter_value + 1;

            if(reset_median_result_counter) median_result_counter_value <= 0;
            else if(count_median_result_counter) median_result_counter_value <= median_result_counter_value + 1;

            if(reset_sobel_result_counter) sobel_result_counter_value <= 0;
            else if(count_sobel_result_counter) sobel_result_counter_value <= sobel_result_counter_value + 1;

            if(count_x_index_counter) x_index_counter_value <= x_index_counter_value + 1;
            else if(set_x_index_counter_to_conv_origin) x_index_counter_value <= i_origin_x - 1;

            if(count_y_index_counter) y_index_counter_value <= y_index_counter_value + 1;
            else if(set_y_index_counter_to_conv_origin) y_index_counter_value <= i_origin_y - 1;
            
        end        
    end


    //FSM
    always @(*) begin
        //default
        next_state = current_state;

        //outputs
        o_ready = 0;
        o_finished = 0;
        o_output_valid = 0;
        o_output_data = 0;
        
        //mmu control
        o_mmu_x_index = 0;
        o_mmu_y_index = 0;
        o_mmu_bank_select = 0;

        //line buffer
        reset_line_buffer = 0;
        shift_line_buffer = 0;
    

        //counter
        count_counter0 = 0;
        reset_counter0 = 0;

        //index counters
        count_x_index_counter = 0;
        count_y_index_counter = 0;
        set_x_index_counter_to_conv_origin = 0;
        set_y_index_counter_to_conv_origin = 0;

        //conv result counter
        count_conv_result_counter = 0;
        reset_conv_result_counter = 0;

        //conv result
        save_conv_result = 0;
        reset_conv_result = 0;

        //median result counter
        count_median_result_counter = 0;
        reset_median_result_counter = 0;
        save_median_result = 0; //save the median result 

        //median result
        reset_median_result = 0;
        save_median_result = 0;

        //sobel result counter
        count_sobel_result_counter = 0;
        reset_sobel_result_counter = 0;

        //sobel result
        save_sobel_result = 0;
        reset_sobel_result = 0;

        //sobel degree
        save_sobel_degree = 0;
        reset_sobel_degree = 0;


        case (current_state)

            STATE_START: begin
                next_state = STATE_WAIT;
            end
            STATE_WAIT: begin
                o_ready = 1;
                if(i_start) begin
                    case (i_filter_mode)
                        FILTER_MODE_FIXED: begin
                            next_state = STATE_COMPUTE_FIXED;
                            reset_conv_result_counter = 1;
                        end 
                        FILTER_MODE_MEDIAN: begin
                            next_state = STATE_COMPUTE_MEDIAN;
                            reset_median_result_counter = 1;
                        end
                        FILTER_MODE_SOBEL_NMS: begin
                            next_state = STATE_COMPUTE_SOBEL;
                            reset_sobel_result_counter = 1;
                        end
                    endcase
                    set_x_index_counter_to_conv_origin = 1;
                    set_y_index_counter_to_conv_origin = 1;
                    reset_counter0 = 1;
                    
                end
            end
            STATE_COMPUTE_FIXED:begin
                //the data of sram is not available in the same cycle
                //so we need to shift the line buffer in the next cycle
                //after the data is available, we shift the line buffer
                //so we calculate the result in the next cycle of the data is available

                //counter 0 is used to count the number of cycles
                //since the display area is 4*4
                //we make the index move from r[origin_x-1, origin_y-1] to r[origin_x+2, origin_y+2]
                //that is, r_0, r_1 ...r_15, we get 16 data
                //to get the four windows for convolution, we need to shift until the counter0_value = 11, 12, 15, 16
                
                //the first data is available in the counter0_value = 1
                //so the first shift happens in the counter0_value = 2
                //that means we can get four windows in the counter0_value = 12, 13, 16, 17
                //in another word, we calculate the result after x_10, x_11, x_14, x_15 are available and shifted to the line buffer
                o_mmu_x_index = x_index_counter_value;
                o_mmu_y_index = y_index_counter_value;
                count_counter0 = 1;
                // shift_line_buffer = 1;
                if(i_channel_window == CHANNEL_WINDOW_8 || i_channel_window == CHANNEL_WINDOW_16) begin
                    //after shifting the line buffer, we can calculate the result at the right time
                    if(counter0_value == 12 || counter0_value == 13 || counter0_value == 16 || counter0_value == 17 ) begin
                        o_output_valid = 1;
                    end
                    o_output_data = conv_result_rounded;
                end
                else begin
                    if(counter0_value == 12 || counter0_value == 13 || counter0_value == 16 || counter0_value == 17 ) begin
                        save_conv_result = 1;
                        count_conv_result_counter = 1;
                    end
                    
                end
                

                //the first data is available in the counter0_value = 1
                //the last data is available in the counter0_value = 16
                if(counter0_value>= 1 && counter0_value<=16) begin 
                    shift_line_buffer = 1;
                end

                if(x_index_counter_value == i_origin_x+2) begin
                    if(y_index_counter_value == i_origin_y + 2) begin
                        //next_state = STATE_WAIT_FINISH_UP;
                        if(counter0_value == 18) begin
                            if(i_channel_window == CHANNEL_WINDOW_32) begin
                                next_state = STATE_COMPUTE_FIXED_SECOND_BANK;
                                set_x_index_counter_to_conv_origin = 1;
                                set_y_index_counter_to_conv_origin = 1;
                                reset_counter0 = 1;
                                reset_conv_result_counter = 1;
                            end
                            else begin
                                next_state = STATE_FINISH; //the last calculation is done in the counter0_value = 18
                            end
                                
                        end
                    end
                    else begin
                        set_x_index_counter_to_conv_origin = 1;
                        count_y_index_counter = 1;
                    end
                end
                else begin
                    count_x_index_counter = 1;
                end
               
            end
            STATE_COMPUTE_FIXED_SECOND_BANK: begin
                o_mmu_x_index = x_index_counter_value;
                o_mmu_y_index = y_index_counter_value;
                o_mmu_bank_select = 1;
                count_counter0 = 1;
                // shift_line_buffer = 1;
                o_output_data = conv_result_added_with_stored_conv_result_rounded;
                
                if(counter0_value == 12 || counter0_value == 13 || counter0_value == 16 || counter0_value == 17 ) begin
                    o_output_valid = 1;
                    count_conv_result_counter = 1;  
                end
                    
                
                //the first data is available in the counter0_value = 1
                //the last data is available in the counter0_value = 16
                if(counter0_value>= 1 && counter0_value<=16) begin 
                    shift_line_buffer = 1;
                end

                if(x_index_counter_value == i_origin_x+2) begin
                    if(y_index_counter_value == i_origin_y + 2) begin
                        //next_state = STATE_WAIT_FINISH_UP;
                        if(counter0_value == 18) begin
                            set_x_index_counter_to_conv_origin = 1;
                            set_y_index_counter_to_conv_origin = 1;
                            reset_counter0 = 1;
                            next_state = STATE_FINISH; //the last calculation is done in the counter0_value = 18
                            reset_conv_result_counter = 1;
                        end
                    end
                    else begin
                        set_x_index_counter_to_conv_origin = 1;
                        count_y_index_counter = 1;
                    end
                end
                else begin
                    count_x_index_counter = 1;
                end
            end
            STATE_COMPUTE_MEDIAN: begin
                o_mmu_x_index = x_index_counter_value;
                o_mmu_y_index = y_index_counter_value;
                count_counter0 = 1;
                // shift_line_buffer = 1;
                
                if(counter0_value == 12 || counter0_value == 13 || counter0_value == 16 || counter0_value == 17 ) begin
                    save_median_result = 1;
                    count_median_result_counter = 1;
                end
                

                //the first data is available in the counter0_value = 1
                //the last data is available in the counter0_value = 16
                if(counter0_value>= 1 && counter0_value<=16) begin 
                    shift_line_buffer = 1;
                end

                if(x_index_counter_value == i_origin_x+2) begin
                    if(y_index_counter_value == i_origin_y + 2) begin
                        //next_state = STATE_WAIT_FINISH_UP;
                        if(counter0_value == 18) begin
                            next_state = STATE_OUTPUT_MEDIAN;
                            set_x_index_counter_to_conv_origin = 1;
                            set_y_index_counter_to_conv_origin = 1;
                            reset_counter0 = 1;
                            reset_median_result_counter = 1;
                        end
                    end
                    else begin
                        set_x_index_counter_to_conv_origin = 1;
                        count_y_index_counter = 1;
                    end
                end
                else begin
                    count_x_index_counter = 1;
                end
            end
            STATE_OUTPUT_MEDIAN: begin
                
                //counter0 is used to count the index of channel
                //the result is 4channel * 4data = 16 data
                o_output_valid = 1;
                o_output_data = {6'b0, saved_median_result[counter0_value][median_result_counter_value]};
                if(median_result_counter_value == 3) begin
                    if(counter0_value == 3) begin
                        next_state = STATE_FINISH;
                        reset_counter0 = 1;
                        reset_median_result_counter = 1;
                    end
                    else begin
                        count_counter0 = 1;
                        reset_median_result_counter = 1;
                    end
                end
                else begin
                    count_median_result_counter = 1;
                end
            end
            STATE_COMPUTE_SOBEL: begin
                o_mmu_x_index = x_index_counter_value;
                o_mmu_y_index = y_index_counter_value;
                count_counter0 = 1;
                
                if(counter0_value == 12 || counter0_value == 13 || counter0_value == 16 || counter0_value == 17 ) begin
                    save_sobel_result = 1;
                    save_sobel_degree = 1;
                    count_sobel_result_counter = 1;
                end
                

                //the first data is available in the counter0_value = 1
                //the last data is available in the counter0_value = 16
                if(counter0_value>= 1 && counter0_value<=16) begin 
                    shift_line_buffer = 1;
                end

                if(x_index_counter_value == i_origin_x+2) begin
                    if(y_index_counter_value == i_origin_y + 2) begin
                        //next_state = STATE_WAIT_FINISH_UP;
                        if(counter0_value == 18) begin
                            next_state = STATE_OUTPUT_SOBEL;
                            set_x_index_counter_to_conv_origin = 1;
                            set_y_index_counter_to_conv_origin = 1;
                            reset_counter0 = 1;
                            reset_sobel_result_counter = 1;
                        end
                    end
                    else begin
                        set_x_index_counter_to_conv_origin = 1;
                        count_y_index_counter = 1;
                    end
                end
                else begin
                    count_x_index_counter = 1;
                end
            end
            STATE_OUTPUT_SOBEL: begin
                //counter0 is used to count the index of channel
                //the result is 4channel * 4data = 16 data
                o_output_valid = 1;
                //o_output_data = saved_sobel_result[counter0_value][sobel_result_counter_value];
                case (sobel_result_counter_value)
                    0: begin
                        case (saved_sobel_degree[counter0_value][sobel_result_counter_value])
                            DEGREE_0,DEGREE_BETWEEN_0_AND_22_5, DEGREE_BETWEEN_157_5_AND_180, DEGREE_180: begin
                                if(saved_sobel_result[counter0_value][1] > saved_sobel_result[counter0_value][sobel_result_counter_value])
                                    o_output_data = 0; //non-maximum suppression
                                else
                                    o_output_data = saved_sobel_result[counter0_value][sobel_result_counter_value];
                            end
                            DEGREE_22_5, DEGREE_BETWEEN_22_5_AND_45, DEGREE_45, DEGREE_BETWEEN_45_AND_67_5, DEGREE_67_5: begin
                                if(saved_sobel_result[counter0_value][3] > saved_sobel_result[counter0_value][sobel_result_counter_value])
                                    o_output_data = 0; //non-maximum suppression
                                else
                                    o_output_data = saved_sobel_result[counter0_value][sobel_result_counter_value];
                            end
                            DEGREE_BETWEEN_67_5_AND_90, DEGREE_BETWEEN_90_AND_112_5: begin
                                if(saved_sobel_result[counter0_value][2] > saved_sobel_result[counter0_value][sobel_result_counter_value])
                                    o_output_data = 0; //non-maximum suppression
                                else
                                    o_output_data = saved_sobel_result[counter0_value][sobel_result_counter_value];
                            end
                            DEGREE_112_5, DEGREE_BETWEEN_112_5_AND_135, DEGREE_135, DEGREE_BETWEEN_135_AND_157_5, DEGREE_157_5: begin
                                o_output_data = saved_sobel_result[counter0_value][sobel_result_counter_value];
                            end
                            default: begin
                                // won't happen
                                o_output_data = saved_sobel_result[counter0_value][sobel_result_counter_value];
                            end
                            
                        endcase
                    end
                    1: begin
                        case (saved_sobel_degree[counter0_value][sobel_result_counter_value])
                            DEGREE_0,DEGREE_BETWEEN_0_AND_22_5, DEGREE_180, DEGREE_BETWEEN_157_5_AND_180: begin
                                if(saved_sobel_result[counter0_value][0] > saved_sobel_result[counter0_value][sobel_result_counter_value])
                                    o_output_data = 0; //non-maximum suppression
                                else
                                    o_output_data = saved_sobel_result[counter0_value][sobel_result_counter_value];
                            end
                            DEGREE_22_5, DEGREE_BETWEEN_22_5_AND_45, DEGREE_45, DEGREE_BETWEEN_45_AND_67_5, DEGREE_67_5: begin
                                o_output_data = saved_sobel_result[counter0_value][sobel_result_counter_value];
                            end
                            DEGREE_BETWEEN_67_5_AND_90, DEGREE_BETWEEN_90_AND_112_5: begin
                                if(saved_sobel_result[counter0_value][3] > saved_sobel_result[counter0_value][sobel_result_counter_value])
                                    o_output_data = 0; //non-maximum suppression
                                else
                                    o_output_data = saved_sobel_result[counter0_value][sobel_result_counter_value];
                            end
                            DEGREE_112_5, DEGREE_BETWEEN_112_5_AND_135, DEGREE_135, DEGREE_BETWEEN_135_AND_157_5, DEGREE_157_5: begin
                                if(saved_sobel_result[counter0_value][2] > saved_sobel_result[counter0_value][sobel_result_counter_value])
                                    o_output_data = 0; //non-maximum suppression
                                else
                                    o_output_data = saved_sobel_result[counter0_value][sobel_result_counter_value];
                            end
                            default: begin
                                // won't happen
                                o_output_data = saved_sobel_result[counter0_value][sobel_result_counter_value];
                            end
                        endcase
                        
                    end
                    2: begin
                        case (saved_sobel_degree[counter0_value][sobel_result_counter_value])
                            DEGREE_0,DEGREE_BETWEEN_0_AND_22_5, DEGREE_180, DEGREE_BETWEEN_157_5_AND_180: begin
                                if(saved_sobel_result[counter0_value][3] > saved_sobel_result[counter0_value][sobel_result_counter_value])
                                    o_output_data = 0; //non-maximum suppression
                                else
                                    o_output_data = saved_sobel_result[counter0_value][sobel_result_counter_value];
                            end
                            DEGREE_22_5, DEGREE_BETWEEN_22_5_AND_45, DEGREE_45, DEGREE_BETWEEN_45_AND_67_5, DEGREE_67_5: begin
                                o_output_data = saved_sobel_result[counter0_value][sobel_result_counter_value];
                            end
                            DEGREE_BETWEEN_67_5_AND_90, DEGREE_BETWEEN_90_AND_112_5: begin
                                if(saved_sobel_result[counter0_value][0] > saved_sobel_result[counter0_value][sobel_result_counter_value])
                                    o_output_data = 0; //non-maximum suppression
                                else
                                    o_output_data = saved_sobel_result[counter0_value][sobel_result_counter_value];
                            end
                            DEGREE_112_5, DEGREE_BETWEEN_112_5_AND_135, DEGREE_135, DEGREE_BETWEEN_135_AND_157_5, DEGREE_157_5: begin
                                if(saved_sobel_result[counter0_value][1] > saved_sobel_result[counter0_value][sobel_result_counter_value])
                                    o_output_data = 0; //non-maximum suppression
                                else
                                    o_output_data = saved_sobel_result[counter0_value][sobel_result_counter_value];
                            end
                            default: begin
                                // won't happen
                                o_output_data = saved_sobel_result[counter0_value][sobel_result_counter_value];
                            end
                        endcase
                        
                    end
                    3: begin
                        case (saved_sobel_degree[counter0_value][sobel_result_counter_value])
                            DEGREE_0,DEGREE_BETWEEN_0_AND_22_5, DEGREE_180, DEGREE_BETWEEN_157_5_AND_180: begin
                                if(saved_sobel_result[counter0_value][2] > saved_sobel_result[counter0_value][sobel_result_counter_value])
                                    o_output_data = 0; //non-maximum suppression
                                else
                                    o_output_data = saved_sobel_result[counter0_value][sobel_result_counter_value];
                            end
                            DEGREE_22_5, DEGREE_BETWEEN_22_5_AND_45, DEGREE_45, DEGREE_BETWEEN_45_AND_67_5, DEGREE_67_5: begin
                                if(saved_sobel_result[counter0_value][0] > saved_sobel_result[counter0_value][sobel_result_counter_value])
                                    o_output_data = 0; //non-maximum suppression
                                else
                                    o_output_data = saved_sobel_result[counter0_value][sobel_result_counter_value];
                            end
                            DEGREE_BETWEEN_67_5_AND_90, DEGREE_BETWEEN_90_AND_112_5: begin
                                if(saved_sobel_result[counter0_value][1] > saved_sobel_result[counter0_value][sobel_result_counter_value])
                                    o_output_data = 0; //non-maximum suppression
                                else
                                    o_output_data = saved_sobel_result[counter0_value][sobel_result_counter_value];
                            end
                            DEGREE_112_5, DEGREE_BETWEEN_112_5_AND_135, DEGREE_135, DEGREE_BETWEEN_135_AND_157_5, DEGREE_157_5: begin
                                o_output_data = saved_sobel_result[counter0_value][sobel_result_counter_value];
                            end
                            default: begin
                                // won't happen
                                o_output_data = saved_sobel_result[counter0_value][sobel_result_counter_value];
                            end
                            
                        endcase
                        
                    end
                    default: begin
                        // won't happen
                        o_output_data = saved_sobel_result[counter0_value][sobel_result_counter_value];
                    end
                endcase
                // o_output_data = saved_sobel_result[counter0_value][sobel_result_counter_value];

                if(sobel_result_counter_value == 3) begin
                    if(counter0_value == 3) begin
                        next_state = STATE_FINISH;
                        reset_counter0 = 1;
                        reset_sobel_result_counter = 1;
                    end
                    else begin
                        count_counter0 = 1;
                        reset_sobel_result_counter = 1;
                    end
                end
                else begin
                    count_sobel_result_counter = 1;
                end
            end
            STATE_FINISH: begin
                o_finished = 1;
                next_state = STATE_WAIT;
            end
        endcase
        
    end

    
endmodule