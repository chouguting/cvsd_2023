module registers(
    input   i_clk,
    input   i_rst_n,
    input[4:0] i_read_reg_sel_1,
    input[4:0] i_read_reg_sel_2,
    input[4:0] i_write_reg_sel,
    input[31:0] i_write_data,
    input i_write_enable,
    output [31:0] o_read_data_1,
    output [31:0] o_read_data_2
);
    reg [31:0] registers[0:31];

    assign o_read_data_1 = registers[i_read_reg_sel_1];
    assign o_read_data_2 = registers[i_read_reg_sel_2];

    always @(posedge i_clk or negedge i_rst_n) begin
        if(~i_rst_n) begin
            registers[0] <= 0;
            registers[1] <= 0;
            registers[2] <= 0;
            registers[3] <= 0;
            registers[4] <= 0;
            registers[5] <= 0;
            registers[6] <= 0;
            registers[7] <= 0;
            registers[8] <= 0;
            registers[9] <= 0;
            registers[10] <= 0;
            registers[11] <= 0;
            registers[12] <= 0;
            registers[13] <= 0;
            registers[14] <= 0;
            registers[15] <= 0;
            registers[16] <= 0;
            registers[17] <= 0;
            registers[18] <= 0;
            registers[19] <= 0;
            registers[20] <= 0;
            registers[21] <= 0;
            registers[22] <= 0;
            registers[23] <= 0;
            registers[24] <= 0;
            registers[25] <= 0;
            registers[26] <= 0;
            registers[27] <= 0;
            registers[28] <= 0;
            registers[29] <= 0;
            registers[30] <= 0;
            registers[31] <= 0;
        end
        else begin
            if(i_write_enable) begin
                registers[i_write_reg_sel] <= i_write_data;
            end
        end
        
    end








endmodule