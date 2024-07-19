module medianFinder (
    input [7:0] i_data0,
    input [7:0] i_data1,
    input [7:0] i_data2,
    input [7:0] i_data3,
    input [7:0] i_data4,
    input [7:0] i_data5,
    input [7:0] i_data6,
    input [7:0] i_data7,
    input [7:0] i_data8,
    output [7:0] o_median
);


    //wires
    wire [7:0] c1_c7, c1_c4;
    wire [7:0] c2_c8, c2_c5;
    wire [7:0] c3_c9, c3_c6;
    wire [7:0] c4_c7, c4_c15;
    wire [7:0] c5_c8, c5_c12;
    wire [7:0] c6_c9, c6_c12;
    wire [7:0] c7_c10, c7_c11;
    wire [7:0] c8_c10, c8_c11;
    wire [7:0] c9_c13, c9_c14;
    wire [7:0] c10_c13;
    wire [7:0] c11_c16, c11_c14;
    wire [7:0] c12_c15;
    wire [7:0] c13_c17;
    wire [7:0] c14_c16;
    wire [7:0] c15_c18;
    wire [7:0] c16_c17;
    wire [7:0] c17_c19, c17_c18;
    wire [7:0] c18_c19;
    wire [7:0] c19_median;

    assign o_median = c19_median;

    
    ComparatorSorter c1(.i_data0(i_data0), .i_data1(i_data1), .o_bigger(c1_c7), .o_smaller(c1_c4));
    ComparatorSorter c2(.i_data0(i_data3), .i_data1(i_data4), .o_bigger(c2_c8), .o_smaller(c2_c5));
    ComparatorSorter c3(.i_data0(i_data6), .i_data1(i_data7), .o_bigger(c3_c9), .o_smaller(c3_c6));
    ComparatorSorter c4(.i_data0(c1_c4), .i_data1(i_data2), .o_bigger(c4_c7), .o_smaller(c4_c15));
    ComparatorSorter c5(.i_data0(c2_c5), .i_data1(i_data5), .o_bigger(c5_c8), .o_smaller(c5_c12));
    ComparatorSorter c6(.i_data0(c3_c6), .i_data1(i_data8), .o_bigger(c6_c9), .o_smaller(c6_c12));
    ComparatorSorter c7(.i_data0(c1_c7), .i_data1(c4_c7), .o_bigger(c7_c10), .o_smaller(c7_c11));
    ComparatorSorter c8(.i_data0(c2_c8), .i_data1(c5_c8), .o_bigger(c8_c10), .o_smaller(c8_c11));
    ComparatorSorter c9(.i_data0(c3_c9), .i_data1(c6_c9), .o_bigger(c9_c13), .o_smaller(c9_c14));
    ComparatorSorter c10(.i_data0(c7_c10), .i_data1(c8_c10), .o_bigger(), .o_smaller(c10_c13));
    ComparatorSorter c11(.i_data0(c7_c11), .i_data1(c8_c11), .o_bigger(c11_c16), .o_smaller(c11_c14));
    ComparatorSorter c12(.i_data0(c5_c12), .i_data1(c6_c12), .o_bigger(c12_c15), .o_smaller());
    ComparatorSorter c13(.i_data0(c10_c13), .i_data1(c9_c13), .o_bigger(), .o_smaller(c13_c17));
    ComparatorSorter c14(.i_data0(c11_c14), .i_data1(c9_c14), .o_bigger(c14_c16), .o_smaller());
    ComparatorSorter c15(.i_data0(c4_c15), .i_data1(c12_c15), .o_bigger(c15_c18), .o_smaller());
    ComparatorSorter c16(.i_data0(c11_c16), .i_data1(c14_c16), .o_bigger(), .o_smaller(c16_c17));
    ComparatorSorter c17(.i_data0(c13_c17), .i_data1(c16_c17), .o_bigger(c17_c19), .o_smaller(c17_c18));
    ComparatorSorter c18(.i_data0(c17_c18), .i_data1(c15_c18), .o_bigger(c18_c19), .o_smaller());
    ComparatorSorter c19(.i_data0(c17_c19), .i_data1(c18_c19), .o_bigger(), .o_smaller(c19_median));
    
endmodule

module ComparatorSorter (
    input [7:0] i_data0,
    input [7:0] i_data1,
    output reg[7:0] o_bigger,
    output reg[7:0] o_smaller
);
    
    always @(*) begin
        if (i_data0 > i_data1) begin
            o_bigger = i_data0;
            o_smaller = i_data1;
        end
        else begin
            o_bigger = i_data1;
            o_smaller = i_data0;
        end
    end
    
endmodule