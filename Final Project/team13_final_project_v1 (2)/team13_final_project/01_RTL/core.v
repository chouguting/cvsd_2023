module core (
    i_clk,
    i_rst,
    i_trig,
    i_data,
    i_data_buf_cnt,
    i_one_RE_finish,
    o_y_hat,
    o_r, 
    QRD_finish
);

// IO description
input          i_clk;
input          i_rst;
input          i_trig;
input  [47:0]  i_data;
input  [4:0]   i_data_buf_cnt;
input          i_one_RE_finish;
output [159:0] o_y_hat;
output [319:0] o_r;
output         QRD_finish;

// ---------------------------------------------------------------------------
// Parameters
// ---------------------------------------------------------------------------
parameter S1_11_WIDTH = 13;
parameter S3_9_WIDTH  = 13;
parameter S3_11_WIDTH = 15;
parameter S3_16_WIDTH = 20;
parameter PRODCUT_WIDTH = S1_11_WIDTH * 2;
parameter S6_16_WIDTH = 23;
parameter S6_11_WIDTH = 18;
parameter SQUARE_SUM_WIDTH = S6_11_WIDTH;
parameter SQUARE_SUM_U_WIDTH = SQUARE_SUM_WIDTH - 1;
integer i;
// ---------------------------------------------------------------------------
// Wires and Registers
// ---------------------------------------------------------------------------
reg [39:0] y_hat_1_r;
reg [39:0] y_hat_2_r;
reg [39:0] y_hat_3_r;
reg [39:0] y_hat_4_r;

// reg [S1_11_WIDTH*2-1  : 0] data_buf_r [0:19]; // 1x input
reg signed [S3_16_WIDTH-1 : 0] mul_0_out_r;
reg signed [S3_16_WIDTH-1 : 0] mul_1_out_r;
reg signed [S3_16_WIDTH-1 : 0] mul_2_out_r;
reg signed [S3_16_WIDTH-1 : 0] mul_3_out_r;
reg signed [S3_16_WIDTH-1 : 0] mul_4_out_r;
reg signed [S3_16_WIDTH-1 : 0] mul_5_out_r;
reg signed [S3_16_WIDTH-1 : 0] mul_6_out_r;
reg signed [S3_16_WIDTH-1 : 0] mul_7_out_r;

reg [5:0] latency_r;
reg       core_start;
reg       first_round;
// reg [5:0] latency_w;

wire QRD_finish = (latency_r == 6'd6) & ~first_round; // delay 1 more (original: 5)


// input data
    reg [S1_11_WIDTH-1 : 0] H11_im;
    reg [S1_11_WIDTH-1 : 0] H11_re;
    reg [S1_11_WIDTH-1 : 0] H12_im;
    reg [S1_11_WIDTH-1 : 0] H12_re;
    reg [S1_11_WIDTH-1 : 0] H13_im;
    reg [S1_11_WIDTH-1 : 0] H13_re;
    reg [S1_11_WIDTH-1 : 0] H14_im;
    reg [S1_11_WIDTH-1 : 0] H14_re;

    reg [S1_11_WIDTH-1 : 0] H21_im;
    reg [S1_11_WIDTH-1 : 0] H21_re;
    reg [S1_11_WIDTH-1 : 0] H22_im;
    reg [S1_11_WIDTH-1 : 0] H22_re;
    reg [S1_11_WIDTH-1 : 0] H23_im;
    reg [S1_11_WIDTH-1 : 0] H23_re;
    reg [S1_11_WIDTH-1 : 0] H24_im;
    reg [S1_11_WIDTH-1 : 0] H24_re;

    reg [S1_11_WIDTH-1 : 0] H31_im;
    reg [S1_11_WIDTH-1 : 0] H31_re;
    reg [S1_11_WIDTH-1 : 0] H32_im;
    reg [S1_11_WIDTH-1 : 0] H32_re;
    reg [S1_11_WIDTH-1 : 0] H33_im;
    reg [S1_11_WIDTH-1 : 0] H33_re;
    reg [S1_11_WIDTH-1 : 0] H34_im;
    reg [S1_11_WIDTH-1 : 0] H34_re;

    reg [S1_11_WIDTH-1 : 0] H41_im;
    reg [S1_11_WIDTH-1 : 0] H41_re;
    reg [S1_11_WIDTH-1 : 0] H42_im;
    reg [S1_11_WIDTH-1 : 0] H42_re;
    reg [S1_11_WIDTH-1 : 0] H43_im;
    reg [S1_11_WIDTH-1 : 0] H43_re;
    reg [S1_11_WIDTH-1 : 0] H44_im;
    reg [S1_11_WIDTH-1 : 0] H44_re;

    reg [S1_11_WIDTH-1 : 0] Y1_im;
    reg [S1_11_WIDTH-1 : 0] Y1_re;
    reg [S1_11_WIDTH-1 : 0] Y2_im;
    reg [S1_11_WIDTH-1 : 0] Y2_re;
    reg [S1_11_WIDTH-1 : 0] Y3_im;
    reg [S1_11_WIDTH-1 : 0] Y3_re;
    reg [S1_11_WIDTH-1 : 0] Y4_im;
    reg [S1_11_WIDTH-1 : 0] Y4_re;

    reg [S1_11_WIDTH-1 : 0] Y1_buf_im;
    reg [S1_11_WIDTH-1 : 0] Y1_buf_re;
    reg [S1_11_WIDTH-1 : 0] Y2_buf_im;
    reg [S1_11_WIDTH-1 : 0] Y2_buf_re;
    reg [S1_11_WIDTH-1 : 0] Y3_buf_im;
    reg [S1_11_WIDTH-1 : 0] Y3_buf_re;
    
    // wire [S1_11_WIDTH*8-1 : 0] h1_i0 = {H11_im, H11_re, H21_im, H21_re, H31_im, H31_re, H41_im, H41_re};
    wire [S1_11_WIDTH*8-1 : 0] h2_i0 = {H12_im, H12_re, H22_im, H22_re, H32_im, H32_re, H42_im, H42_re};
    wire [S1_11_WIDTH*8-1 : 0] h3_i0 = {H13_im, H13_re, H23_im, H23_re, H33_im, H33_re, H43_im, H43_re};
    wire [S1_11_WIDTH*8-1 : 0] h4_i0 = {H14_im, H14_re, H24_im, H24_re, H34_im, H34_re, H44_im, H44_re};
    wire [S1_11_WIDTH*8-1 : 0] Y     = {Y1_buf_im, Y1_buf_re, Y2_buf_im, Y2_buf_re, Y3_buf_im, Y3_buf_re, Y4_im, Y4_re};


wire [S1_11_WIDTH*4-1 : 0] scalar_mul_half_w; 
// reg  [S1_11_WIDTH*8-1 : 0] scalar_mul_r; 
// wire [S3_16_WIDTH-1 : 0]   dot_product_im_w;
// wire [S3_16_WIDTH-1 : 0]   dot_product_re_w;
// wire [S3_16_WIDTH*2-1 : 0] dot_product_w;
wire [S3_16_WIDTH-1 : 0] dot_product_half_w;

wire [S1_11_WIDTH*8-1 : 0] e_w;


// pipeline reg
    reg [S1_11_WIDTH*8-1 : 0] e1;

    reg [S3_16_WIDTH-1   : 0] R11; // Real only
    reg [S3_16_WIDTH*2-1 : 0] R12;
    reg [S3_16_WIDTH*2-1 : 0] R13;
    reg [S3_16_WIDTH*2-1 : 0] R14;

    reg [S1_11_WIDTH*8-1 : 0] h2;
    reg [S1_11_WIDTH*8-1 : 0] h3;
    reg [S1_11_WIDTH*8-1 : 0] h4;

    // stage 12
    reg [S1_11_WIDTH*8-1 : 0] e2;

    reg [S3_16_WIDTH-1 : 0]   R22; // Real only
    reg [S3_16_WIDTH*2-1 : 0] R23;
    reg [S3_16_WIDTH*2-1 : 0] R24;

    // stage 23
    reg [S1_11_WIDTH*8-1 : 0] e3_e4;

    reg [S3_16_WIDTH-1   : 0] R33;
    reg [S3_16_WIDTH*2-1 : 0] R34;

    reg [S3_16_WIDTH-1 : 0] R44; 
// ---------------------------------------------------------------------------
// fisr Instance
// ---------------------------------------------------------------------------
parameter RIGHT = 1'b0;
parameter LEFT  = 1'b1;

// 17 bits, format: 6.11
wire [SQUARE_SUM_U_WIDTH-1 : 0] square_sum_u_w;
reg  [SQUARE_SUM_U_WIDTH-1 : 0] square_sum_u_r;

wire [S1_11_WIDTH-2 : 0]       isr_u_w; // unsign
wire [3:0]                     shift_amt_w;
wire                           shift_dir_w;

reg [S1_11_WIDTH-2 : 0]        isr_u_r; // unsign
reg [3:0]                      shift_amt_r;
reg                            shift_dir_r;

fisr FISR1(
    .i_square_sum_u(square_sum_u_r),  
    .o_isr(isr_u_w),           
    .o_isr_shift_amt(shift_amt_w),  
    .o_isr_shift_dir(shift_dir_w)
);

// ---------------------------------------------------------------------------
// vectorSub Instance
// ---------------------------------------------------------------------------
reg  [S1_11_WIDTH*4-1 : 0] VS_i_x;
wire [S1_11_WIDTH*4-1 : 0] VS_i_y = scalar_mul_half_w;

wire [S1_11_WIDTH*4-1 : 0] vec_diff_half_w;

always @(*) begin
    VS_i_x = 0;
    case (latency_r)
        6'd13:begin // cal h2_i1, MSB
            VS_i_x = h2_i0[S1_11_WIDTH*4 +: S1_11_WIDTH*4]; // h2_i0  
        end
        6'd14:begin // cal h2_i1, LSB
            VS_i_x = h2_i0[0 +: S1_11_WIDTH*4]; // h2_i0  
        end

        6'd15:begin // cal h3_i1
            VS_i_x = h3_i0[S1_11_WIDTH*4 +: S1_11_WIDTH*4]; // h3_i0  
        end
        6'd16:begin // cal h3_i1
            VS_i_x = h3_i0[0 +: S1_11_WIDTH*4]; // h3_i0  
        end

        6'd18:begin // cal h4_i1
            VS_i_x = h4_i0[S1_11_WIDTH*4 +: S1_11_WIDTH*4]; // h4_i0
        end
        6'd19:begin // cal h4_i1
            VS_i_x = h4_i0[0 +: S1_11_WIDTH*4]; // h4_i0
        end

        6'd24:begin // cal h3_i2
            VS_i_x = h3[S1_11_WIDTH*4 +: S1_11_WIDTH*4];
        end
        6'd25:begin // cal h3_i2
            VS_i_x = h3[0 +: S1_11_WIDTH*4];
        end
            
        6'd29:begin // cal h4_i2
            VS_i_x = h4[S1_11_WIDTH*4 +: S1_11_WIDTH*4];
        end
        6'd30:begin // cal h4_i2
            VS_i_x = h4[0 +: S1_11_WIDTH*4];
        end

        6'd35:begin // cal h4_i3
            VS_i_x = h4[S1_11_WIDTH*4 +: S1_11_WIDTH*4];
        end
        6'd36:begin // cal h4_i3
            VS_i_x = h4[0 +: S1_11_WIDTH*4];
        end
    endcase
end

wire signed [S1_11_WIDTH-1 : 0] d0_im = $signed(VS_i_x[S1_11_WIDTH*4-1 -: S1_11_WIDTH]) - $signed(VS_i_y[S1_11_WIDTH*4-1 -: S1_11_WIDTH]); 
wire signed [S1_11_WIDTH-1 : 0] d0_re = $signed(VS_i_x[S1_11_WIDTH*3-1 -: S1_11_WIDTH]) - $signed(VS_i_y[S1_11_WIDTH*3-1 -: S1_11_WIDTH]); 
wire signed [S1_11_WIDTH-1 : 0] d1_im = $signed(VS_i_x[S1_11_WIDTH*2-1 -: S1_11_WIDTH]) - $signed(VS_i_y[S1_11_WIDTH*2-1 -: S1_11_WIDTH]); 
wire signed [S1_11_WIDTH-1 : 0] d1_re = $signed(VS_i_x[S1_11_WIDTH*1-1 -: S1_11_WIDTH]) - $signed(VS_i_y[S1_11_WIDTH*1-1 -: S1_11_WIDTH]); 

assign vec_diff_half_w ={d0_im, d0_re, d1_im, d1_re};


// ---------------------------------------------------------------------------
// Multiplier (num: 17)
// ---------------------------------------------------------------------------
reg  signed [S1_11_WIDTH-1   : 0] mul_0_in_1;
reg  signed [S1_11_WIDTH-1   : 0] mul_0_in_1_r;
reg  signed [S1_11_WIDTH-1   : 0] mul_0_in_2;
reg  signed [S1_11_WIDTH-1   : 0] mul_0_in_2_r;
wire signed [PRODCUT_WIDTH-1 : 0] mul_0_out = mul_0_in_1_r * mul_0_in_2_r;
reg  signed [S1_11_WIDTH-1   : 0] mul_1_in_1;
reg  signed [S1_11_WIDTH-1   : 0] mul_1_in_1_r;
reg  signed [S1_11_WIDTH-1   : 0] mul_1_in_2;
reg  signed [S1_11_WIDTH-1   : 0] mul_1_in_2_r;
wire signed [PRODCUT_WIDTH-1 : 0] mul_1_out = mul_1_in_1_r * mul_1_in_2_r;
reg  signed [S1_11_WIDTH-1   : 0] mul_2_in_1;
reg  signed [S1_11_WIDTH-1   : 0] mul_2_in_1_r;
reg  signed [S1_11_WIDTH-1   : 0] mul_2_in_2;
reg  signed [S1_11_WIDTH-1   : 0] mul_2_in_2_r;
wire signed [PRODCUT_WIDTH-1 : 0] mul_2_out = mul_2_in_1_r * mul_2_in_2_r;
reg  signed [S1_11_WIDTH-1   : 0] mul_3_in_1;
reg  signed [S1_11_WIDTH-1   : 0] mul_3_in_1_r;
reg  signed [S1_11_WIDTH-1   : 0] mul_3_in_2;
reg  signed [S1_11_WIDTH-1   : 0] mul_3_in_2_r;
wire signed [PRODCUT_WIDTH-1 : 0] mul_3_out = mul_3_in_1_r * mul_3_in_2_r;
reg  signed [S1_11_WIDTH-1   : 0] mul_4_in_1;
reg  signed [S1_11_WIDTH-1   : 0] mul_4_in_1_r;
reg  signed [S1_11_WIDTH-1   : 0] mul_4_in_2;
reg  signed [S1_11_WIDTH-1   : 0] mul_4_in_2_r;
wire signed [PRODCUT_WIDTH-1 : 0] mul_4_out = mul_4_in_1_r * mul_4_in_2_r;
reg  signed [S1_11_WIDTH-1   : 0] mul_5_in_1;
reg  signed [S1_11_WIDTH-1   : 0] mul_5_in_1_r;
reg  signed [S1_11_WIDTH-1   : 0] mul_5_in_2;
reg  signed [S1_11_WIDTH-1   : 0] mul_5_in_2_r;
wire signed [PRODCUT_WIDTH-1 : 0] mul_5_out = mul_5_in_1_r * mul_5_in_2_r;
reg  signed [S1_11_WIDTH-1   : 0] mul_6_in_1;
reg  signed [S1_11_WIDTH-1   : 0] mul_6_in_1_r;
reg  signed [S1_11_WIDTH-1   : 0] mul_6_in_2;
reg  signed [S1_11_WIDTH-1   : 0] mul_6_in_2_r;
wire signed [PRODCUT_WIDTH-1 : 0] mul_6_out = mul_6_in_1_r * mul_6_in_2_r;
reg  signed [S1_11_WIDTH-1   : 0] mul_7_in_1;
reg  signed [S1_11_WIDTH-1   : 0] mul_7_in_1_r;
reg  signed [S1_11_WIDTH-1   : 0] mul_7_in_2;
reg  signed [S1_11_WIDTH-1   : 0] mul_7_in_2_r;
wire signed [PRODCUT_WIDTH-1 : 0] mul_7_out = mul_7_in_1_r * mul_7_in_2_r;

// unsign
wire  [SQUARE_SUM_WIDTH-2   : 0] mul_16_in_1 = square_sum_u_r; // unsign
wire  [S1_11_WIDTH-2        : 0] mul_16_in_2 = isr_u_r; // unsign
wire [(SQUARE_SUM_WIDTH-1)+(S1_11_WIDTH-1)-1 : 0] mul_16_out = mul_16_in_1 * mul_16_in_2;

// Multiplier input scheduling
always @(*) begin
    mul_0_in_1  = 0;
    mul_1_in_1  = 0;
    mul_2_in_1  = 0;
    mul_3_in_1  = 0;
    mul_4_in_1  = 0;
    mul_5_in_1  = 0;
    mul_6_in_1  = 0;
    mul_7_in_1  = 0;
   
    mul_0_in_2  = 0;
    mul_1_in_2  = 0;
    mul_2_in_2  = 0;
    mul_3_in_2  = 0;
    mul_4_in_2  = 0;
    mul_5_in_2  = 0;
    mul_6_in_2  = 0;
    mul_7_in_2  = 0;
    
    case (latency_r) // timing diagram - 1
        6'd1, 6'd41:begin // square h1_i0 -> R11
            mul_0_in_1 = H11_im; 
            mul_1_in_1 = H11_re; 
            mul_2_in_1 = H21_im; 
            mul_3_in_1 = H21_re; 
            mul_4_in_1 = H31_im; 
            mul_5_in_1 = H31_re; 
            mul_6_in_1 = i_data[47 -: S1_11_WIDTH]; 
            mul_7_in_1 = i_data[23 -: S1_11_WIDTH]; 

            mul_0_in_2 = H11_im;
            mul_1_in_2 = H11_re;
            mul_2_in_2 = H21_im;
            mul_3_in_2 = H21_re;
            mul_4_in_2 = H31_im;
            mul_5_in_2 = H31_re;
            mul_6_in_2 = i_data[47 -: S1_11_WIDTH];
            mul_7_in_2 = i_data[23 -: S1_11_WIDTH];
        end

        6'd2:begin // dot product: y_hat_4 (im part)
            mul_0_in_1  = Y[S1_11_WIDTH*8-1 -: S1_11_WIDTH];
            mul_1_in_1  = Y[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_2_in_1  = Y[S1_11_WIDTH*6-1 -: S1_11_WIDTH];
            mul_3_in_1  = Y[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_4_in_1  = Y[S1_11_WIDTH*4-1 -: S1_11_WIDTH];
            mul_5_in_1  = Y[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_6_in_1  = Y[S1_11_WIDTH*2-1 -: S1_11_WIDTH];
            mul_7_in_1  = Y[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
            
            mul_0_in_2  =  e3_e4[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_1_in_2  = ~e3_e4[S1_11_WIDTH*8-1 -: S1_11_WIDTH] + 1'b1; // conjugate
            mul_2_in_2  =  e3_e4[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_3_in_2  = ~e3_e4[S1_11_WIDTH*6-1 -: S1_11_WIDTH] + 1'b1;
            mul_4_in_2  =  e3_e4[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_5_in_2  = ~e3_e4[S1_11_WIDTH*4-1 -: S1_11_WIDTH] + 1'b1;
            mul_6_in_2  =  e3_e4[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
            mul_7_in_2  = ~e3_e4[S1_11_WIDTH*2-1 -: S1_11_WIDTH] + 1'b1;
        end

        6'd3: begin // dot product: y_hat_4 (re part)
            mul_0_in_1 = Y[S1_11_WIDTH*8-1 -: S1_11_WIDTH];
            mul_1_in_1 = Y[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_2_in_1 = Y[S1_11_WIDTH*6-1 -: S1_11_WIDTH];
            mul_3_in_1 = Y[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_4_in_1 = Y[S1_11_WIDTH*4-1 -: S1_11_WIDTH];
            mul_5_in_1 = Y[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_6_in_1 = Y[S1_11_WIDTH*2-1 -: S1_11_WIDTH];
            mul_7_in_1 = Y[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
            
            mul_0_in_2 = e3_e4[S1_11_WIDTH*8-1 -: S1_11_WIDTH];
            mul_1_in_2 = e3_e4[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_2_in_2 = e3_e4[S1_11_WIDTH*6-1 -: S1_11_WIDTH];
            mul_3_in_2 = e3_e4[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_4_in_2 = e3_e4[S1_11_WIDTH*4-1 -: S1_11_WIDTH];
            mul_5_in_2 = e3_e4[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_6_in_2 = e3_e4[S1_11_WIDTH*2-1 -: S1_11_WIDTH];
            mul_7_in_2 = e3_e4[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
        end

        6'd4:begin // normalize (=e1)
            mul_0_in_1 = H11_im;
            mul_1_in_1 = H11_re;
            mul_2_in_1 = H21_im;
            mul_3_in_1 = H21_re;
            mul_4_in_1 = H31_im;
            mul_5_in_1 = H31_re;
            mul_6_in_1 = H41_im;
            mul_7_in_1 = H41_re;

            // mul: isr
            mul_0_in_2 = {1'b0, isr_u_w};
            mul_1_in_2 = {1'b0, isr_u_w};
            mul_2_in_2 = {1'b0, isr_u_w};
            mul_3_in_2 = {1'b0, isr_u_w};
            mul_4_in_2 = {1'b0, isr_u_w};
            mul_5_in_2 = {1'b0, isr_u_w};
            mul_6_in_2 = {1'b0, isr_u_w};
            mul_7_in_2 = {1'b0, isr_u_w};
        end

        6'd5:begin // h2_i0 dot e1 (im part)
            mul_0_in_1  = h2_i0[S1_11_WIDTH*8-1 -: S1_11_WIDTH];
            mul_1_in_1  = h2_i0[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_2_in_1  = h2_i0[S1_11_WIDTH*6-1 -: S1_11_WIDTH];
            mul_3_in_1  = h2_i0[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_4_in_1  = h2_i0[S1_11_WIDTH*4-1 -: S1_11_WIDTH];
            mul_5_in_1  = h2_i0[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_6_in_1  = h2_i0[S1_11_WIDTH*2-1 -: S1_11_WIDTH];
            mul_7_in_1  = h2_i0[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
            
            mul_0_in_2  =  e_w[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_1_in_2  = ~e_w[S1_11_WIDTH*8-1 -: S1_11_WIDTH] + 1'b1; // conjugate
            mul_2_in_2  =  e_w[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_3_in_2  = ~e_w[S1_11_WIDTH*6-1 -: S1_11_WIDTH] + 1'b1;
            mul_4_in_2  =  e_w[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_5_in_2  = ~e_w[S1_11_WIDTH*4-1 -: S1_11_WIDTH] + 1'b1;
            mul_6_in_2  =  e_w[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
            mul_7_in_2  = ~e_w[S1_11_WIDTH*2-1 -: S1_11_WIDTH] + 1'b1;
        end

        6'd6:begin // h2_i0 dot e1 (re part)
            mul_0_in_1 = h2_i0[S1_11_WIDTH*8-1 -: S1_11_WIDTH];
            mul_1_in_1 = h2_i0[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_2_in_1 = h2_i0[S1_11_WIDTH*6-1 -: S1_11_WIDTH];
            mul_3_in_1 = h2_i0[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_4_in_1 = h2_i0[S1_11_WIDTH*4-1 -: S1_11_WIDTH];
            mul_5_in_1 = h2_i0[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_6_in_1 = h2_i0[S1_11_WIDTH*2-1 -: S1_11_WIDTH];
            mul_7_in_1 = h2_i0[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
            
            mul_0_in_2 = e1[S1_11_WIDTH*8-1 -: S1_11_WIDTH];
            mul_1_in_2 = e1[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_2_in_2 = e1[S1_11_WIDTH*6-1 -: S1_11_WIDTH];
            mul_3_in_2 = e1[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_4_in_2 = e1[S1_11_WIDTH*4-1 -: S1_11_WIDTH];
            mul_5_in_2 = e1[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_6_in_2 = e1[S1_11_WIDTH*2-1 -: S1_11_WIDTH];
            mul_7_in_2 = e1[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
        end

        6'd7:begin // h3_i0 dot e1 (im part)   
            mul_0_in_1  = h3_i0[S1_11_WIDTH*8-1 -: S1_11_WIDTH];
            mul_1_in_1  = h3_i0[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_2_in_1  = h3_i0[S1_11_WIDTH*6-1 -: S1_11_WIDTH];
            mul_3_in_1  = h3_i0[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_4_in_1  = h3_i0[S1_11_WIDTH*4-1 -: S1_11_WIDTH];
            mul_5_in_1  = h3_i0[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_6_in_1  = h3_i0[S1_11_WIDTH*2-1 -: S1_11_WIDTH];
            mul_7_in_1  = h3_i0[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
            
            mul_0_in_2  =  e1[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_1_in_2  = ~e1[S1_11_WIDTH*8-1 -: S1_11_WIDTH] + 1'b1; // conjugate
            mul_2_in_2  =  e1[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_3_in_2  = ~e1[S1_11_WIDTH*6-1 -: S1_11_WIDTH] + 1'b1;
            mul_4_in_2  =  e1[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_5_in_2  = ~e1[S1_11_WIDTH*4-1 -: S1_11_WIDTH] + 1'b1;
            mul_6_in_2  =  e1[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
            mul_7_in_2  = ~e1[S1_11_WIDTH*2-1 -: S1_11_WIDTH] + 1'b1;
        end

        6'd8:begin // h3_i0 dot e1 (re part)
            mul_0_in_1 = h3_i0[S1_11_WIDTH*8-1 -: S1_11_WIDTH];
            mul_1_in_1 = h3_i0[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_2_in_1 = h3_i0[S1_11_WIDTH*6-1 -: S1_11_WIDTH];
            mul_3_in_1 = h3_i0[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_4_in_1 = h3_i0[S1_11_WIDTH*4-1 -: S1_11_WIDTH];
            mul_5_in_1 = h3_i0[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_6_in_1 = h3_i0[S1_11_WIDTH*2-1 -: S1_11_WIDTH];
            mul_7_in_1 = h3_i0[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
            
            mul_0_in_2 = e1[S1_11_WIDTH*8-1 -: S1_11_WIDTH];
            mul_1_in_2 = e1[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_2_in_2 = e1[S1_11_WIDTH*6-1 -: S1_11_WIDTH];
            mul_3_in_2 = e1[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_4_in_2 = e1[S1_11_WIDTH*4-1 -: S1_11_WIDTH];
            mul_5_in_2 = e1[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_6_in_2 = e1[S1_11_WIDTH*2-1 -: S1_11_WIDTH];
            mul_7_in_2 = e1[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
        end

        6'd9:begin // h4_i0 dot e1 (im part)  
            mul_0_in_1  = h4_i0[S1_11_WIDTH*8-1 -: S1_11_WIDTH];
            mul_1_in_1  = h4_i0[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_2_in_1  = h4_i0[S1_11_WIDTH*6-1 -: S1_11_WIDTH];
            mul_3_in_1  = h4_i0[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_4_in_1  = h4_i0[S1_11_WIDTH*4-1 -: S1_11_WIDTH];
            mul_5_in_1  = h4_i0[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_6_in_1  = h4_i0[S1_11_WIDTH*2-1 -: S1_11_WIDTH];
            mul_7_in_1  = h4_i0[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
            
            mul_0_in_2  =  e1[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_1_in_2  = ~e1[S1_11_WIDTH*8-1 -: S1_11_WIDTH] + 1'b1; // conjugate
            mul_2_in_2  =  e1[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_3_in_2  = ~e1[S1_11_WIDTH*6-1 -: S1_11_WIDTH] + 1'b1;
            mul_4_in_2  =  e1[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_5_in_2  = ~e1[S1_11_WIDTH*4-1 -: S1_11_WIDTH] + 1'b1;
            mul_6_in_2  =  e1[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
            mul_7_in_2  = ~e1[S1_11_WIDTH*2-1 -: S1_11_WIDTH] + 1'b1;
        end

        6'd10:begin // h4_i0 dot e1 (re part)   
            mul_0_in_1 = h4_i0[S1_11_WIDTH*8-1 -: S1_11_WIDTH];
            mul_1_in_1 = h4_i0[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_2_in_1 = h4_i0[S1_11_WIDTH*6-1 -: S1_11_WIDTH];
            mul_3_in_1 = h4_i0[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_4_in_1 = h4_i0[S1_11_WIDTH*4-1 -: S1_11_WIDTH];
            mul_5_in_1 = h4_i0[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_6_in_1 = h4_i0[S1_11_WIDTH*2-1 -: S1_11_WIDTH];
            mul_7_in_1 = h4_i0[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
            
            mul_0_in_2 = e1[S1_11_WIDTH*8-1 -: S1_11_WIDTH];
            mul_1_in_2 = e1[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_2_in_2 = e1[S1_11_WIDTH*6-1 -: S1_11_WIDTH];
            mul_3_in_2 = e1[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_4_in_2 = e1[S1_11_WIDTH*4-1 -: S1_11_WIDTH];
            mul_5_in_2 = e1[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_6_in_2 = e1[S1_11_WIDTH*2-1 -: S1_11_WIDTH];
            mul_7_in_2 = e1[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
        end

        6'd11:begin // scalar mul: R12 * e1 (z0, z1)
            mul_0_in_1 = R12[S3_16_WIDTH*2-1 -: S1_11_WIDTH];
            mul_1_in_1 = R12[S3_16_WIDTH*1-1 -: S1_11_WIDTH];
            mul_2_in_1 = ~R12[S3_16_WIDTH*2-1 -: S1_11_WIDTH] + 1'b1;
            mul_3_in_1 = R12[S3_16_WIDTH*1-1 -: S1_11_WIDTH];
            mul_4_in_1 = R12[S3_16_WIDTH*2-1 -: S1_11_WIDTH];
            mul_5_in_1 = R12[S3_16_WIDTH*1-1 -: S1_11_WIDTH];
            mul_6_in_1 = ~R12[S3_16_WIDTH*2-1 -: S1_11_WIDTH] + 1'b1;
            mul_7_in_1 = R12[S3_16_WIDTH*1-1 -: S1_11_WIDTH];

            mul_0_in_2 = e1[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_1_in_2 = e1[S1_11_WIDTH*8-1 -: S1_11_WIDTH];
            mul_2_in_2 = e1[S1_11_WIDTH*8-1 -: S1_11_WIDTH];
            mul_3_in_2 = e1[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_4_in_2 = e1[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_5_in_2 = e1[S1_11_WIDTH*6-1 -: S1_11_WIDTH];
            mul_6_in_2 = e1[S1_11_WIDTH*6-1 -: S1_11_WIDTH];
            mul_7_in_2 = e1[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
        end

        6'd12:begin // scalar mul: R12 * e1 (z2, z3)
            mul_0_in_1 = R12[S3_16_WIDTH*2-1 -: S1_11_WIDTH];
            mul_1_in_1 = R12[S3_16_WIDTH*1-1 -: S1_11_WIDTH];
            mul_2_in_1 = ~R12[S3_16_WIDTH*2-1 -: S1_11_WIDTH] + 1'b1;
            mul_3_in_1 = R12[S3_16_WIDTH*1-1 -: S1_11_WIDTH];
            mul_4_in_1 = R12[S3_16_WIDTH*2-1 -: S1_11_WIDTH];
            mul_5_in_1 = R12[S3_16_WIDTH*1-1 -: S1_11_WIDTH];
            mul_6_in_1 = ~R12[S3_16_WIDTH*2-1 -: S1_11_WIDTH] + 1'b1;
            mul_7_in_1 = R12[S3_16_WIDTH*1-1 -: S1_11_WIDTH];

            mul_0_in_2 = e1[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_1_in_2 = e1[S1_11_WIDTH*4-1 -: S1_11_WIDTH];
            mul_2_in_2 = e1[S1_11_WIDTH*4-1 -: S1_11_WIDTH];
            mul_3_in_2 = e1[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_4_in_2 = e1[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
            mul_5_in_2 = e1[S1_11_WIDTH*2-1 -: S1_11_WIDTH];
            mul_6_in_2 = e1[S1_11_WIDTH*2-1 -: S1_11_WIDTH];
            mul_7_in_2 = e1[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
        end

        6'd13:begin // scalar mul: R13 * e1 (z0, z1)
            mul_0_in_1 = R13[S3_16_WIDTH*2-1 -: S1_11_WIDTH];
            mul_1_in_1 = R13[S3_16_WIDTH*1-1 -: S1_11_WIDTH];
            mul_2_in_1 = ~R13[S3_16_WIDTH*2-1 -: S1_11_WIDTH] + 1'b1;
            mul_3_in_1 = R13[S3_16_WIDTH*1-1 -: S1_11_WIDTH];
            mul_4_in_1 = R13[S3_16_WIDTH*2-1 -: S1_11_WIDTH];
            mul_5_in_1 = R13[S3_16_WIDTH*1-1 -: S1_11_WIDTH];
            mul_6_in_1 = ~R13[S3_16_WIDTH*2-1 -: S1_11_WIDTH] + 1'b1;
            mul_7_in_1 = R13[S3_16_WIDTH*1-1 -: S1_11_WIDTH];

            mul_0_in_2 = e1[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_1_in_2 = e1[S1_11_WIDTH*8-1 -: S1_11_WIDTH];
            mul_2_in_2 = e1[S1_11_WIDTH*8-1 -: S1_11_WIDTH];
            mul_3_in_2 = e1[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_4_in_2 = e1[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_5_in_2 = e1[S1_11_WIDTH*6-1 -: S1_11_WIDTH];
            mul_6_in_2 = e1[S1_11_WIDTH*6-1 -: S1_11_WIDTH];
            mul_7_in_2 = e1[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
        end

        6'd14:begin // scalar mul: R13 * e1 (z2, z3)
            mul_0_in_1 = R13[S3_16_WIDTH*2-1 -: S1_11_WIDTH];
            mul_1_in_1 = R13[S3_16_WIDTH*1-1 -: S1_11_WIDTH];
            mul_2_in_1 = ~R13[S3_16_WIDTH*2-1 -: S1_11_WIDTH] + 1'b1;
            mul_3_in_1 = R13[S3_16_WIDTH*1-1 -: S1_11_WIDTH];
            mul_4_in_1 = R13[S3_16_WIDTH*2-1 -: S1_11_WIDTH];
            mul_5_in_1 = R13[S3_16_WIDTH*1-1 -: S1_11_WIDTH];
            mul_6_in_1 = ~R13[S3_16_WIDTH*2-1 -: S1_11_WIDTH] + 1'b1;
            mul_7_in_1 = R13[S3_16_WIDTH*1-1 -: S1_11_WIDTH];

            mul_0_in_2 = e1[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_1_in_2 = e1[S1_11_WIDTH*4-1 -: S1_11_WIDTH];
            mul_2_in_2 = e1[S1_11_WIDTH*4-1 -: S1_11_WIDTH];
            mul_3_in_2 = e1[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_4_in_2 = e1[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
            mul_5_in_2 = e1[S1_11_WIDTH*2-1 -: S1_11_WIDTH];
            mul_6_in_2 = e1[S1_11_WIDTH*2-1 -: S1_11_WIDTH];
            mul_7_in_2 = e1[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
        end

        6'd15:begin // square (h2_i1) -> R22
            mul_0_in_1  = h2[S1_11_WIDTH*8-1 -: S1_11_WIDTH];
            mul_1_in_1  = h2[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_2_in_1  = h2[S1_11_WIDTH*6-1 -: S1_11_WIDTH];
            mul_3_in_1  = h2[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_4_in_1  = h2[S1_11_WIDTH*4-1 -: S1_11_WIDTH];
            mul_5_in_1  = h2[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_6_in_1  = h2[S1_11_WIDTH*2-1 -: S1_11_WIDTH];
            mul_7_in_1  = h2[S1_11_WIDTH*1-1 -: S1_11_WIDTH];

            mul_0_in_2  = h2[S1_11_WIDTH*8-1 -: S1_11_WIDTH];
            mul_1_in_2  = h2[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_2_in_2  = h2[S1_11_WIDTH*6-1 -: S1_11_WIDTH];
            mul_3_in_2  = h2[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_4_in_2  = h2[S1_11_WIDTH*4-1 -: S1_11_WIDTH];
            mul_5_in_2  = h2[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_6_in_2  = h2[S1_11_WIDTH*2-1 -: S1_11_WIDTH];
            mul_7_in_2  = h2[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
        end

        6'd16:begin // scalar mul: R14 * e1 (z0, z1)
            mul_0_in_1 = R14[S3_16_WIDTH*2-1 -: S1_11_WIDTH];
            mul_1_in_1 = R14[S3_16_WIDTH*1-1 -: S1_11_WIDTH];
            mul_2_in_1 = ~R14[S3_16_WIDTH*2-1 -: S1_11_WIDTH] + 1'b1;
            mul_3_in_1 = R14[S3_16_WIDTH*1-1 -: S1_11_WIDTH];
            mul_4_in_1 = R14[S3_16_WIDTH*2-1 -: S1_11_WIDTH];
            mul_5_in_1 = R14[S3_16_WIDTH*1-1 -: S1_11_WIDTH];
            mul_6_in_1 = ~R14[S3_16_WIDTH*2-1 -: S1_11_WIDTH] + 1'b1;
            mul_7_in_1 = R14[S3_16_WIDTH*1-1 -: S1_11_WIDTH];

            mul_0_in_2 = e1[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_1_in_2 = e1[S1_11_WIDTH*8-1 -: S1_11_WIDTH];
            mul_2_in_2 = e1[S1_11_WIDTH*8-1 -: S1_11_WIDTH];
            mul_3_in_2 = e1[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_4_in_2 = e1[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_5_in_2 = e1[S1_11_WIDTH*6-1 -: S1_11_WIDTH];
            mul_6_in_2 = e1[S1_11_WIDTH*6-1 -: S1_11_WIDTH];
            mul_7_in_2 = e1[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
        end

        6'd17:begin // scalar mul: R14 * e1 (z2, z3)
            mul_0_in_1 = R14[S3_16_WIDTH*2-1 -: S1_11_WIDTH];
            mul_1_in_1 = R14[S3_16_WIDTH*1-1 -: S1_11_WIDTH];
            mul_2_in_1 = ~R14[S3_16_WIDTH*2-1 -: S1_11_WIDTH] + 1'b1;
            mul_3_in_1 = R14[S3_16_WIDTH*1-1 -: S1_11_WIDTH];
            mul_4_in_1 = R14[S3_16_WIDTH*2-1 -: S1_11_WIDTH];
            mul_5_in_1 = R14[S3_16_WIDTH*1-1 -: S1_11_WIDTH];
            mul_6_in_1 = ~R14[S3_16_WIDTH*2-1 -: S1_11_WIDTH] + 1'b1;
            mul_7_in_1 = R14[S3_16_WIDTH*1-1 -: S1_11_WIDTH];

            mul_0_in_2 = e1[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_1_in_2 = e1[S1_11_WIDTH*4-1 -: S1_11_WIDTH];
            mul_2_in_2 = e1[S1_11_WIDTH*4-1 -: S1_11_WIDTH];
            mul_3_in_2 = e1[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_4_in_2 = e1[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
            mul_5_in_2 = e1[S1_11_WIDTH*2-1 -: S1_11_WIDTH];
            mul_6_in_2 = e1[S1_11_WIDTH*2-1 -: S1_11_WIDTH];
            mul_7_in_2 = e1[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
        end

        6'd18:begin // normalize (=e2)
            // mul: 
            mul_0_in_1  = h2[S1_11_WIDTH*8-1 -: S1_11_WIDTH];
            mul_1_in_1  = h2[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_2_in_1  = h2[S1_11_WIDTH*6-1 -: S1_11_WIDTH];
            mul_3_in_1  = h2[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_4_in_1  = h2[S1_11_WIDTH*4-1 -: S1_11_WIDTH];
            mul_5_in_1  = h2[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_6_in_1  = h2[S1_11_WIDTH*2-1 -: S1_11_WIDTH];
            mul_7_in_1  = h2[S1_11_WIDTH*1-1 -: S1_11_WIDTH];

            // mul: isr
            mul_0_in_2  = {1'b0, isr_u_w};
            mul_1_in_2  = {1'b0, isr_u_w};
            mul_2_in_2  = {1'b0, isr_u_w};
            mul_3_in_2  = {1'b0, isr_u_w};
            mul_4_in_2  = {1'b0, isr_u_w};
            mul_5_in_2  = {1'b0, isr_u_w};
            mul_6_in_2  = {1'b0, isr_u_w};
            mul_7_in_2  = {1'b0, isr_u_w};
        end

        6'd19:begin // h3_i1 dot e2 (im part)
            mul_0_in_1  = h3[S1_11_WIDTH*8-1 -: S1_11_WIDTH];
            mul_1_in_1  = h3[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_2_in_1  = h3[S1_11_WIDTH*6-1 -: S1_11_WIDTH];
            mul_3_in_1  = h3[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_4_in_1  = h3[S1_11_WIDTH*4-1 -: S1_11_WIDTH];
            mul_5_in_1  = h3[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_6_in_1  = h3[S1_11_WIDTH*2-1 -: S1_11_WIDTH];
            mul_7_in_1  = h3[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
            
            mul_0_in_2  =  e_w[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_1_in_2  = ~e_w[S1_11_WIDTH*8-1 -: S1_11_WIDTH] + 1'b1; // conjugate
            mul_2_in_2  =  e_w[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_3_in_2  = ~e_w[S1_11_WIDTH*6-1 -: S1_11_WIDTH] + 1'b1;
            mul_4_in_2  =  e_w[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_5_in_2  = ~e_w[S1_11_WIDTH*4-1 -: S1_11_WIDTH] + 1'b1;
            mul_6_in_2  =  e_w[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
            mul_7_in_2  = ~e_w[S1_11_WIDTH*2-1 -: S1_11_WIDTH] + 1'b1;
        end

        6'd20:begin // h3_i1 dot e2 (re part)
            mul_0_in_1 = h3[S1_11_WIDTH*8-1 -: S1_11_WIDTH];
            mul_1_in_1 = h3[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_2_in_1 = h3[S1_11_WIDTH*6-1 -: S1_11_WIDTH];
            mul_3_in_1 = h3[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_4_in_1 = h3[S1_11_WIDTH*4-1 -: S1_11_WIDTH];
            mul_5_in_1 = h3[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_6_in_1 = h3[S1_11_WIDTH*2-1 -: S1_11_WIDTH];
            mul_7_in_1 = h3[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
            
            mul_0_in_2 = e2[S1_11_WIDTH*8-1 -: S1_11_WIDTH];
            mul_1_in_2 = e2[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_2_in_2 = e2[S1_11_WIDTH*6-1 -: S1_11_WIDTH];
            mul_3_in_2 = e2[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_4_in_2 = e2[S1_11_WIDTH*4-1 -: S1_11_WIDTH];
            mul_5_in_2 = e2[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_6_in_2 = e2[S1_11_WIDTH*2-1 -: S1_11_WIDTH];
            mul_7_in_2 = e2[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
        end
     
        6'd21:begin // dot product: y_hat_1 (im part)
            mul_0_in_1  = Y[S1_11_WIDTH*8-1 -: S1_11_WIDTH];
            mul_1_in_1  = Y[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_2_in_1  = Y[S1_11_WIDTH*6-1 -: S1_11_WIDTH];
            mul_3_in_1  = Y[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_4_in_1  = Y[S1_11_WIDTH*4-1 -: S1_11_WIDTH];
            mul_5_in_1  = Y[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_6_in_1  = Y[S1_11_WIDTH*2-1 -: S1_11_WIDTH];
            mul_7_in_1  = Y[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
            
            mul_0_in_2  =  e1[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_1_in_2  = ~e1[S1_11_WIDTH*8-1 -: S1_11_WIDTH] + 1'b1; // conjugate
            mul_2_in_2  =  e1[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_3_in_2  = ~e1[S1_11_WIDTH*6-1 -: S1_11_WIDTH] + 1'b1;
            mul_4_in_2  =  e1[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_5_in_2  = ~e1[S1_11_WIDTH*4-1 -: S1_11_WIDTH] + 1'b1;
            mul_6_in_2  =  e1[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
            mul_7_in_2  = ~e1[S1_11_WIDTH*2-1 -: S1_11_WIDTH] + 1'b1;
        end

        6'd22:begin // scalar mul: R23 * e2 (z0, z1)
            mul_0_in_1 = R23[S3_16_WIDTH*2-1 -: S1_11_WIDTH];
            mul_1_in_1 = dot_product_half_w[S3_16_WIDTH-1 -: S1_11_WIDTH];
            mul_2_in_1 = ~R23[S3_16_WIDTH*2-1 -: S1_11_WIDTH] + 1'b1;
            mul_3_in_1 = dot_product_half_w[S3_16_WIDTH-1 -: S1_11_WIDTH];
            mul_4_in_1 = R23[S3_16_WIDTH*2-1 -: S1_11_WIDTH];
            mul_5_in_1 = dot_product_half_w[S3_16_WIDTH-1 -: S1_11_WIDTH];
            mul_6_in_1 = ~R23[S3_16_WIDTH*2-1 -: S1_11_WIDTH] + 1'b1;
            mul_7_in_1 = dot_product_half_w[S3_16_WIDTH-1 -: S1_11_WIDTH];

            mul_0_in_2 = e2[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_1_in_2 = e2[S1_11_WIDTH*8-1 -: S1_11_WIDTH];
            mul_2_in_2 = e2[S1_11_WIDTH*8-1 -: S1_11_WIDTH];
            mul_3_in_2 = e2[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_4_in_2 = e2[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_5_in_2 = e2[S1_11_WIDTH*6-1 -: S1_11_WIDTH];
            mul_6_in_2 = e2[S1_11_WIDTH*6-1 -: S1_11_WIDTH];
            mul_7_in_2 = e2[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
        end

        6'd23:begin // scalar mul: R23 * e2 (z2, z3)
            mul_0_in_1 = R23[S3_16_WIDTH*2-1 -: S1_11_WIDTH];
            mul_1_in_1 = R23[S3_16_WIDTH*1-1 -: S1_11_WIDTH];
            mul_2_in_1 = ~R23[S3_16_WIDTH*2-1 -: S1_11_WIDTH] + 1'b1;
            mul_3_in_1 = R23[S3_16_WIDTH*1-1 -: S1_11_WIDTH];
            mul_4_in_1 = R23[S3_16_WIDTH*2-1 -: S1_11_WIDTH];
            mul_5_in_1 = R23[S3_16_WIDTH*1-1 -: S1_11_WIDTH];
            mul_6_in_1 = ~R23[S3_16_WIDTH*2-1 -: S1_11_WIDTH] + 1'b1;
            mul_7_in_1 = R23[S3_16_WIDTH*1-1 -: S1_11_WIDTH];

            mul_0_in_2 = e2[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_1_in_2 = e2[S1_11_WIDTH*4-1 -: S1_11_WIDTH];
            mul_2_in_2 = e2[S1_11_WIDTH*4-1 -: S1_11_WIDTH];
            mul_3_in_2 = e2[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_4_in_2 = e2[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
            mul_5_in_2 = e2[S1_11_WIDTH*2-1 -: S1_11_WIDTH];
            mul_6_in_2 = e2[S1_11_WIDTH*2-1 -: S1_11_WIDTH];
            mul_7_in_2 = e2[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
        end

        6'd24:begin // h4_i1 dot e2 (im part)
            mul_0_in_1  = h4[S1_11_WIDTH*8-1 -: S1_11_WIDTH];
            mul_1_in_1  = h4[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_2_in_1  = h4[S1_11_WIDTH*6-1 -: S1_11_WIDTH];
            mul_3_in_1  = h4[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_4_in_1  = h4[S1_11_WIDTH*4-1 -: S1_11_WIDTH];
            mul_5_in_1  = h4[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_6_in_1  = h4[S1_11_WIDTH*2-1 -: S1_11_WIDTH];
            mul_7_in_1  = h4[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
            
            mul_0_in_2  =  e2[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_1_in_2  = ~e2[S1_11_WIDTH*8-1 -: S1_11_WIDTH] + 1'b1; // conjugate
            mul_2_in_2  =  e2[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_3_in_2  = ~e2[S1_11_WIDTH*6-1 -: S1_11_WIDTH] + 1'b1;
            mul_4_in_2  =  e2[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_5_in_2  = ~e2[S1_11_WIDTH*4-1 -: S1_11_WIDTH] + 1'b1;
            mul_6_in_2  =  e2[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
            mul_7_in_2  = ~e2[S1_11_WIDTH*2-1 -: S1_11_WIDTH] + 1'b1;
        end

        6'd25:begin // h4_i1 dot e2 (re part)
            mul_0_in_1 = h4[S1_11_WIDTH*8-1 -: S1_11_WIDTH];
            mul_1_in_1 = h4[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_2_in_1 = h4[S1_11_WIDTH*6-1 -: S1_11_WIDTH];
            mul_3_in_1 = h4[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_4_in_1 = h4[S1_11_WIDTH*4-1 -: S1_11_WIDTH];
            mul_5_in_1 = h4[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_6_in_1 = h4[S1_11_WIDTH*2-1 -: S1_11_WIDTH];
            mul_7_in_1 = h4[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
            
            mul_0_in_2 = e2[S1_11_WIDTH*8-1 -: S1_11_WIDTH];
            mul_1_in_2 = e2[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_2_in_2 = e2[S1_11_WIDTH*6-1 -: S1_11_WIDTH];
            mul_3_in_2 = e2[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_4_in_2 = e2[S1_11_WIDTH*4-1 -: S1_11_WIDTH];
            mul_5_in_2 = e2[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_6_in_2 = e2[S1_11_WIDTH*2-1 -: S1_11_WIDTH];
            mul_7_in_2 = e2[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
        end

        6'd26:begin // square h3_i2 -> R33 
            mul_0_in_1  = h3[S1_11_WIDTH*8-1 -: S1_11_WIDTH];
            mul_1_in_1  = h3[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_2_in_1  = h3[S1_11_WIDTH*6-1 -: S1_11_WIDTH];
            mul_3_in_1  = h3[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_4_in_1  = h3[S1_11_WIDTH*4-1 -: S1_11_WIDTH];
            mul_5_in_1  = h3[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_6_in_1  = h3[S1_11_WIDTH*2-1 -: S1_11_WIDTH];
            mul_7_in_1  = h3[S1_11_WIDTH*1-1 -: S1_11_WIDTH];

            // square sum 
            mul_0_in_2  = h3[S1_11_WIDTH*8-1 -: S1_11_WIDTH];
            mul_1_in_2  = h3[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_2_in_2  = h3[S1_11_WIDTH*6-1 -: S1_11_WIDTH];
            mul_3_in_2  = h3[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_4_in_2  = h3[S1_11_WIDTH*4-1 -: S1_11_WIDTH];
            mul_5_in_2  = h3[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_6_in_2  = h3[S1_11_WIDTH*2-1 -: S1_11_WIDTH];
            mul_7_in_2  = h3[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
        end

        6'd27:begin // scalar mul: R24 * e2 (z0, z1)
            mul_0_in_1 = R24[S3_16_WIDTH*2-1 -: S1_11_WIDTH];
            mul_1_in_1 = dot_product_half_w[S3_16_WIDTH-1 -: S1_11_WIDTH];
            mul_2_in_1 = ~R24[S3_16_WIDTH*2-1 -: S1_11_WIDTH];
            mul_3_in_1 = dot_product_half_w[S3_16_WIDTH-1 -: S1_11_WIDTH];
            mul_4_in_1 = R24[S3_16_WIDTH*2-1 -: S1_11_WIDTH];
            mul_5_in_1 = dot_product_half_w[S3_16_WIDTH-1 -: S1_11_WIDTH];
            mul_6_in_1 = ~R24[S3_16_WIDTH*2-1 -: S1_11_WIDTH];
            mul_7_in_1 = dot_product_half_w[S3_16_WIDTH-1 -: S1_11_WIDTH];

            mul_0_in_2 = e2[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_1_in_2 = e2[S1_11_WIDTH*8-1 -: S1_11_WIDTH];
            mul_2_in_2 = e2[S1_11_WIDTH*8-1 -: S1_11_WIDTH];
            mul_3_in_2 = e2[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_4_in_2 = e2[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_5_in_2 = e2[S1_11_WIDTH*6-1 -: S1_11_WIDTH];
            mul_6_in_2 = e2[S1_11_WIDTH*6-1 -: S1_11_WIDTH];
            mul_7_in_2 = e2[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
        end

        6'd28:begin // scalar mul: R24 * e2 (z2, z3)
            mul_0_in_1 = R24[S3_16_WIDTH*2-1 -: S1_11_WIDTH];
            mul_1_in_1 = R24[S3_16_WIDTH*1-1 -: S1_11_WIDTH];
            mul_2_in_1 = ~R24[S3_16_WIDTH*2-1 -: S1_11_WIDTH] + 1'b1;
            mul_3_in_1 = R24[S3_16_WIDTH*1-1 -: S1_11_WIDTH];
            mul_4_in_1 = R24[S3_16_WIDTH*2-1 -: S1_11_WIDTH];
            mul_5_in_1 = R24[S3_16_WIDTH*1-1 -: S1_11_WIDTH];
            mul_6_in_1 = ~R24[S3_16_WIDTH*2-1 -: S1_11_WIDTH] + 1'b1;
            mul_7_in_1 = R24[S3_16_WIDTH*1-1 -: S1_11_WIDTH];

            mul_0_in_2 = e2[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_1_in_2 = e2[S1_11_WIDTH*4-1 -: S1_11_WIDTH];
            mul_2_in_2 = e2[S1_11_WIDTH*4-1 -: S1_11_WIDTH];
            mul_3_in_2 = e2[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_4_in_2 = e2[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
            mul_5_in_2 = e2[S1_11_WIDTH*2-1 -: S1_11_WIDTH];
            mul_6_in_2 = e2[S1_11_WIDTH*2-1 -: S1_11_WIDTH];
            mul_7_in_2 = e2[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
        end

        6'd29:begin // normalize(=e3) 
            // mul 
            mul_0_in_1  = h3[S1_11_WIDTH*8-1 -: S1_11_WIDTH];
            mul_1_in_1  = h3[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_2_in_1  = h3[S1_11_WIDTH*6-1 -: S1_11_WIDTH];
            mul_3_in_1  = h3[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_4_in_1  = h3[S1_11_WIDTH*4-1 -: S1_11_WIDTH];
            mul_5_in_1  = h3[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_6_in_1  = h3[S1_11_WIDTH*2-1 -: S1_11_WIDTH];
            mul_7_in_1  = h3[S1_11_WIDTH*1-1 -: S1_11_WIDTH];

            // mul: isr
            mul_0_in_2  = {1'b0, isr_u_w};
            mul_1_in_2  = {1'b0, isr_u_w};
            mul_2_in_2  = {1'b0, isr_u_w};
            mul_3_in_2  = {1'b0, isr_u_w};
            mul_4_in_2  = {1'b0, isr_u_w};
            mul_5_in_2  = {1'b0, isr_u_w};
            mul_6_in_2  = {1'b0, isr_u_w};
            mul_7_in_2  = {1'b0, isr_u_w};
        end

        6'd30:begin // h4_i2 dot e3 = R34 (im part)
            mul_0_in_1  = h4[S1_11_WIDTH*8-1 -: S1_11_WIDTH];
            mul_1_in_1  = h4[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_2_in_1  = h4[S1_11_WIDTH*6-1 -: S1_11_WIDTH];
            mul_3_in_1  = h4[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_4_in_1  = vec_diff_half_w[S1_11_WIDTH*4-1 -: S1_11_WIDTH];
            mul_5_in_1  = vec_diff_half_w[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_6_in_1  = vec_diff_half_w[S1_11_WIDTH*2-1 -: S1_11_WIDTH];
            mul_7_in_1  = vec_diff_half_w[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
            
            mul_0_in_2  =  e_w[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_1_in_2  = ~e_w[S1_11_WIDTH*8-1 -: S1_11_WIDTH] + 1'b1; // conjugate
            mul_2_in_2  =  e_w[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_3_in_2  = ~e_w[S1_11_WIDTH*6-1 -: S1_11_WIDTH] + 1'b1;
            mul_4_in_2  =  e_w[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_5_in_2  = ~e_w[S1_11_WIDTH*4-1 -: S1_11_WIDTH] + 1'b1;
            mul_6_in_2  =  e_w[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
            mul_7_in_2  = ~e_w[S1_11_WIDTH*2-1 -: S1_11_WIDTH] + 1'b1;
        end

        6'd31:begin // h4_i2 dot e3 = R34 (re part)
            mul_0_in_1 = h4[S1_11_WIDTH*8-1 -: S1_11_WIDTH];
            mul_1_in_1 = h4[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_2_in_1 = h4[S1_11_WIDTH*6-1 -: S1_11_WIDTH];
            mul_3_in_1 = h4[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_4_in_1 = h4[S1_11_WIDTH*4-1 -: S1_11_WIDTH];
            mul_5_in_1 = h4[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_6_in_1 = h4[S1_11_WIDTH*2-1 -: S1_11_WIDTH];
            mul_7_in_1 = h4[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
            
            mul_0_in_2 = e3_e4[S1_11_WIDTH*8-1 -: S1_11_WIDTH];
            mul_1_in_2 = e3_e4[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_2_in_2 = e3_e4[S1_11_WIDTH*6-1 -: S1_11_WIDTH];
            mul_3_in_2 = e3_e4[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_4_in_2 = e3_e4[S1_11_WIDTH*4-1 -: S1_11_WIDTH];
            mul_5_in_2 = e3_e4[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_6_in_2 = e3_e4[S1_11_WIDTH*2-1 -: S1_11_WIDTH];
            mul_7_in_2 = e3_e4[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
        end

        6'd32: begin // dot product: y_hat_1 (re part)
            mul_0_in_1 = Y[S1_11_WIDTH*8-1 -: S1_11_WIDTH];
            mul_1_in_1 = Y[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_2_in_1 = Y[S1_11_WIDTH*6-1 -: S1_11_WIDTH];
            mul_3_in_1 = Y[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_4_in_1 = Y[S1_11_WIDTH*4-1 -: S1_11_WIDTH];
            mul_5_in_1 = Y[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_6_in_1 = Y[S1_11_WIDTH*2-1 -: S1_11_WIDTH];
            mul_7_in_1 = Y[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
            
            mul_0_in_2 = e1[S1_11_WIDTH*8-1 -: S1_11_WIDTH];
            mul_1_in_2 = e1[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_2_in_2 = e1[S1_11_WIDTH*6-1 -: S1_11_WIDTH];
            mul_3_in_2 = e1[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_4_in_2 = e1[S1_11_WIDTH*4-1 -: S1_11_WIDTH];
            mul_5_in_2 = e1[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_6_in_2 = e1[S1_11_WIDTH*2-1 -: S1_11_WIDTH];
            mul_7_in_2 = e1[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
        end

        6'd33:begin // scalar mul : R34 * e3 (z0, z1)
            mul_0_in_1 = R34[S3_16_WIDTH*2-1 -: S1_11_WIDTH];
            mul_1_in_1 = dot_product_half_w[S3_16_WIDTH-1 -: S1_11_WIDTH];
            mul_2_in_1 = ~R34[S3_16_WIDTH*2-1 -: S1_11_WIDTH] + 1'b1;
            mul_3_in_1 = dot_product_half_w[S3_16_WIDTH-1 -: S1_11_WIDTH];
            mul_4_in_1 = R34[S3_16_WIDTH*2-1 -: S1_11_WIDTH];
            mul_5_in_1 = dot_product_half_w[S3_16_WIDTH-1 -: S1_11_WIDTH];
            mul_6_in_1 = ~R34[S3_16_WIDTH*2-1 -: S1_11_WIDTH] + 1'b1;
            mul_7_in_1 = dot_product_half_w[S3_16_WIDTH-1 -: S1_11_WIDTH];

            mul_0_in_2 = e3_e4[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_1_in_2 = e3_e4[S1_11_WIDTH*8-1 -: S1_11_WIDTH];
            mul_2_in_2 = e3_e4[S1_11_WIDTH*8-1 -: S1_11_WIDTH];
            mul_3_in_2 = e3_e4[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_4_in_2 = e3_e4[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_5_in_2 = e3_e4[S1_11_WIDTH*6-1 -: S1_11_WIDTH];
            mul_6_in_2 = e3_e4[S1_11_WIDTH*6-1 -: S1_11_WIDTH];
            mul_7_in_2 = e3_e4[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
        end

        6'd34:begin // scalar mul : R34 * e3 (z2, z3)
            mul_0_in_1 = R34[S3_16_WIDTH*2-1 -: S1_11_WIDTH];
            mul_1_in_1 = R34[S3_16_WIDTH*1-1 -: S1_11_WIDTH];
            mul_2_in_1 = ~R34[S3_16_WIDTH*2-1 -: S1_11_WIDTH] + 1'b1;
            mul_3_in_1 = R34[S3_16_WIDTH*1-1 -: S1_11_WIDTH];
            mul_4_in_1 = R34[S3_16_WIDTH*2-1 -: S1_11_WIDTH];
            mul_5_in_1 = R34[S3_16_WIDTH*1-1 -: S1_11_WIDTH];
            mul_6_in_1 = ~R34[S3_16_WIDTH*2-1 -: S1_11_WIDTH] + 1'b1;
            mul_7_in_1 = R34[S3_16_WIDTH*1-1 -: S1_11_WIDTH];

            mul_0_in_2 = e3_e4[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_1_in_2 = e3_e4[S1_11_WIDTH*4-1 -: S1_11_WIDTH];
            mul_2_in_2 = e3_e4[S1_11_WIDTH*4-1 -: S1_11_WIDTH];
            mul_3_in_2 = e3_e4[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_4_in_2 = e3_e4[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
            mul_5_in_2 = e3_e4[S1_11_WIDTH*2-1 -: S1_11_WIDTH];
            mul_6_in_2 = e3_e4[S1_11_WIDTH*2-1 -: S1_11_WIDTH];
            mul_7_in_2 = e3_e4[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
        end

        6'd35:begin // dot product : y_hat_2 (im part)
            mul_0_in_1  = Y[S1_11_WIDTH*8-1 -: S1_11_WIDTH];
            mul_1_in_1  = Y[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_2_in_1  = Y[S1_11_WIDTH*6-1 -: S1_11_WIDTH];
            mul_3_in_1  = Y[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_4_in_1  = Y[S1_11_WIDTH*4-1 -: S1_11_WIDTH];
            mul_5_in_1  = Y[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_6_in_1  = Y[S1_11_WIDTH*2-1 -: S1_11_WIDTH];
            mul_7_in_1  = Y[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
            
            mul_0_in_2  =  e2[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_1_in_2  = ~e2[S1_11_WIDTH*8-1 -: S1_11_WIDTH] + 1'b1; // conjugate
            mul_2_in_2  =  e2[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_3_in_2  = ~e2[S1_11_WIDTH*6-1 -: S1_11_WIDTH] + 1'b1;
            mul_4_in_2  =  e2[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_5_in_2  = ~e2[S1_11_WIDTH*4-1 -: S1_11_WIDTH] + 1'b1;
            mul_6_in_2  =  e2[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
            mul_7_in_2  = ~e2[S1_11_WIDTH*2-1 -: S1_11_WIDTH] + 1'b1;
        end

        6'd36:begin // square (h4_i3) -> R44
            mul_0_in_1  = h4[S1_11_WIDTH*8-1 -: S1_11_WIDTH];
            mul_1_in_1  = h4[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_2_in_1  = h4[S1_11_WIDTH*6-1 -: S1_11_WIDTH];
            mul_3_in_1  = h4[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_4_in_1  = vec_diff_half_w[S1_11_WIDTH*4-1 -: S1_11_WIDTH];
            mul_5_in_1  = vec_diff_half_w[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_6_in_1  = vec_diff_half_w[S1_11_WIDTH*2-1 -: S1_11_WIDTH];
            mul_7_in_1  = vec_diff_half_w[S1_11_WIDTH*1-1 -: S1_11_WIDTH];

            mul_0_in_2  = h4[S1_11_WIDTH*8-1 -: S1_11_WIDTH];
            mul_1_in_2  = h4[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_2_in_2  = h4[S1_11_WIDTH*6-1 -: S1_11_WIDTH];
            mul_3_in_2  = h4[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_4_in_2  = vec_diff_half_w[S1_11_WIDTH*4-1 -: S1_11_WIDTH];
            mul_5_in_2  = vec_diff_half_w[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_6_in_2  = vec_diff_half_w[S1_11_WIDTH*2-1 -: S1_11_WIDTH];
            mul_7_in_2  = vec_diff_half_w[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
        end

        6'd37:begin  // dot product : y_hat_2 (re part)
            mul_0_in_1 = Y[S1_11_WIDTH*8-1 -: S1_11_WIDTH];
            mul_1_in_1 = Y[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_2_in_1 = Y[S1_11_WIDTH*6-1 -: S1_11_WIDTH];
            mul_3_in_1 = Y[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_4_in_1 = Y[S1_11_WIDTH*4-1 -: S1_11_WIDTH];
            mul_5_in_1 = Y[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_6_in_1 = Y[S1_11_WIDTH*2-1 -: S1_11_WIDTH];
            mul_7_in_1 = Y[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
            
            mul_0_in_2 = e2[S1_11_WIDTH*8-1 -: S1_11_WIDTH];
            mul_1_in_2 = e2[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_2_in_2 = e2[S1_11_WIDTH*6-1 -: S1_11_WIDTH];
            mul_3_in_2 = e2[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_4_in_2 = e2[S1_11_WIDTH*4-1 -: S1_11_WIDTH];
            mul_5_in_2 = e2[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_6_in_2 = e2[S1_11_WIDTH*2-1 -: S1_11_WIDTH];
            mul_7_in_2 = e2[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
        end

        6'd38:begin // dot product: y_hat_3 (im part)
            mul_0_in_1  = Y[S1_11_WIDTH*8-1 -: S1_11_WIDTH];
            mul_1_in_1  = Y[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_2_in_1  = Y[S1_11_WIDTH*6-1 -: S1_11_WIDTH];
            mul_3_in_1  = Y[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_4_in_1  = Y[S1_11_WIDTH*4-1 -: S1_11_WIDTH];
            mul_5_in_1  = Y[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_6_in_1  = Y[S1_11_WIDTH*2-1 -: S1_11_WIDTH];
            mul_7_in_1  = Y[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
            
            mul_0_in_2  =  e3_e4[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_1_in_2  = ~e3_e4[S1_11_WIDTH*8-1 -: S1_11_WIDTH] + 1'b1; // conjugate
            mul_2_in_2  =  e3_e4[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_3_in_2  = ~e3_e4[S1_11_WIDTH*6-1 -: S1_11_WIDTH] + 1'b1;
            mul_4_in_2  =  e3_e4[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_5_in_2  = ~e3_e4[S1_11_WIDTH*4-1 -: S1_11_WIDTH] + 1'b1;
            mul_6_in_2  =  e3_e4[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
            mul_7_in_2  = ~e3_e4[S1_11_WIDTH*2-1 -: S1_11_WIDTH] + 1'b1;
        end

        6'd39: begin // dot product: y_hat_3 (re part)
            mul_0_in_1 = Y[S1_11_WIDTH*8-1 -: S1_11_WIDTH];
            mul_1_in_1 = Y[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_2_in_1 = Y[S1_11_WIDTH*6-1 -: S1_11_WIDTH];
            mul_3_in_1 = Y[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_4_in_1 = Y[S1_11_WIDTH*4-1 -: S1_11_WIDTH];
            mul_5_in_1 = Y[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_6_in_1 = Y[S1_11_WIDTH*2-1 -: S1_11_WIDTH];
            mul_7_in_1 = Y[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
            
            mul_0_in_2 = e3_e4[S1_11_WIDTH*8-1 -: S1_11_WIDTH];
            mul_1_in_2 = e3_e4[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_2_in_2 = e3_e4[S1_11_WIDTH*6-1 -: S1_11_WIDTH];
            mul_3_in_2 = e3_e4[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_4_in_2 = e3_e4[S1_11_WIDTH*4-1 -: S1_11_WIDTH];
            mul_5_in_2 = e3_e4[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_6_in_2 = e3_e4[S1_11_WIDTH*2-1 -: S1_11_WIDTH];
            mul_7_in_2 = e3_e4[S1_11_WIDTH*1-1 -: S1_11_WIDTH];
        end

        6'd40:begin // normalize (=e4)
           // mul: 
            mul_0_in_1  = h4[S1_11_WIDTH*8-1 -: S1_11_WIDTH];
            mul_1_in_1  = h4[S1_11_WIDTH*7-1 -: S1_11_WIDTH];
            mul_2_in_1  = h4[S1_11_WIDTH*6-1 -: S1_11_WIDTH];
            mul_3_in_1  = h4[S1_11_WIDTH*5-1 -: S1_11_WIDTH];
            mul_4_in_1  = h4[S1_11_WIDTH*4-1 -: S1_11_WIDTH];
            mul_5_in_1  = h4[S1_11_WIDTH*3-1 -: S1_11_WIDTH];
            mul_6_in_1  = h4[S1_11_WIDTH*2-1 -: S1_11_WIDTH];
            mul_7_in_1  = h4[S1_11_WIDTH*1-1 -: S1_11_WIDTH];

            // mul: isr
            mul_0_in_2  = {1'b0, isr_u_w};
            mul_1_in_2  = {1'b0, isr_u_w};
            mul_2_in_2  = {1'b0, isr_u_w};
            mul_3_in_2  = {1'b0, isr_u_w};
            mul_4_in_2  = {1'b0, isr_u_w};
            mul_5_in_2  = {1'b0, isr_u_w};
            mul_6_in_2  = {1'b0, isr_u_w};
            mul_7_in_2  = {1'b0, isr_u_w};
        end

        
    endcase
end

// ---------------------------------------------------------------------------
// Continuous Assignment
// ---------------------------------------------------------------------------
assign o_y_hat     = {y_hat_4_r, y_hat_3_r, y_hat_2_r, y_hat_1_r};
assign o_r         = {R44, R34, R24, R14, R33, R23, R13, R22, R12, R11};

// mul_out_r_s316
    wire signed [S3_16_WIDTH-1 : 0] mul_0_out_r_s316 = mul_0_out_r;
    wire signed [S3_16_WIDTH-1 : 0] mul_1_out_r_s316 = mul_1_out_r; 
    wire signed [S3_16_WIDTH-1 : 0] mul_2_out_r_s316 = mul_2_out_r; 
    wire signed [S3_16_WIDTH-1 : 0] mul_3_out_r_s316 = mul_3_out_r; 

    wire signed [S3_16_WIDTH-1 : 0] mul_4_out_r_s316 = mul_4_out_r; 
    wire signed [S3_16_WIDTH-1 : 0] mul_5_out_r_s316 = mul_5_out_r; 
    wire signed [S3_16_WIDTH-1 : 0] mul_6_out_r_s316 = mul_6_out_r; 
    wire signed [S3_16_WIDTH-1 : 0] mul_7_out_r_s316 = mul_7_out_r; 

wire signed [S3_16_WIDTH : 0] sum_0 = (mul_0_out_r + mul_1_out_r); // z0_im_s316, mul_out = S5.14 + S5.14
wire signed [S3_16_WIDTH : 0] sum_1 = (mul_2_out_r + mul_3_out_r); // z0_re_s316
wire signed [S3_16_WIDTH : 0] sum_2 = (mul_4_out_r + mul_5_out_r); // z1_im_s316
wire signed [S3_16_WIDTH : 0] sum_3 = (mul_6_out_r + mul_7_out_r); // z1_re_s316

wire signed [S6_16_WIDTH-1 : 0] sum_4 = (sum_0 + sum_1) + (sum_2 + sum_3);

// dot product
assign dot_product_half_w = sum_4[S6_16_WIDTH-1 -3 : 0];

// square sum
assign square_sum_u_w = sum_4[S6_16_WIDTH-1 -1 -: SQUARE_SUM_U_WIDTH];


// scalar mul
wire [S1_11_WIDTH-1 : 0] z0_im = sum_0[S3_16_WIDTH -5 -: S1_11_WIDTH];  
wire [S1_11_WIDTH-1 : 0] z0_re = sum_1[S3_16_WIDTH -5 -: S1_11_WIDTH]; 
wire [S1_11_WIDTH-1 : 0] z1_im = sum_2[S3_16_WIDTH -5 -: S1_11_WIDTH]; 
wire [S1_11_WIDTH-1 : 0] z1_re = sum_3[S3_16_WIDTH -5 -: S1_11_WIDTH]; 

assign scalar_mul_half_w = {z0_im, z0_re, z1_im, z1_re};


// mul_out_r_shifted, for calculate e
    wire signed [PRODCUT_WIDTH-1 : 0] mul_0_out_shifted = (shift_dir_r == RIGHT) ? mul_0_out >>> shift_amt_r : mul_0_out <<< shift_amt_r;
    wire signed [PRODCUT_WIDTH-1 : 0] mul_1_out_shifted = (shift_dir_r == RIGHT) ? mul_1_out >>> shift_amt_r : mul_1_out <<< shift_amt_r; 
    wire signed [PRODCUT_WIDTH-1 : 0] mul_2_out_shifted = (shift_dir_r == RIGHT) ? mul_2_out >>> shift_amt_r : mul_2_out <<< shift_amt_r; 
    wire signed [PRODCUT_WIDTH-1 : 0] mul_3_out_shifted = (shift_dir_r == RIGHT) ? mul_3_out >>> shift_amt_r : mul_3_out <<< shift_amt_r; 
    wire signed [PRODCUT_WIDTH-1 : 0] mul_4_out_shifted = (shift_dir_r == RIGHT) ? mul_4_out >>> shift_amt_r : mul_4_out <<< shift_amt_r; 
    wire signed [PRODCUT_WIDTH-1 : 0] mul_5_out_shifted = (shift_dir_r == RIGHT) ? mul_5_out >>> shift_amt_r : mul_5_out <<< shift_amt_r; 
    wire signed [PRODCUT_WIDTH-1 : 0] mul_6_out_shifted = (shift_dir_r == RIGHT) ? mul_6_out >>> shift_amt_r : mul_6_out <<< shift_amt_r; 
    wire signed [PRODCUT_WIDTH-1 : 0] mul_7_out_shifted = (shift_dir_r == RIGHT) ? mul_7_out >>> shift_amt_r : mul_7_out <<< shift_amt_r; 

    wire signed [S1_11_WIDTH-1 : 0] e_x0_im = mul_0_out_shifted[PRODCUT_WIDTH-1 -2 -: S1_11_WIDTH]; 
    wire signed [S1_11_WIDTH-1 : 0] e_x0_re = mul_1_out_shifted[PRODCUT_WIDTH-1 -2 -: S1_11_WIDTH]; 
    wire signed [S1_11_WIDTH-1 : 0] e_x1_im = mul_2_out_shifted[PRODCUT_WIDTH-1 -2 -: S1_11_WIDTH]; 
    wire signed [S1_11_WIDTH-1 : 0] e_x1_re = mul_3_out_shifted[PRODCUT_WIDTH-1 -2 -: S1_11_WIDTH]; 
    wire signed [S1_11_WIDTH-1 : 0] e_x2_im = mul_4_out_shifted[PRODCUT_WIDTH-1 -2 -: S1_11_WIDTH]; 
    wire signed [S1_11_WIDTH-1 : 0] e_x2_re = mul_5_out_shifted[PRODCUT_WIDTH-1 -2 -: S1_11_WIDTH]; 
    wire signed [S1_11_WIDTH-1 : 0] e_x3_im = mul_6_out_shifted[PRODCUT_WIDTH-1 -2 -: S1_11_WIDTH]; 
    wire signed [S1_11_WIDTH-1 : 0] e_x3_re = mul_7_out_shifted[PRODCUT_WIDTH-1 -2 -: S1_11_WIDTH]; 

    assign e_w  = {e_x0_im, e_x0_re, e_x1_im, e_x1_re, e_x2_im, e_x2_re, e_x3_im, e_x3_re};
    
// shifted, for calculate vector length
    // R11 ~ R44
    wire [(SQUARE_SUM_WIDTH-1)+(S1_11_WIDTH-1)-1 : 0] mul_16_out_r_shifted = (shift_dir_r == RIGHT) ? mul_16_out >> shift_amt_r : mul_16_out << shift_amt_r; 

    // R11
    wire signed [S3_16_WIDTH-1 : 0] vec_len = {1'b0, mul_16_out_r_shifted[(SQUARE_SUM_WIDTH-1)+(S1_11_WIDTH-1)-1 -4 -: (S3_16_WIDTH-1)]}; 

// ---------------------------------------------------------------------------
// Combinational Blocks
// ---------------------------------------------------------------------------

// ---------------------------------------------------------------------------
// Control reg
// ---------------------------------------------------------------------------
    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            latency_r <= 6'd0;
        end
        else if(i_one_RE_finish)begin
            latency_r <= 6'd0;
        end
        else if(i_trig & i_data_buf_cnt == 14 & latency_r == 0)begin
            latency_r <= 6'd1;
        end
        else if(latency_r == 6'd41)begin
            latency_r <= 6'd2;
        end
        else if(latency_r != 0)begin
            latency_r <= latency_r + 6'd1;
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            core_start <= 1'd0;
        end
        else if(i_trig & core_start == 0)begin
            core_start <= 6'd1;
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            first_round <= 1'b1;
        end
        else if(i_one_RE_finish & ~first_round)begin
            first_round <= 1'b1;
        end
        else if(latency_r == 6'd41 & first_round)begin
            first_round <= 1'b0;
        end
    end

// ---------------------------------------------------------------------------
// Pipeline reg
// ---------------------------------------------------------------------------
    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            R11 <= 0;
        end
        else if(latency_r == 6)begin // R11: S3.16 
            R11 <= vec_len;
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            e1 <= 0;
        end
        else if(latency_r == 5)begin
            e1 <= e_w;
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            R12 <= 0;
        end
        else if(latency_r == 7)begin // R12: S3.16 * 2
            R12[S3_16_WIDTH +: S3_16_WIDTH] <= dot_product_half_w;
        end
        else if(latency_r == 8)begin // R12: S3.16 * 2
            R12[0 +: S3_16_WIDTH] <= dot_product_half_w;
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            R13 <= 0;
        end
        else if(latency_r == 9)begin // R13: S3.16 * 2
            R13[S3_16_WIDTH +: S3_16_WIDTH] <= dot_product_half_w;
        end
        else if(latency_r == 10)begin // R13: S3.16 * 2
            R13[0 +: S3_16_WIDTH] <= dot_product_half_w;
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            R14 <= 0;
        end
        else if(latency_r == 11)begin // R14: S3.16 * 2
            R14[S3_16_WIDTH +: S3_16_WIDTH] <= dot_product_half_w;
        end
        else if(latency_r == 12)begin // R14: S3.16 * 2
            R14[0 +: S3_16_WIDTH] <= dot_product_half_w;
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            h2 <= 0;
        end
        else if(latency_r == 13)begin // h2_i1
            h2[S1_11_WIDTH*4 +: S1_11_WIDTH*4] <= vec_diff_half_w;
        end
        else if(latency_r == 14)begin // h2_i1
            h2[0 +: S1_11_WIDTH*4] <= vec_diff_half_w;
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            h3 <= 0;
        end
        else if(latency_r == 15)begin // h3_i1
            h3[S1_11_WIDTH*4 +: S1_11_WIDTH*4] <= vec_diff_half_w;
        end
        else if(latency_r == 16)begin // h3_i1
            h3[0 +: S1_11_WIDTH*4] <= vec_diff_half_w;
        end
        else if(latency_r == 24)begin // h3_i2
            h3[S1_11_WIDTH*4 +: S1_11_WIDTH*4] <= vec_diff_half_w;
        end
        else if(latency_r == 25)begin // h3_i2
            h3[0 +: S1_11_WIDTH*4] <= vec_diff_half_w;
        end

    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            h4 <= 0;
        end
        else if(latency_r == 18)begin // h4_i1
            h4[S1_11_WIDTH*4 +: S1_11_WIDTH*4] <= vec_diff_half_w;
        end
        else if(latency_r == 19)begin // h4_i1
            h4[0 +: S1_11_WIDTH*4] <= vec_diff_half_w;
        end
        else if(latency_r == 29)begin // h4_i2
            h4[S1_11_WIDTH*4 +: S1_11_WIDTH*4] <= vec_diff_half_w;
        end
        else if(latency_r == 30)begin // h4_i2
            h4[0 +: S1_11_WIDTH*4] <= vec_diff_half_w;
        end
        else if(latency_r == 35)begin // h4_i3
            h4[S1_11_WIDTH*4 +: S1_11_WIDTH*4] <= vec_diff_half_w;
        end
        else if(latency_r == 36)begin // h4_i3
            h4[0 +: S1_11_WIDTH*4] <= vec_diff_half_w;
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            e2 <= 0;
        end
        else if(latency_r == 19)begin
            e2 <= e_w;
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            R22 <= 0;
        end
        else if(latency_r == 20)begin
            R22 <= vec_len;
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            R23 <= 0;
        end
        else if(latency_r == 21)begin
            R23[S3_16_WIDTH +: S3_16_WIDTH] <= dot_product_half_w;
        end
        else if(latency_r == 22)begin
            R23[0 +: S3_16_WIDTH] <= dot_product_half_w;
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            R24 <= 0;
        end
        else if(latency_r == 26)begin
            R24[S3_16_WIDTH +: S3_16_WIDTH] <= dot_product_half_w;
        end
        else if(latency_r == 27)begin
            R24[0 +: S3_16_WIDTH] <= dot_product_half_w;
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            e3_e4 <= 0;
        end
        else if(latency_r == 30)begin // e3
            e3_e4 <= e_w;
        end
        else if(latency_r == 41)begin // e4
            e3_e4 <= e_w;
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            R33 <= 0;
        end
        else if(latency_r == 31)begin
            R33 <= vec_len;
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            R34 <= 0;
        end
        else if(latency_r == 32)begin
            R34[S3_16_WIDTH +: S3_16_WIDTH] <= dot_product_half_w;
        end
        else if(latency_r == 33)begin
            R34[0 +: S3_16_WIDTH] <= dot_product_half_w;
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            R44 <= 0;
        end
        else if(latency_r == 2)begin
            R44 <= vec_len;
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            y_hat_1_r <= 0;
        end
        else if(latency_r == 23)begin
            y_hat_1_r[S3_16_WIDTH +: S3_16_WIDTH] <= dot_product_half_w;
        end
        else if(latency_r == 34)begin
            y_hat_1_r[0 +: S3_16_WIDTH] <= dot_product_half_w;
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            y_hat_2_r <= 0;
        end
        else if(latency_r == 37)begin
            y_hat_2_r[S3_16_WIDTH +: S3_16_WIDTH] <= dot_product_half_w;
        end
        else if(latency_r == 39)begin
            y_hat_2_r[0 +: S3_16_WIDTH] <= dot_product_half_w;
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            y_hat_3_r <= 0;
        end
        else if(latency_r == 40)begin
            y_hat_3_r[S3_16_WIDTH +: S3_16_WIDTH] <= dot_product_half_w;
        end
        else if(latency_r == 41)begin
            y_hat_3_r[0 +: S3_16_WIDTH] <= dot_product_half_w;
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            y_hat_4_r <= 0;
        end
        else if(latency_r == 4 & ~first_round)begin
            y_hat_4_r[S3_16_WIDTH +: S3_16_WIDTH] <= dot_product_half_w;
        end
        else if(latency_r == 5 & ~first_round)begin
            y_hat_4_r[0 +: S3_16_WIDTH] <= dot_product_half_w;
        end
    end

    // isr reg
        always @(posedge i_clk, posedge i_rst) begin
            if(i_rst)begin
                isr_u_r     <= 0;
            end
            else if(
                latency_r == 4  |
                latency_r == 18 | 
                latency_r == 29 |
                latency_r == 39
            )begin
                isr_u_r     <= isr_u_w;
            end
        end

        always @(posedge i_clk, posedge i_rst) begin
            if(i_rst)begin
                shift_amt_r <= 0;
            end
            else if(
                latency_r == 4  |
                latency_r == 18 | 
                latency_r == 29 |
                latency_r == 39
            )begin
                shift_amt_r <= shift_amt_w;
            end
        end

        always @(posedge i_clk, posedge i_rst) begin
            if(i_rst)begin
                shift_dir_r <= 0;
            end
            else if(
                latency_r == 4 |
                latency_r == 18 | 
                latency_r == 29 |
                latency_r == 39
            )begin
                shift_dir_r <= shift_dir_w;
            end
        end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            square_sum_u_r  <= 0;
        end
        else if(
            latency_r == 3  |
            latency_r == 17 |
            latency_r == 28 |
            latency_r == 38
        )begin
            square_sum_u_r  <= square_sum_u_w;
        end
    end

    // mul_in_1_r, mul_in_2_r 
        always @(posedge i_clk, posedge i_rst) begin
            if(i_rst)begin
                mul_0_in_1_r <= 0;
            end
            else if(core_start)begin
                mul_0_in_1_r <= mul_0_in_1;
            end
        end
        always @(posedge i_clk, posedge i_rst) begin
            if(i_rst)begin
                mul_1_in_1_r <= 0;
            end
            else if(core_start)begin
                mul_1_in_1_r <= mul_1_in_1;
            end
        end
        always @(posedge i_clk, posedge i_rst) begin
            if(i_rst)begin
                mul_2_in_1_r <= 0;
            end
            else if(core_start)begin
                mul_2_in_1_r <= mul_2_in_1;
            end
        end
        always @(posedge i_clk, posedge i_rst) begin
            if(i_rst)begin
                mul_3_in_1_r <= 0;
            end
            else if(core_start)begin
                mul_3_in_1_r <= mul_3_in_1;
            end
        end
        always @(posedge i_clk, posedge i_rst) begin
            if(i_rst)begin
                mul_4_in_1_r <= 0;
            end
            else if(core_start)begin
                mul_4_in_1_r <= mul_4_in_1;
            end
        end
        always @(posedge i_clk, posedge i_rst) begin
            if(i_rst)begin
                mul_5_in_1_r <= 0;
            end
            else if(core_start)begin
                mul_5_in_1_r <= mul_5_in_1;
            end
        end
        always @(posedge i_clk, posedge i_rst) begin
            if(i_rst)begin
                mul_6_in_1_r <= 0;
            end
            else if(core_start)begin
                mul_6_in_1_r <= mul_6_in_1;
            end
        end
        always @(posedge i_clk, posedge i_rst) begin
            if(i_rst)begin
                mul_7_in_1_r <= 0;
            end
            else if(core_start)begin
                mul_7_in_1_r <= mul_7_in_1;
            end
        end

        always @(posedge i_clk, posedge i_rst) begin
            if(i_rst)begin
                mul_0_in_2_r <= 0;
            end
            else if(core_start)begin
                mul_0_in_2_r <= mul_0_in_2;
            end
        end
        always @(posedge i_clk, posedge i_rst) begin
            if(i_rst)begin
                mul_1_in_2_r <= 0;
            end
            else if(core_start)begin
                mul_1_in_2_r <= mul_1_in_2;
            end
        end
        always @(posedge i_clk, posedge i_rst) begin
            if(i_rst)begin
                mul_2_in_2_r <= 0;
            end
            else if(core_start)begin
                mul_2_in_2_r <= mul_2_in_2;
            end
        end
        always @(posedge i_clk, posedge i_rst) begin
            if(i_rst)begin
                mul_3_in_2_r <= 0;
            end
            else if(core_start)begin
                mul_3_in_2_r <= mul_3_in_2;
            end
        end
        always @(posedge i_clk, posedge i_rst) begin
            if(i_rst)begin
                mul_4_in_2_r <= 0;
            end
            else if(core_start)begin
                mul_4_in_2_r <= mul_4_in_2;
            end
        end
        always @(posedge i_clk, posedge i_rst) begin
            if(i_rst)begin
                mul_5_in_2_r <= 0;
            end
            else if(core_start)begin
                mul_5_in_2_r <= mul_5_in_2;
            end
        end
        always @(posedge i_clk, posedge i_rst) begin
            if(i_rst)begin
                mul_6_in_2_r <= 0;
            end
            else if(core_start)begin
                mul_6_in_2_r <= mul_6_in_2;
            end
        end
        always @(posedge i_clk, posedge i_rst) begin
            if(i_rst)begin
                mul_7_in_2_r <= 0;
            end
            else if(core_start)begin
                mul_7_in_2_r <= mul_7_in_2;
            end
        end

    // mul_out_r
        always @(posedge i_clk, posedge i_rst) begin
            if(i_rst)begin
                mul_0_out_r <= 0;
            end
            else if(core_start)begin
                mul_0_out_r <= mul_0_out[PRODCUT_WIDTH-1 -: S3_16_WIDTH];
            end 
        end
        always @(posedge i_clk, posedge i_rst) begin
            if(i_rst)begin
                mul_1_out_r <= 0;
            end
            else if(core_start)begin
                mul_1_out_r <= mul_1_out[PRODCUT_WIDTH-1 -: S3_16_WIDTH];
            end 
        end
        always @(posedge i_clk, posedge i_rst) begin
            if(i_rst)begin
                mul_2_out_r <= 0;
            end
            else if(core_start)begin
                mul_2_out_r <= mul_2_out[PRODCUT_WIDTH-1 -: S3_16_WIDTH];
            end 
        end
        always @(posedge i_clk, posedge i_rst) begin
            if(i_rst)begin
                mul_3_out_r <= 0;
            end
            else if(core_start)begin
                mul_3_out_r <= mul_3_out[PRODCUT_WIDTH-1 -: S3_16_WIDTH];
            end
        end
        always @(posedge i_clk, posedge i_rst) begin
            if(i_rst)begin
                mul_4_out_r <= 0;
            end
            else if(core_start)begin
                mul_4_out_r <= mul_4_out[PRODCUT_WIDTH-1 -: S3_16_WIDTH];
            end
        end
        always @(posedge i_clk, posedge i_rst) begin
            if(i_rst)begin
                mul_5_out_r <= 0;
            end
            else if(core_start)begin
                mul_5_out_r <= mul_5_out[PRODCUT_WIDTH-1 -: S3_16_WIDTH];
            end
        end
        always @(posedge i_clk, posedge i_rst) begin
            if(i_rst)begin
                mul_6_out_r <= 0;
            end
            else if(core_start)begin
                mul_6_out_r <= mul_6_out[PRODCUT_WIDTH-1 -: S3_16_WIDTH];
            end
        end
        always @(posedge i_clk, posedge i_rst) begin
            if(i_rst)begin
                mul_7_out_r <= 0;
            end
            else if(core_start)begin
                mul_7_out_r <= mul_7_out[PRODCUT_WIDTH-1 -: S3_16_WIDTH];
            end
        end

// ---------------------------------------------------------------------------
// Input reg
// ---------------------------------------------------------------------------
    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            H11_im <= 0;
        end
        else if(i_trig & i_data_buf_cnt == 0)begin
            H11_im <= i_data[47 -: S1_11_WIDTH];
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            H11_re <= 0;
        end
        else if(i_trig & i_data_buf_cnt == 0)begin
            H11_re <= i_data[23 -: S1_11_WIDTH];
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            H12_im <= 0;
        end
        else if(i_trig & i_data_buf_cnt == 1)begin
            H12_im <= i_data[47 -: S1_11_WIDTH];
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            H12_re <= 0;
        end
        else if(i_trig & i_data_buf_cnt == 1)begin
            H12_re <= i_data[23 -: S1_11_WIDTH];
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            H13_im <= 0;
        end
        else if(i_trig & i_data_buf_cnt == 2)begin
            H13_im <= i_data[47 -: S1_11_WIDTH];
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            H13_re <= 0;
        end
        else if(i_trig & i_data_buf_cnt == 2)begin
            H13_re <= i_data[23 -: S1_11_WIDTH];
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            H14_im <= 0;
        end
        else if(i_trig & i_data_buf_cnt == 3)begin
            H14_im <= i_data[47 -: S1_11_WIDTH];
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            H14_re <= 0;
        end
        else if(i_trig & i_data_buf_cnt == 3)begin
            H14_re <= i_data[23 -: S1_11_WIDTH];
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            Y1_im <= 0;
        end
        else if(i_trig & i_data_buf_cnt == 4)begin
            Y1_im <= i_data[47 -: S1_11_WIDTH];
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            Y1_re <= 0;
        end
        else if(i_trig & i_data_buf_cnt == 4)begin
            Y1_re <= i_data[23 -: S1_11_WIDTH];
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            Y1_buf_im <= 0;
        end
        else if(i_trig & i_data_buf_cnt == 19)begin
            Y1_buf_im <= Y1_im;
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            Y1_buf_re <= 0;
        end
        else if(i_trig & i_data_buf_cnt == 19)begin
            Y1_buf_re <= Y1_re;
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            H21_im <= 0;
        end
        else if(i_trig & i_data_buf_cnt == 5)begin
            H21_im <= i_data[47 -: S1_11_WIDTH];
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            H21_re <= 0;
        end
        else if(i_trig & i_data_buf_cnt == 5)begin
            H21_re <= i_data[23 -: S1_11_WIDTH];
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            H22_im <= 0;
        end
        else if(i_trig & i_data_buf_cnt == 6)begin
            H22_im <= i_data[47 -: S1_11_WIDTH];
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            H22_re <= 0;
        end
        else if(i_trig & i_data_buf_cnt == 6)begin
            H22_re <= i_data[23 -: S1_11_WIDTH];
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            H23_im <= 0;
        end
        else if(i_trig & i_data_buf_cnt == 7)begin
            H23_im <= i_data[47 -: S1_11_WIDTH];
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            H23_re <= 0;
        end
        else if(i_trig & i_data_buf_cnt == 7)begin
            H23_re <= i_data[23 -: S1_11_WIDTH];
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            H24_im <= 0;
        end
        else if(i_trig & i_data_buf_cnt == 8)begin
            H24_im <= i_data[47 -: S1_11_WIDTH];
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            H24_re <= 0;
        end
        else if(i_trig & i_data_buf_cnt == 8)begin
            H24_re <= i_data[23 -: S1_11_WIDTH];
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            Y2_im <= 0;
        end
        else if(i_trig & i_data_buf_cnt == 9)begin
            Y2_im <= i_data[47 -: S1_11_WIDTH];
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            Y2_re <= 0;
        end
        else if(i_trig & i_data_buf_cnt == 9)begin
            Y2_re <= i_data[23 -: S1_11_WIDTH];
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            Y2_buf_im <= 0;
        end
        else if(i_trig & i_data_buf_cnt == 19)begin
            Y2_buf_im <= Y2_im;
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            Y2_buf_re <= 0;
        end
        else if(i_trig & i_data_buf_cnt == 19)begin
            Y2_buf_re <= Y2_re;
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            H31_im <= 0;
        end
        else if(i_trig & i_data_buf_cnt == 10)begin
            H31_im <= i_data[47 -: S1_11_WIDTH];
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            H31_re <= 0;
        end
        else if(i_trig & i_data_buf_cnt == 10)begin
            H31_re <= i_data[23 -: S1_11_WIDTH];
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            H32_im <= 0;
        end
        else if(i_trig & i_data_buf_cnt == 11)begin
            H32_im <= i_data[47 -: S1_11_WIDTH];
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            H32_re <= 0;
        end
        else if(i_trig & i_data_buf_cnt == 11)begin
            H32_re <= i_data[23 -: S1_11_WIDTH];
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            H33_im <= 0;
        end
        else if(i_trig & i_data_buf_cnt == 12)begin
            H33_im <= i_data[47 -: S1_11_WIDTH];
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            H33_re <= 0;
        end
        else if(i_trig & i_data_buf_cnt == 12)begin
            H33_re <= i_data[23 -: S1_11_WIDTH];
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            H34_im <= 0;
        end
        else if(i_trig & i_data_buf_cnt == 13)begin
            H34_im <= i_data[47 -: S1_11_WIDTH];
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            H34_re <= 0;
        end
        else if(i_trig & i_data_buf_cnt == 13)begin
            H34_re <= i_data[23 -: S1_11_WIDTH];
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            Y3_im <= 0;
        end
        else if(i_trig & i_data_buf_cnt == 14)begin
            Y3_im <= i_data[47 -: S1_11_WIDTH];
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            Y3_re <= 0;
        end
        else if(i_trig & i_data_buf_cnt == 14)begin
            Y3_re <= i_data[23 -: S1_11_WIDTH];
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            Y3_buf_im <= 0;
        end
        else if(i_trig & i_data_buf_cnt == 19)begin
            Y3_buf_im <= Y3_im;
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            Y3_buf_re <= 0;
        end
        else if(i_trig & i_data_buf_cnt == 19)begin
            Y3_buf_re <= Y3_re;
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            H41_im <= 0;
        end
        else if(i_trig & i_data_buf_cnt == 15)begin
            H41_im <= i_data[47 -: S1_11_WIDTH];
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            H41_re <= 0;
        end
        else if(i_trig & i_data_buf_cnt == 15)begin
            H41_re <= i_data[23 -: S1_11_WIDTH];
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            H42_im <= 0;
        end
        else if(i_trig & i_data_buf_cnt == 16)begin
            H42_im <= i_data[47 -: S1_11_WIDTH];
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            H42_re <= 0;
        end
        else if(i_trig & i_data_buf_cnt == 16)begin
            H42_re <= i_data[23 -: S1_11_WIDTH];
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            H43_im <= 0;
        end
        else if(i_trig & i_data_buf_cnt == 17)begin
            H43_im <= i_data[47 -: S1_11_WIDTH];
        end
    end
    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            H43_re <= 0;
        end
        else if(i_trig & i_data_buf_cnt == 17)begin
            H43_re <= i_data[23 -: S1_11_WIDTH];
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            H44_im <= 0;
        end
        else if(i_trig & i_data_buf_cnt == 18)begin
            H44_im <= i_data[47 -: S1_11_WIDTH];
        end
    end
    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            H44_re <= 0;
        end
        else if(i_trig & i_data_buf_cnt == 18)begin
            H44_re <= i_data[23 -: S1_11_WIDTH];
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            Y4_im <= 0;
        end
        else if(i_trig & i_data_buf_cnt == 19)begin
            Y4_im <= i_data[47 -: S1_11_WIDTH];
        end
    end

    always @(posedge i_clk, posedge i_rst) begin
        if(i_rst)begin
            Y4_re <= 0;
        end
        else if(i_trig & i_data_buf_cnt == 19)begin
            Y4_re <= i_data[23 -: S1_11_WIDTH];
        end
    end


    
endmodule