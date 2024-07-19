module QR_Engine (
    i_clk,
    i_rst,
    i_trig,
    i_data,
    o_rd_vld,
    o_last_data,
    o_y_hat,
    o_r
);

// IO description
input          i_clk;
input          i_rst;
input          i_trig;
input  [ 47:0] i_data;
output         o_rd_vld;
output         o_last_data;
output [159:0] o_y_hat;
output [319:0] o_r;

// ---------------------------------------------------------------------------
// Parameters
// ---------------------------------------------------------------------------
parameter S1_11_WIDTH = 13;
parameter S3_9_WIDTH  = 13;
parameter S3_11_WIDTH = 15;
parameter S3_16_WIDTH = 20;
parameter PRODCUT_WIDTH = S1_11_WIDTH * 2;
parameter S6_11_WIDTH = 18;
parameter SQUARE_SUM_WIDTH = S6_11_WIDTH;
parameter SQUARE_SUM_U_WIDTH = SQUARE_SUM_WIDTH - 1;

// ---------------------------------------------------------------------------
// Wires and Registers
// ---------------------------------------------------------------------------
// reg         o_rd_vld_r;
// reg         o_rd_vld_w;
reg         o_last_data_r;
// reg         o_last_data_w;
// reg [159:0] o_y_hat_r;
// reg [319:0] o_r_r;

// reg        i_trig_r;
// reg [47:0] i_data_r;
reg [4:0]  data_buf_cnt_r;
reg [4:0]  data_buf_cnt_w;
reg [3:0]  QRD_cnt_r;
reg        load_buf_id;
reg        out_sel;

wire QRD_finish;

wire one_RE_finish = QRD_cnt_r == 4'd10;

// ---------------------------------------------------------------------------
// Control reg
// ---------------------------------------------------------------------------

wire [159:0] core_0_y_hat;
wire [319:0] core_0_r;
wire         core_0_finish;
core CORE_0(
    .i_clk(i_clk),
    .i_rst(i_rst),
    .i_trig(i_trig & load_buf_id == 0),
    .i_data(i_data),
    .i_data_buf_cnt(data_buf_cnt_r),
    .i_one_RE_finish(one_RE_finish),
    .o_y_hat(core_0_y_hat),
    .o_r(core_0_r), 
    .QRD_finish(core_0_finish)
);

wire [159:0] core_1_y_hat;
wire [319:0] core_1_r;
wire         core_1_finish;
core CORE_1(
    .i_clk(i_clk),
    .i_rst(i_rst),
    .i_trig(i_trig & load_buf_id == 1),
    .i_data(i_data),
    .i_data_buf_cnt(data_buf_cnt_r),
    .i_one_RE_finish(one_RE_finish),
    .o_y_hat(core_1_y_hat),
    .o_r(core_1_r), 
    .QRD_finish(core_1_finish)
);

// ---------------------------------------------------------------------------
// Continuous Assignment
// ---------------------------------------------------------------------------
assign QRD_finish  = core_0_finish | core_1_finish;

assign o_rd_vld    = QRD_finish;
assign o_last_data = o_last_data_r;
assign o_y_hat     = (out_sel) ? core_1_y_hat : core_0_y_hat;
assign o_r         = (out_sel) ? core_1_r     : core_0_r    ;

// ---------------------------------------------------------------------------
// Combinational Blocks
// ---------------------------------------------------------------------------
always @(*) begin
    if(data_buf_cnt_r == 5'd0)begin
        data_buf_cnt_w = 5'd1;
    end
    else if(data_buf_cnt_r == 5'd19)begin
        data_buf_cnt_w = 5'd0;
    end
    else begin
        data_buf_cnt_w = data_buf_cnt_r + 1'd1;
    end    
end

// ---------------------------------------------------------------------------
// Control reg
// ---------------------------------------------------------------------------

always @(posedge i_clk, posedge i_rst) begin
    if(i_rst)begin
        load_buf_id <= 1'b0;
    end
    else if(data_buf_cnt_r == 5'd19)begin
        load_buf_id <= ~load_buf_id;
    end
end

always @(posedge i_clk, posedge i_rst) begin
    if(i_rst)begin
        data_buf_cnt_r <= 5'd0;
    end
    else if(i_trig)begin
       data_buf_cnt_r <= data_buf_cnt_w;
    end
end

always @(posedge i_clk, posedge i_rst) begin
    if(i_rst)begin
        o_last_data_r <= 1'b0;
    end
    else if(QRD_cnt_r == 4'd10)begin
        o_last_data_r <= 1'b1;
    end
    else if(o_last_data_r)begin
        o_last_data_r <= 1'b0;
    end
end

always @(posedge i_clk, posedge i_rst) begin
    if(i_rst)begin
        QRD_cnt_r <= 4'd0;
    end
    else if(QRD_cnt_r == 4'd10)begin
        QRD_cnt_r <= 4'd0;
    end
    else if(QRD_finish)begin
        QRD_cnt_r <= QRD_cnt_r + 1;
    end
end

always @(posedge i_clk, posedge i_rst) begin
    if(i_rst)begin
        out_sel <= 1'b0;
    end
    else if(QRD_finish)begin
        out_sel <= ~out_sel;
    end
end

endmodule