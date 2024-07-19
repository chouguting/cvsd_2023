module core #( // DO NOT MODIFY!!!
    parameter ADDR_WIDTH = 32,
    parameter INST_WIDTH = 32,
    parameter DATA_WIDTH = 32
) (   
    input                    i_clk,
    input                    i_rst_n,
    output  [ADDR_WIDTH-1:0] o_i_addr,
    input   [INST_WIDTH-1:0] i_i_inst,
    output                   o_d_we,
    output  [ADDR_WIDTH-1:0] o_d_addr,
    output  [DATA_WIDTH-1:0] o_d_wdata,
    input   [DATA_WIDTH-1:0] i_d_rdata,
    output  [           1:0] o_status,
    output                   o_status_valid
);
    reg current_status_valid;
    reg[1:0] current_status;
    assign o_status = current_status;
    assign o_status_valid = current_status_valid;

    //program counter
    reg[ADDR_WIDTH-1:0] program_counter;
    reg[ADDR_WIDTH-1:0] next_program_counter;
    assign o_i_addr = program_counter; //instruction address
    wire instruction_memory_overflow;
    assign instruction_memory_overflow = o_i_addr[31:2] >= 1024;

    wire[INST_WIDTH-1:0] current_instruction;
    assign current_instruction = i_i_inst; //current instruction
    wire[5:0]  current_opcode; 
    assign current_opcode = current_instruction[31:26]; //current opcode


    //modules
    //sign extension
    wire signed[31:0] sign_extended_immediate;
    assign sign_extended_immediate = { {16{current_instruction[15]}}, current_instruction[15:0] };

    //registers
    reg[1:0] write_reg_source_sel;
    localparam WRITE_REG_SOURCE_R_TYPE = 2'd0;
    localparam WRITE_REG_SOURCE_I_TYPE = 2'd1;
    wire[4:0] register_write_reg_sel;
    assign register_write_reg_sel = (write_reg_source_sel==WRITE_REG_SOURCE_R_TYPE) ? current_instruction[15:11] : current_instruction[20:16];
    reg register_write_enable;

    wire[31:0] register_read_data_1, register_read_data_2;
    wire[31:0] register_write_data;
    reg[1:0] register_write_data_source_sel;
    localparam REGISTER_WR_DATA_SOURCE_ALU = 2'd0;
    localparam REGISTER_WR_DATA_SOURCE_DATA_MEMORY = 2'd1;
    
    
    registers registers0(
        .i_clk(i_clk),
        .i_rst_n(i_rst_n),
        .i_read_reg_sel_1(current_instruction[25:21]),
        .i_read_reg_sel_2(current_instruction[20:16]),
        .i_write_reg_sel(register_write_reg_sel),
        .i_write_data(register_write_data),
        .i_write_enable(register_write_enable),
        .o_read_data_1(register_read_data_1),
        .o_read_data_2(register_read_data_2)
    );

    //ALU
    reg[3:0]  alu_operation;
    wire[31:0] alu_in_data_a, alu_in_data_b;
    localparam ALU_SOURCE_B_R_TYPE = 2'd0;
    localparam ALU_SOURCE_B_I_TYPE = 2'd1;
    reg[1:0] alu_source_b_sel;
    assign alu_in_data_a = register_read_data_1;
    assign alu_in_data_b = (alu_source_b_sel==ALU_SOURCE_B_R_TYPE) ? register_read_data_2 : sign_extended_immediate;
    wire signed[31:0] alu_result;
    wire alu_overflow_flag, alu_equal_flag;


    alu alu0(
        .i_data_a(alu_in_data_a), 
        .i_data_b(alu_in_data_b), 
        .i_operation(alu_operation), 
        .o_alu_result(alu_result), 
        .o_overflow_flag(alu_overflow_flag), 
        .o_equal(alu_equal_flag));


    //DATA MEMORY
    reg data_memory_write_enable;
    wire data_memory_overflow;
    // reg[DATA_WIDTH-1:0] data_memory_write_data;
    // reg[DATA_WIDTH-1:0] data_memory_adderss;
    wire[ADDR_WIDTH-1:0] data_memory_read_data;
    assign o_d_we = data_memory_write_enable;
    assign o_d_wdata = register_read_data_2;
    assign o_d_addr = alu_result;
    assign data_memory_read_data = i_d_rdata;

    assign data_memory_overflow = o_d_addr[31:2] >= 64;

    //Write back
    assign register_write_data = (register_write_data_source_sel==REGISTER_WR_DATA_SOURCE_ALU) ? alu_result : data_memory_read_data; 
 
    //states
    reg[4:0] current_state, next_state;
    localparam STATE_START = 5'd0;
    localparam STATE_WAIT_I_MEMORY = 5'd1;
    localparam STATE_EXECUTE = 5'd2;
    localparam STATE_WAIT_LW = 5'd3;
    localparam STATE_STATUS = 5'd4;
    
    localparam STATE_STOP = 5'd5;
    localparam STATE_R_TYPE_SUCCESS = 5'd6;
    localparam STATE_I_TYPE_SUCCESS = 5'd7;
    localparam STATE_OVERFLOW = 5'd8;
    


    always @(posedge i_clk or negedge i_rst_n) begin
        if(~i_rst_n) begin
            current_state <= STATE_START;
            program_counter <= 0;
        end
        else begin
            current_state <= next_state;
            program_counter <= next_program_counter;
        end
        
    end


    //branch
    wire[ADDR_WIDTH-1:0] branch_target;
    assign branch_target = $signed(program_counter) + $signed(sign_extended_immediate);
    wire branch_target_overflow;
    assign branch_target_overflow = branch_target[31:2] >= 1024;


    //state machine
    always @(*) begin
        //defaults
        
        next_program_counter = program_counter;
        next_state = current_state;
        current_status_valid = 0;
        current_status = 0;
        write_reg_source_sel = WRITE_REG_SOURCE_R_TYPE;
        register_write_enable = 0;
        alu_operation = 0;
        alu_source_b_sel = ALU_SOURCE_B_R_TYPE;
        data_memory_write_enable = 0;
        register_write_data_source_sel = REGISTER_WR_DATA_SOURCE_ALU;
        

        case (current_state)
            STATE_START: begin
                next_state = STATE_WAIT_I_MEMORY;
                next_program_counter = 0;
            end
            STATE_WAIT_I_MEMORY: begin
                next_state = STATE_EXECUTE;
                if(instruction_memory_overflow) begin
                    next_state = STATE_OVERFLOW;
                end
            end
            STATE_EXECUTE: begin
                next_program_counter = program_counter + 4;
                //next_state = STATE_STATUS;
                case (current_opcode)
                    `OP_ADD: begin
                        register_write_enable = 1'b1; //write back to register
                        alu_operation = 4'd0; //add
                        next_state = STATE_R_TYPE_SUCCESS;
                    end
                    `OP_SUB: begin
                        register_write_enable = 1'b1; //write back to register
                        alu_operation = 4'd1; //sub
                        next_state = STATE_R_TYPE_SUCCESS;
                    end
                    `OP_MUL: begin
                        register_write_enable = 1'b1; //write back to register
                        alu_operation = 4'd2; //mul
                        next_state = STATE_R_TYPE_SUCCESS;
                    end
                    `OP_ADDI: begin
                        register_write_enable = 1'b1; //write back to register
                        write_reg_source_sel = WRITE_REG_SOURCE_I_TYPE;
                        alu_operation = 4'd0; //add
                        alu_source_b_sel = ALU_SOURCE_B_I_TYPE;
                        next_state = STATE_I_TYPE_SUCCESS;
                    end
                    `OP_LW: begin
                        // register_write_enable = 1'b1; //write back to register
                        // register_write_data_source_sel = REGISTER_WR_DATA_SOURCE_DATA_MEMORY;
                        alu_operation = 4'd0; //add
                        alu_source_b_sel = ALU_SOURCE_B_I_TYPE;
                        data_memory_write_enable = 1'b0;
                        next_state = STATE_WAIT_LW;
                        next_program_counter = program_counter;
                        if(data_memory_overflow) begin
                            next_state = STATE_OVERFLOW;
                        end
                    end
                    `OP_SW: begin
                        alu_operation = 4'd0; //add
                        alu_source_b_sel = ALU_SOURCE_B_I_TYPE;
                        data_memory_write_enable = 1'b1;
                        next_state = STATE_I_TYPE_SUCCESS;
                        if(data_memory_overflow) begin
                            next_state = STATE_OVERFLOW;
                            data_memory_write_enable = 1'b0;
                        end
                    end
                    `OP_AND: begin
                        register_write_enable = 1'b1; //write back to register
                        alu_operation = 4'd7; //and
                        next_state = STATE_R_TYPE_SUCCESS;
                    end
                    `OP_OR: begin
                        register_write_enable = 1'b1; //write back to register
                        alu_operation = 4'd8; //or
                        next_state = STATE_R_TYPE_SUCCESS;
                    end
                    `OP_NOR: begin
                        register_write_enable = 1'b1; //write back to register
                        alu_operation = 4'd9; //nor
                        next_state = STATE_R_TYPE_SUCCESS;
                    end
                    `OP_BEQ: begin
                        alu_source_b_sel = ALU_SOURCE_B_R_TYPE;
                        next_state = STATE_I_TYPE_SUCCESS;
                        
                        if(alu_equal_flag) begin
                            // next_program_counter = program_counter + sign_extended_immediate;
                            next_program_counter = branch_target;
                            if(branch_target_overflow) begin
                                next_state = STATE_OVERFLOW;
                            end
                        end
                        
                        
                    end
                    `OP_BNE: begin
                        alu_source_b_sel = ALU_SOURCE_B_R_TYPE;
                        next_state = STATE_I_TYPE_SUCCESS;
                        if(~alu_equal_flag) begin
                            // next_program_counter = program_counter + sign_extended_immediate;
                            next_program_counter = branch_target;
                            if(branch_target_overflow) begin
                                next_state = STATE_OVERFLOW;
                            end
                        end
                        
                        
                    end
                    `OP_SLT: begin
                        register_write_enable = 1'b1; //write back to register
                        alu_operation = 4'd10; //less
                        next_state = STATE_R_TYPE_SUCCESS;
                    end
                    `OP_FP_ADD: begin
                        register_write_enable = 1'b1; //write back to register
                        alu_operation = 4'd3; //fp add
                        next_state = STATE_R_TYPE_SUCCESS;
                    end
                    `OP_FP_SUB: begin
                        register_write_enable = 1'b1; //write back to register
                        alu_operation = 4'd4; //fp sub
                        next_state = STATE_R_TYPE_SUCCESS;
                    end
                    `OP_FP_MUL: begin
                        register_write_enable = 1'b1; //write back to register
                        alu_operation = 4'd5; //fp mul
                        next_state = STATE_R_TYPE_SUCCESS;
                    end
                    `OP_SLL: begin
                        register_write_enable = 1'b1; //write back to register
                        alu_operation = 4'd11; //left shift
                        next_state = STATE_R_TYPE_SUCCESS;
                    end
                    `OP_SRL: begin
                        register_write_enable = 1'b1; //write back to register
                        alu_operation = 4'd12; //right shift
                        next_state = STATE_R_TYPE_SUCCESS;
                    end
                    `OP_EOF: begin
                        next_state = STATE_STOP;
                    end
                    `OP_ADDU: begin
                        register_write_enable = 1'b1; //write back to register
                        alu_operation = 4'd13; //addu
                        next_state = STATE_R_TYPE_SUCCESS;
                    end
                    `OP_SUBU: begin
                        register_write_enable = 1'b1; //write back to register
                        alu_operation = 4'd14; //subu
                        next_state = STATE_R_TYPE_SUCCESS;
                    end
                    
                endcase
                if(alu_overflow_flag) begin
                    next_state = STATE_OVERFLOW;
                end
        
            end
            STATE_WAIT_LW: begin
                alu_operation = 4'd0; //add
                alu_source_b_sel = ALU_SOURCE_B_I_TYPE;
                next_program_counter = program_counter + 4;
                register_write_enable = 1'b1; //write back to register
                register_write_data_source_sel = REGISTER_WR_DATA_SOURCE_DATA_MEMORY;
                data_memory_write_enable = 1'b0;
                write_reg_source_sel = WRITE_REG_SOURCE_I_TYPE;
                next_state = STATE_I_TYPE_SUCCESS;
            end
            STATE_R_TYPE_SUCCESS: begin
                current_status_valid = 1'b1;
                next_state = STATE_WAIT_I_MEMORY;
                current_status = `R_TYPE_SUCCESS;
            end
            STATE_I_TYPE_SUCCESS: begin
                current_status_valid = 1'b1;
                next_state = STATE_WAIT_I_MEMORY;
                current_status = `I_TYPE_SUCCESS;
            end
            STATE_STOP: begin
                current_status_valid = 1'b1;
                current_status = `MIPS_END;
            end
            STATE_OVERFLOW: begin
                current_status_valid = 1'b1;
                current_status = `MIPS_OVERFLOW;
            end

        endcase

    end


    

endmodule