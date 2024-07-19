module cordicModule (
    input          i_clk,
    input          i_rst,
    input          i_start,
    input  [3:0]   i_vector_location, //the main vector location (choose from 8 vector) 
    //(x[i],y[i]) forms 8 complex valued vectors
    input  [47:0]  i_x_data[0:7], //a row of complex numbers (48 bits each)
    input  [47:0]  i_y_data[0:7], //a row of complex numbers (48 bits each)
    //output result
    output         o_calculation_finished,
    output [48:0]  o_x_data[0:7], //a row of complex numbers (48 bits each)
    output [48:0]  o_y_data[0:7]  //a row of complex numbers (48 bits each)
);

    
endmodule