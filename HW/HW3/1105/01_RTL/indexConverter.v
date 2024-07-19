module indexConverter (
    input[3:0] i_x,  //max=10
    input[3:0] i_y,  //max=10
    input[4:0] i_channel,  //max=32
    output reg o_bank_select, //max=1
    output reg [3:0] o_sram_select, //max=15
    output reg [7:0] o_index //256 = 2^8
);

    // assign o_index = i_x + i_y*10 + i_channel*100;
    always @(*) begin
        if(i_channel > 15) begin //i_channel > 15, second bank
            o_bank_select = 1;
            o_sram_select = i_channel - 16; //range 0-15
            o_index = i_x + i_y*10 + 100; //range 100-199
        end
        else begin //i_channel <= 15, first bank
            o_bank_select = 0;
            o_sram_select = i_channel; //range 0-15
            o_index = i_x + i_y*10; //range 0-99
        end
    end
    
endmodule