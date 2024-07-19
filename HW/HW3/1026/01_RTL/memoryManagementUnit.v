module memoryManagementUnit (
    input i_clk,
    input i_rst_n,
    output reg o_ready,
    input[3:0] i_write_x,
    input[3:0] i_write_y,
    input[4:0] i_write_channel,
    input[7:0] i_write_data, 
    input i_write_enable,  //when i_write_enable = 1, write to sram
    input[3:0] i_read_x,
    input[3:0] i_read_y,
    input i_read_bank, //when i_read_bank = 1, read from second bank
    output[7:0] o_sram0_data, //15 srams
    output[7:0] o_sram1_data,
    output[7:0] o_sram2_data,
    output[7:0] o_sram3_data,
    output[7:0] o_sram4_data,
    output[7:0] o_sram5_data,
    output[7:0] o_sram6_data,
    output[7:0] o_sram7_data,
    output[7:0] o_sram8_data,
    output[7:0] o_sram9_data,
    output[7:0] o_sram10_data,
    output[7:0] o_sram11_data,
    output[7:0] o_sram12_data,
    output[7:0] o_sram13_data,
    output[7:0] o_sram14_data,
    output[7:0] o_sram15_data
);

    localparam SRAM_WEN_READ = 1;
	localparam SRAM_WEN_WRITE = 0;

    localparam SRAM_CEN_STANDBY = 1;
    localparam SRAM_CEN_ENABLE = 0;


    //index converter
    reg[3:0] index_converter_x, index_converter_y;
    reg[4:0] index_converter_channel;
    wire index_converter_bank_select;
    wire[3:0] index_converter_sram_select;
    wire[7:0] index_converter_converted_index;
    indexConverter iConv0(
        .i_x(index_converter_x),  //max=10
        .i_y(index_converter_y),  //max=10
        .i_channel(index_converter_channel),  //max=32
        .o_bank_select(index_converter_bank_select), //max=1
        .o_sram_select(index_converter_sram_select), //max=15
        .o_index(index_converter_converted_index) //256 = 2^8
    );

    //sram 0
	// reg[7:0] sram0_addr;
	reg[7:0] sram0_data_in;
	// wire[7:0] sram0_data_out;
	reg sram0_chip_enable, sram0_write_enable;
    sram_256x8 sram0(
		.Q(o_sram0_data),
   		.CLK(i_clk),
   		.CEN(sram0_chip_enable),
   		.WEN(sram0_write_enable),
   		.A(index_converter_converted_index),
   		.D(sram0_data_in)
	);

    //sram 1
    // reg[7:0] sram1_addr;
    reg[7:0] sram1_data_in;
    // wire[7:0] sram1_data_out;
    reg sram1_chip_enable, sram1_write_enable;
    sram_256x8 sram1(
        .Q(o_sram1_data),
        .CLK(i_clk),
        .CEN(sram1_chip_enable),
        .WEN(sram1_write_enable),
        .A(index_converter_converted_index),
        .D(sram1_data_in)
    );


    //sram 2
    // reg[7:0] sram2_addr;
    reg[7:0] sram2_data_in;
    // wire[7:0] sram2_data_out;
    reg sram2_chip_enable, sram2_write_enable;
    sram_256x8 sram2(
        .Q(o_sram2_data),
        .CLK(i_clk),
        .CEN(sram2_chip_enable),
        .WEN(sram2_write_enable),
        .A(index_converter_converted_index),
        .D(sram2_data_in)
    );

    //sram 3
    // reg[7:0] sram3_addr;
    reg[7:0] sram3_data_in;
    // wire[7:0] sram3_data_out;
    reg sram3_chip_enable, sram3_write_enable;
    sram_256x8 sram3(
        .Q(o_sram3_data),
        .CLK(i_clk),
        .CEN(sram3_chip_enable),
        .WEN(sram3_write_enable),
        .A(index_converter_converted_index),
        .D(sram3_data_in)
    );

    //sram 4
    // reg[7:0] sram4_addr;
    reg[7:0] sram4_data_in;
    // wire[7:0] sram4_data_out;
    reg sram4_chip_enable, sram4_write_enable;
    sram_256x8 sram4(
        .Q(o_sram4_data),
        .CLK(i_clk),
        .CEN(sram4_chip_enable),
        .WEN(sram4_write_enable),
        .A(index_converter_converted_index),
        .D(sram4_data_in)
    );


    //sram 5
    // reg[7:0] sram5_addr;
    reg[7:0] sram5_data_in;
    // wire[7:0] sram5_data_out;
    reg sram5_chip_enable, sram5_write_enable;
    sram_256x8 sram5(
        .Q(o_sram5_data),
        .CLK(i_clk),
        .CEN(sram5_chip_enable),
        .WEN(sram5_write_enable),
        .A(index_converter_converted_index),
        .D(sram5_data_in)
    );


    //sram 6
    // reg[7:0] sram6_addr;
    reg[7:0] sram6_data_in;
    // wire[7:0] sram6_data_out;
    reg sram6_chip_enable, sram6_write_enable;
    sram_256x8 sram6(
        .Q(o_sram6_data),
        .CLK(i_clk),
        .CEN(sram6_chip_enable),
        .WEN(sram6_write_enable),
        .A(index_converter_converted_index),
        .D(sram6_data_in)
    );


    //sram 7
    // reg[7:0] sram7_addr;
    reg[7:0] sram7_data_in;
    // wire[7:0] sram7_data_out;
    reg sram7_chip_enable, sram7_write_enable;
    sram_256x8 sram7(
        .Q(o_sram7_data),
        .CLK(i_clk),
        .CEN(sram7_chip_enable),
        .WEN(sram7_write_enable),
        .A(index_converter_converted_index),
        .D(sram7_data_in)
    );


    //sram 8
    // reg[7:0] sram8_addr;
    reg[7:0] sram8_data_in;
    // wire[7:0] sram8_data_out;
    reg sram8_chip_enable, sram8_write_enable;
    sram_256x8 sram8(
        .Q(o_sram8_data),
        .CLK(i_clk),
        .CEN(sram8_chip_enable),
        .WEN(sram8_write_enable),
        .A(index_converter_converted_index),
        .D(sram8_data_in)
    );


    //sram 9
    // reg[7:0] sram9_addr;
    reg[7:0] sram9_data_in;
    // wire[7:0] sram9_data_out;
    reg sram9_chip_enable, sram9_write_enable;
    sram_256x8 sram9(
        .Q(o_sram9_data),
        .CLK(i_clk),
        .CEN(sram9_chip_enable),
        .WEN(sram9_write_enable),
        .A(index_converter_converted_index),
        .D(sram9_data_in)
    );


    //sram 10
    // reg[7:0] sram10_addr;
    reg[7:0] sram10_data_in;
    // wire[7:0] sram10_data_out;
    reg sram10_chip_enable, sram10_write_enable;
    sram_256x8 sram10(
        .Q(o_sram10_data),
        .CLK(i_clk),
        .CEN(sram10_chip_enable),
        .WEN(sram10_write_enable),
        .A(index_converter_converted_index),
        .D(sram10_data_in)
    );


    //sram 11
    // reg[7:0] sram11_addr;
    reg[7:0] sram11_data_in;
    // wire[7:0] sram11_data_out;
    reg sram11_chip_enable, sram11_write_enable;
    sram_256x8 sram11(
        .Q(o_sram11_data),
        .CLK(i_clk),
        .CEN(sram11_chip_enable),
        .WEN(sram11_write_enable),
        .A(index_converter_converted_index),
        .D(sram11_data_in)
    );


    //sram 12
    // reg[7:0] sram12_addr;
    reg[7:0] sram12_data_in;
    // wire[7:0] sram12_data_out;
    reg sram12_chip_enable, sram12_write_enable;
    sram_256x8 sram12(
        .Q(o_sram12_data),
        .CLK(i_clk),
        .CEN(sram12_chip_enable),
        .WEN(sram12_write_enable),
        .A(index_converter_converted_index),
        .D(sram12_data_in)
    );


    //sram 13
    // reg[7:0] sram13_addr;
    reg[7:0] sram13_data_in;
    // wire[7:0] sram13_data_out;
    reg sram13_chip_enable, sram13_write_enable;
    sram_256x8 sram13(
        .Q(o_sram13_data),
        .CLK(i_clk),
        .CEN(sram13_chip_enable),
        .WEN(sram13_write_enable),
        .A(index_converter_converted_index),
        .D(sram13_data_in)
    );


    //sram 14
    // reg[7:0] sram14_addr;
    reg[7:0] sram14_data_in;
    // wire[7:0] sram14_data_out;
    reg sram14_chip_enable, sram14_write_enable;
    sram_256x8 sram14(
        .Q(o_sram14_data),
        .CLK(i_clk),
        .CEN(sram14_chip_enable),
        .WEN(sram14_write_enable),
        .A(index_converter_converted_index),
        .D(sram14_data_in)
    );


    //sram 15
    // reg[7:0] sram15_addr;
    reg[7:0] sram15_data_in;
    // wire[7:0] sram15_data_out;
    reg sram15_chip_enable, sram15_write_enable;
    sram_256x8 sram15(
        .Q(o_sram15_data),
        .CLK(i_clk),
        .CEN(sram15_chip_enable),
        .WEN(sram15_write_enable),
        .A(index_converter_converted_index),
        .D(sram15_data_in)
    );


    //counter
    reg[4:0] counter0_value;
    reg count_counter0;
    reg reset_counter0;


    


    //states
    reg[4:0] current_state, next_state;
    localparam STATE_START = 5'd0;
    localparam STATE_PREPARE_BANK_0_UP = 5'd1;
    localparam STATE_PREPARE_BANK_0_DOWN = 5'd2;
    localparam STATE_PREPARE_BANK_0_LEFT = 5'd3;
    localparam STATE_PREPARE_BANK_0_RIGHT = 5'd4;
    localparam STATE_PREPARE_BANK_1_UP = 5'd5;
    localparam STATE_PREPARE_BANK_1_DOWN = 5'd6;
    localparam STATE_PREPARE_BANK_1_LEFT = 5'd7;
    localparam STATE_PREPARE_BANK_1_RIGHT = 5'd8;
    localparam STATE_OPERATE = 5'd9;


    always @(posedge i_clk or negedge i_rst_n) begin
        if(~i_rst_n) begin
            current_state <= STATE_START;
            counter0_value <= 0;
            // counter_y_value <= 0;
            // counter_channel_value <= 0;
            
        end
        else begin
            current_state <= next_state;

            if(reset_counter0) counter0_value <= 0;
            else if(count_counter0) counter0_value <= counter0_value + 1;

            // if(reset_counter_y) counter_y_value <= 0;
            // else if(count_counter_y) counter_y_value <= counter_y_value + 1;

            // if(reset_counter_channel) counter_channel_value <= 0;
            // else if(count_counter_channel) counter_channel_value <= counter_channel_value + 1; 

        end
        
    end

    //FSM
    always @(*) begin
        //defaults
        next_state = current_state;
        o_ready = 0;

        //sram0 control
        sram0_chip_enable = SRAM_CEN_ENABLE;
        sram0_write_enable = SRAM_WEN_READ;
        // sram0_addr = 0;
        sram0_data_in = 0;

        //sram1 control
        sram1_chip_enable = SRAM_CEN_ENABLE;
        sram1_write_enable = SRAM_WEN_READ;
        // sram1_addr = 0;
        sram1_data_in = 0;

        //sram2 control
        sram2_chip_enable = SRAM_CEN_ENABLE;
        sram2_write_enable = SRAM_WEN_READ;
        // sram2_addr = 0;
        sram2_data_in = 0;

        //sram3 control
        sram3_chip_enable = SRAM_CEN_ENABLE;
        sram3_write_enable = SRAM_WEN_READ;
        // sram3_addr = 0;
        sram3_data_in = 0;

        //sram4 control
        sram4_chip_enable = SRAM_CEN_ENABLE;
        sram4_write_enable = SRAM_WEN_READ;
        // sram4_addr = 0;
        sram4_data_in = 0;

        //sram5 control
        sram5_chip_enable = SRAM_CEN_ENABLE;
        sram5_write_enable = SRAM_WEN_READ;
        // sram5_addr = 0;
        sram5_data_in = 0;

        //sram6 control
        sram6_chip_enable = SRAM_CEN_ENABLE;
        sram6_write_enable = SRAM_WEN_READ;
        // sram6_addr = 0;
        sram6_data_in = 0;

        //sram7 control
        sram7_chip_enable = SRAM_CEN_ENABLE;
        sram7_write_enable = SRAM_WEN_READ;
        // sram7_addr = 0;
        sram7_data_in = 0;

        //sram8 control
        sram8_chip_enable = SRAM_CEN_ENABLE;
        sram8_write_enable = SRAM_WEN_READ;
        // sram8_addr = 0;
        sram8_data_in = 0;

        //sram9 control
        sram9_chip_enable = SRAM_CEN_ENABLE;
        sram9_write_enable = SRAM_WEN_READ;
        // sram9_addr = 0;
        sram9_data_in = 0;

        //sram10 control
        sram10_chip_enable = SRAM_CEN_ENABLE;
        sram10_write_enable = SRAM_WEN_READ;
        // sram10_addr = 0;
        sram10_data_in = 0;

        //sram11 control
        sram11_chip_enable = SRAM_CEN_ENABLE;
        sram11_write_enable = SRAM_WEN_READ;
        // sram11_addr = 0;
        sram11_data_in = 0;

        //sram12 control
        sram12_chip_enable = SRAM_CEN_ENABLE;
        sram12_write_enable = SRAM_WEN_READ;
        // sram12_addr = 0;
        sram12_data_in = 0;

        //sram13 control
        sram13_chip_enable = SRAM_CEN_ENABLE;
        sram13_write_enable = SRAM_WEN_READ;
        // sram13_addr = 0;
        sram13_data_in = 0;

        //sram14 control
        sram14_chip_enable = SRAM_CEN_ENABLE;
        sram14_write_enable = SRAM_WEN_READ;
        // sram14_addr = 0;
        sram14_data_in = 0;

        //sram15 control
        sram15_chip_enable = SRAM_CEN_ENABLE;
        sram15_write_enable = SRAM_WEN_READ;
        // sram15_addr = 0;
        sram15_data_in = 0;

        //index converter control
        index_converter_x = i_read_x;
        index_converter_y = i_read_y;
        index_converter_channel = 0;

        //counter control
        count_counter0 = 0;
        reset_counter0 = 0;   


        case (current_state)
            STATE_START: begin
                next_state = STATE_PREPARE_BANK_0_UP;
            end
            STATE_PREPARE_BANK_0_UP: begin
                //sram[x=0][y=0] ~ sram[x=9][y=0] set to zero
                //write to all srams
                sram0_write_enable = SRAM_WEN_WRITE;
                sram1_write_enable = SRAM_WEN_WRITE;
                sram2_write_enable = SRAM_WEN_WRITE;
                sram3_write_enable = SRAM_WEN_WRITE;
                sram4_write_enable = SRAM_WEN_WRITE;
                sram5_write_enable = SRAM_WEN_WRITE;
                sram6_write_enable = SRAM_WEN_WRITE;
                sram7_write_enable = SRAM_WEN_WRITE;
                sram8_write_enable = SRAM_WEN_WRITE;
                sram9_write_enable = SRAM_WEN_WRITE;
                sram10_write_enable = SRAM_WEN_WRITE;
                sram11_write_enable = SRAM_WEN_WRITE;
                sram12_write_enable = SRAM_WEN_WRITE;
                sram13_write_enable = SRAM_WEN_WRITE;
                sram14_write_enable = SRAM_WEN_WRITE;
                sram15_write_enable = SRAM_WEN_WRITE;

                index_converter_x = counter0_value;
                index_converter_y = 0;
                index_converter_channel = 0;

                if(counter0_value == 9) begin
                    reset_counter0 = 1;
                    next_state = STATE_PREPARE_BANK_0_DOWN;
                end
                else
                    count_counter0 = 1;
            end
            STATE_PREPARE_BANK_0_DOWN: begin
                //sram[x=0][y=9] ~ sram[x=9][y=9] set to zero
                sram0_write_enable = SRAM_WEN_WRITE;
                sram1_write_enable = SRAM_WEN_WRITE;
                sram2_write_enable = SRAM_WEN_WRITE;
                sram3_write_enable = SRAM_WEN_WRITE;
                sram4_write_enable = SRAM_WEN_WRITE;
                sram5_write_enable = SRAM_WEN_WRITE;
                sram6_write_enable = SRAM_WEN_WRITE;
                sram7_write_enable = SRAM_WEN_WRITE;
                sram8_write_enable = SRAM_WEN_WRITE;
                sram9_write_enable = SRAM_WEN_WRITE;
                sram10_write_enable = SRAM_WEN_WRITE;
                sram11_write_enable = SRAM_WEN_WRITE;
                sram12_write_enable = SRAM_WEN_WRITE;
                sram13_write_enable = SRAM_WEN_WRITE;
                sram14_write_enable = SRAM_WEN_WRITE;
                sram15_write_enable = SRAM_WEN_WRITE;

                index_converter_x = counter0_value;
                index_converter_y = 9;
                index_converter_channel = 0;

                if(counter0_value == 9) begin
                    reset_counter0 = 1;
                    next_state = STATE_PREPARE_BANK_0_LEFT;
                end
                else
                    count_counter0 = 1;
            end
            STATE_PREPARE_BANK_0_LEFT: begin
                //sram[x=0][y=0] ~ sram[x=0][y=9] set to zero
                sram0_write_enable = SRAM_WEN_WRITE;
                sram1_write_enable = SRAM_WEN_WRITE;
                sram2_write_enable = SRAM_WEN_WRITE;
                sram3_write_enable = SRAM_WEN_WRITE;
                sram4_write_enable = SRAM_WEN_WRITE;
                sram5_write_enable = SRAM_WEN_WRITE;
                sram6_write_enable = SRAM_WEN_WRITE;
                sram7_write_enable = SRAM_WEN_WRITE;
                sram8_write_enable = SRAM_WEN_WRITE;
                sram9_write_enable = SRAM_WEN_WRITE;
                sram10_write_enable = SRAM_WEN_WRITE;
                sram11_write_enable = SRAM_WEN_WRITE;
                sram12_write_enable = SRAM_WEN_WRITE;
                sram13_write_enable = SRAM_WEN_WRITE;
                sram14_write_enable = SRAM_WEN_WRITE;
                sram15_write_enable = SRAM_WEN_WRITE;

                index_converter_x = 0;
                index_converter_y = counter0_value;
                index_converter_channel = 0;

                if(counter0_value == 9) begin
                    reset_counter0 = 1;
                    next_state = STATE_PREPARE_BANK_0_RIGHT;
                end
                else
                    count_counter0 = 1;

            end
            STATE_PREPARE_BANK_0_RIGHT: begin
                //sram[x=9][y=0] ~ sram[x=9][y=9] set to zero
                sram0_write_enable = SRAM_WEN_WRITE;
                sram1_write_enable = SRAM_WEN_WRITE;
                sram2_write_enable = SRAM_WEN_WRITE;
                sram3_write_enable = SRAM_WEN_WRITE;
                sram4_write_enable = SRAM_WEN_WRITE;
                sram5_write_enable = SRAM_WEN_WRITE;
                sram6_write_enable = SRAM_WEN_WRITE;
                sram7_write_enable = SRAM_WEN_WRITE;
                sram8_write_enable = SRAM_WEN_WRITE;
                sram9_write_enable = SRAM_WEN_WRITE;
                sram10_write_enable = SRAM_WEN_WRITE;
                sram11_write_enable = SRAM_WEN_WRITE;
                sram12_write_enable = SRAM_WEN_WRITE;
                sram13_write_enable = SRAM_WEN_WRITE;
                sram14_write_enable = SRAM_WEN_WRITE;
                sram15_write_enable = SRAM_WEN_WRITE;

                index_converter_x = 9;
                index_converter_y = counter0_value;
                index_converter_channel = 0;

                if(counter0_value == 9) begin
                    reset_counter0 = 1;
                    next_state = STATE_PREPARE_BANK_1_UP;
                end
                else
                    count_counter0 = 1;
            end
            STATE_PREPARE_BANK_1_UP: begin
                //sram[x=0][y=0] ~ sram[x=9][y=0] set to zero for bank 1
                sram0_write_enable = SRAM_WEN_WRITE;
                sram1_write_enable = SRAM_WEN_WRITE;
                sram2_write_enable = SRAM_WEN_WRITE;
                sram3_write_enable = SRAM_WEN_WRITE;
                sram4_write_enable = SRAM_WEN_WRITE;
                sram5_write_enable = SRAM_WEN_WRITE;
                sram6_write_enable = SRAM_WEN_WRITE;
                sram7_write_enable = SRAM_WEN_WRITE;
                sram8_write_enable = SRAM_WEN_WRITE;
                sram9_write_enable = SRAM_WEN_WRITE;
                sram10_write_enable = SRAM_WEN_WRITE;
                sram11_write_enable = SRAM_WEN_WRITE;
                sram12_write_enable = SRAM_WEN_WRITE;
                sram13_write_enable = SRAM_WEN_WRITE;
                sram14_write_enable = SRAM_WEN_WRITE;
                sram15_write_enable = SRAM_WEN_WRITE;

                index_converter_x = counter0_value;
                index_converter_y = 0;
                index_converter_channel = 16;


                if(counter0_value == 9) begin
                    reset_counter0 = 1;
                    next_state = STATE_PREPARE_BANK_1_DOWN;
                end
                else
                    count_counter0 = 1;
            end
            STATE_PREPARE_BANK_1_DOWN: begin
                //sram[x=0][y=9] ~ sram[x=9][y=9] set to zero for bank 1
                sram0_write_enable = SRAM_WEN_WRITE;
                sram1_write_enable = SRAM_WEN_WRITE;
                sram2_write_enable = SRAM_WEN_WRITE;
                sram3_write_enable = SRAM_WEN_WRITE;
                sram4_write_enable = SRAM_WEN_WRITE;
                sram5_write_enable = SRAM_WEN_WRITE;
                sram6_write_enable = SRAM_WEN_WRITE;
                sram7_write_enable = SRAM_WEN_WRITE;
                sram8_write_enable = SRAM_WEN_WRITE;
                sram9_write_enable = SRAM_WEN_WRITE;
                sram10_write_enable = SRAM_WEN_WRITE;
                sram11_write_enable = SRAM_WEN_WRITE;
                sram12_write_enable = SRAM_WEN_WRITE;
                sram13_write_enable = SRAM_WEN_WRITE;
                sram14_write_enable = SRAM_WEN_WRITE;
                sram15_write_enable = SRAM_WEN_WRITE;

                index_converter_x = counter0_value;
                index_converter_y = 9;
                index_converter_channel = 16;


                if(counter0_value == 9) begin
                    reset_counter0 = 1;
                    next_state = STATE_PREPARE_BANK_1_LEFT;
                end
                else
                    count_counter0 = 1;
            end
            STATE_PREPARE_BANK_1_LEFT: begin
                //sram[x=0][y=0] ~ sram[x=0][y=9] set to zero for bank 1
                sram0_write_enable = SRAM_WEN_WRITE;
                sram1_write_enable = SRAM_WEN_WRITE;
                sram2_write_enable = SRAM_WEN_WRITE;
                sram3_write_enable = SRAM_WEN_WRITE;
                sram4_write_enable = SRAM_WEN_WRITE;
                sram5_write_enable = SRAM_WEN_WRITE;
                sram6_write_enable = SRAM_WEN_WRITE;
                sram7_write_enable = SRAM_WEN_WRITE;
                sram8_write_enable = SRAM_WEN_WRITE;
                sram9_write_enable = SRAM_WEN_WRITE;
                sram10_write_enable = SRAM_WEN_WRITE;
                sram11_write_enable = SRAM_WEN_WRITE;
                sram12_write_enable = SRAM_WEN_WRITE;
                sram13_write_enable = SRAM_WEN_WRITE;
                sram14_write_enable = SRAM_WEN_WRITE;
                sram15_write_enable = SRAM_WEN_WRITE;

                index_converter_x = 0;
                index_converter_y = counter0_value;
                index_converter_channel = 16;

                if(counter0_value == 9) begin
                    reset_counter0 = 1;
                    next_state = STATE_PREPARE_BANK_1_RIGHT;
                end
                else
                    count_counter0 = 1;
            end
            STATE_PREPARE_BANK_1_RIGHT: begin
                //sram[x=9][y=0] ~ sram[x=9][y=9] set to zero for bank 1
                sram0_write_enable = SRAM_WEN_WRITE;
                sram1_write_enable = SRAM_WEN_WRITE;
                sram2_write_enable = SRAM_WEN_WRITE;
                sram3_write_enable = SRAM_WEN_WRITE;
                sram4_write_enable = SRAM_WEN_WRITE;
                sram5_write_enable = SRAM_WEN_WRITE;
                sram6_write_enable = SRAM_WEN_WRITE;
                sram7_write_enable = SRAM_WEN_WRITE;
                sram8_write_enable = SRAM_WEN_WRITE;
                sram9_write_enable = SRAM_WEN_WRITE;
                sram10_write_enable = SRAM_WEN_WRITE;
                sram11_write_enable = SRAM_WEN_WRITE;
                sram12_write_enable = SRAM_WEN_WRITE;
                sram13_write_enable = SRAM_WEN_WRITE;
                sram14_write_enable = SRAM_WEN_WRITE;
                sram15_write_enable = SRAM_WEN_WRITE;

                index_converter_x = 9;
                index_converter_y = counter0_value;
                index_converter_channel = 16;

                
                if(counter0_value == 9) begin
                    reset_counter0 = 1;
                    next_state = STATE_OPERATE;
                end
                else
                    count_counter0 = 1;
            end
            STATE_OPERATE: begin
                o_ready = 1;
                
                //if write enable, write to sram
                if(i_write_enable == 1'b1) begin
                    index_converter_x = i_write_x;
                    index_converter_y = i_write_y;
                    index_converter_channel = i_write_channel;
                    case (index_converter_sram_select) //select sram to write to
                        4'd0: begin
                            sram0_write_enable = SRAM_WEN_WRITE;
                            sram0_data_in = i_write_data;
                        end
                        4'd1: begin
                            sram1_write_enable = SRAM_WEN_WRITE;
                            sram1_data_in = i_write_data;
                        end
                        4'd2: begin
                            sram2_write_enable = SRAM_WEN_WRITE;
                            sram2_data_in = i_write_data;
                        end
                        4'd3: begin
                            sram3_write_enable = SRAM_WEN_WRITE;
                            sram3_data_in = i_write_data;
                        end
                        4'd4: begin
                            sram4_write_enable = SRAM_WEN_WRITE;
                            sram4_data_in = i_write_data;
                        end
                        4'd5: begin
                            sram5_write_enable = SRAM_WEN_WRITE;
                            sram5_data_in = i_write_data;
                        end
                        4'd6: begin
                            sram6_write_enable = SRAM_WEN_WRITE;
                            sram6_data_in = i_write_data;
                        end
                        4'd7: begin
                            sram7_write_enable = SRAM_WEN_WRITE;
                            sram7_data_in = i_write_data;
                        end
                        4'd8: begin
                            sram8_write_enable = SRAM_WEN_WRITE;
                            sram8_data_in = i_write_data;
                        end
                        4'd9: begin
                            sram9_write_enable = SRAM_WEN_WRITE;
                            sram9_data_in = i_write_data;
                        end
                        4'd10: begin
                            sram10_write_enable = SRAM_WEN_WRITE;
                            sram10_data_in = i_write_data;
                        end
                        4'd11: begin
                            sram11_write_enable = SRAM_WEN_WRITE;
                            sram11_data_in = i_write_data;
                        end
                        4'd12: begin
                            sram12_write_enable = SRAM_WEN_WRITE;
                            sram12_data_in = i_write_data;
                        end
                        4'd13: begin
                            sram13_write_enable = SRAM_WEN_WRITE;
                            sram13_data_in = i_write_data;
                        end
                        4'd14: begin
                            sram14_write_enable = SRAM_WEN_WRITE;
                            sram14_data_in = i_write_data;
                        end
                        4'd15: begin
                            sram15_write_enable = SRAM_WEN_WRITE;
                            sram15_data_in = i_write_data;
                        end
                    endcase
                    
                end
                else begin //read from sram
                    index_converter_x = i_read_x;
                    index_converter_y = i_read_y;
                    if(i_read_bank == 0) begin
                        index_converter_channel = 0;
                    end
                    else begin
                        index_converter_channel = 16;
                    end
                end

            end



        endcase


    end

    
endmodule