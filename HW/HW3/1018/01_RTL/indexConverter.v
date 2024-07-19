module indexConverter (
    input[3:0] i_x,  //max=10
    input[3:0] i_y,  //max=10
    input[4:0] i_z,  //max=32
    output wire [11:0] o_index //4096 = 2^12
);

    assign o_index = i_x + i_y*10 + i_z*100;
    
endmodule