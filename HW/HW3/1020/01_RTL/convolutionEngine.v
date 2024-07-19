module convolutionEngine (
    input i_clk,
    input i_rst_n,
    input i_start,
    output reg o_ready,
    output reg o_finished,
    output reg o_output_valid,
    output reg [13:0] o_output_data,
    input[3:0] i_origin_x, 
    input[3:0] i_origin_y,
    input[1:0] i_channel_window, //control the depth of convolution, 0: 8 channels, 1: 16 channels, 2: 32 channels
    output reg[3:0] o_mmu_x_index,
    output reg[3:0] o_mmu_y_index,
    output reg[4:0] o_mmu_channel_index,
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
    localparam STATE_COMPUTE = 5'd2;
    localparam STATE_COMPUTE_SECOND_BANK = 5'd3;
    localparam STATE_FINISH = 5'd4;

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

    //whem the channel window is 32, we have to store the 4 conv result of the first 16 channels first
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

            x_index_counter_value <= 0;
            y_index_counter_value <= 0;
            counter0_value <= 0;
            conv_result_counter_value <= 0;
            
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

            
            if(reset_counter0) counter0_value <= 0; 
            else if(count_counter0) counter0_value <= counter0_value + 1;
                
            if(reset_conv_result_counter) conv_result_counter_value <= 0;
            else if(count_conv_result_counter) conv_result_counter_value <= conv_result_counter_value + 1;

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
        o_mmu_channel_index = 0;

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


        case (current_state)

            STATE_START: begin
                next_state = STATE_WAIT;
            end
            STATE_WAIT: begin
                o_ready = 1;
                if(i_start) begin
                    next_state = STATE_COMPUTE;
                    set_x_index_counter_to_conv_origin = 1;
                    set_y_index_counter_to_conv_origin = 1;
                    reset_counter0 = 1;
                end
            end
            STATE_COMPUTE:begin
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
                shift_line_buffer = 1;
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
                                next_state = STATE_COMPUTE_SECOND_BANK;
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
            STATE_COMPUTE_SECOND_BANK: begin
                o_mmu_x_index = x_index_counter_value;
                o_mmu_y_index = y_index_counter_value;
                o_mmu_channel_index = 16;
                count_counter0 = 1;
                shift_line_buffer = 1;
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
            STATE_FINISH: begin
                o_finished = 1;
                next_state = STATE_WAIT;
            end
        endcase
        
    end

    
endmodule