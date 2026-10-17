module Top(
    input  logic        clock,
    input  logic        reset,
    output logic [31:0] pc, 
    output logic [4:0]  r1,
    output logic [4:0]  r2,
    output logic [4:0]  rd,
    output logic [31:0] ins,
    output logic [31:0] data1,
    output logic [31:0] data2,
    output logic [31:0] immediate_32,
    output logic [6:0]  opcode,
    output logic [2:0]  fun11,
    output logic [6:0]  fun21,
    output logic [31:0] wb_data,
    output logic        zero,
    output logic        memread,
    output logic        memwrite,
    output logic        mem_to_reg,
    output logic        regwrite,
    output logic        ALU_source,
    output logic [1:0]  ALU_op,
    output logic [3:0]  ALU_control,
    output logic        branch,
    output logic [31:0] hi,
    output logic [31:0] lo
);

    logic [31:0] pc_F, next_pc_F, pc_plus4_F;
    logic [31:0] instr_F;
    logic [31:0] pc_D, instr_D;
    logic [31:0] data1_D, data2_D, imm_D;
    logic [4:0]  rd_D, rs1_D, rs2_D;
    logic [6:0]  opcode_D;
    logic [2:0]  fun11_D;
    logic [6:0]  fun21_D;
    logic        memread_D, memwrite_D, mem_to_reg_D, regwrite_D;
    logic        alu_src_D, branch_D, jump_D;
    logic [1:0]  alu_op_D;

    logic [31:0] pc_E, imm_E, data1_E, data2_E;
    logic [4:0]  rd_E, rs1_E, rs2_E;
    logic [6:0]  opcode_E;
    logic [31:0] instr_E_slice;
    logic        memread_E, memwrite_E, mem_to_reg_E, regwrite_E;
    logic        alu_src_E, branch_E, jump_E;
    logic [1:0]  alu_op_E;

    logic [31:0] alu_operand2_E;
    logic [31:0] alu_result_E;
    logic [31:0] mul_result_E;
    logic [31:0] final_result_E;
    logic [31:0] branch_target_E;
    logic [31:0] pc_plus4_E;
    logic [3:0]  alu_control_E;
    logic        zero_E;
    logic [2:0]  fun11_E;
    logic [6:0]  fun21_E;

    logic [31:0] pc_branch_M;
    logic [31:0] alu_result_M;
    logic [31:0] write_data_M;
    logic [4:0]  rd_M;
    logic [31:0] zero_flag_container_M;
    logic        zero_M;

    logic        memread_M, memwrite_M, mem_to_reg_M, regwrite_M;
    logic        branch_M, jump_M;

    logic [31:0] mem_read_data_M;
    logic [31:0] pc_next_M;

    logic [31:0] mem_data_W;
    logic [31:0] alu_result_W;
    logic [4:0]  rd_W;
    logic [31:0] pc_plus4_W;
    logic        mem_to_reg_W, regwrite_W, jump_W;
    logic [31:0] wb_final_data;

    program_counter pc_inst (
        .pc(pc_F),
        .clock(clock),
        .reset(reset),
        .next_pc(pc_plus4_F)
    );

    pc_adder pc_4_inst (
        .pc(pc_F),
        .pc_4(pc_plus4_F)
    );

    Instruction_memory instr_mem_inst (
        .pc_byte_address(pc_F),
        .ins(instr_F)
    );

    Generic_pipeline_reg_reg #(
        .pc_w(32), .ins_w(32), .imm_w(32), .reg_w(5), .alu_w(32), .op_w(7)
    ) IF_ID_REG (
        .clock(clock), .reset(reset),
        .pc(pc_F),
        .instruction(instr_F),
        .opcode(7'b0), .immediate(32'b0), .r1(5'b0), .r2(5'b0), .rd(5'b0), 
        .r2_value(32'b0), .ALU_result(32'b0),
        .memread(1'b0), .memwrite(1'b0), .mem_to_reg(1'b0), .regwrite(1'b0), 
        .ALU_source(1'b0), .ALU_op(2'b0), .branch(1'b0), .jump(1'b0),
        .out_pc(pc_D),
        .out_instruction(instr_D),
        .out_opcode(), .out_immediate(), .out_r1(), .out_r2(), .out_rd(),
        .out_r2_value(), .out_ALU_result(),
        .out_memread(), .out_memwrite(), .out_mem_to_reg(), .out_regwrite(),
        .out_ALU_source(), .out_ALU_op(), .out_branch(), .out_jump()
    );
    
    assign opcode_D = instr_D[6:0];
    assign rs1_D = instr_D[19:15];
    assign rs2_D = instr_D[24:20];
    assign rd_D = instr_D[11:7];
    assign fun11_D = instr_D[14:12];
    assign fun21_D = instr_D[31:25];

    
     assign pc = pc_F;
    assign ins = instr_F;
    assign data1 = data1_D;
    assign data2 = data2_D;
    assign wb_data = wb_final_data;
    assign opcode = opcode_D;
    assign r1 = rs1_D;
    assign r2 = rs2_D;
    assign rd = rd_D;
    assign immediate_32 = imm_D;
    assign memread = memread_D;
    assign memwrite = memwrite_D;
    assign regwrite = 0'b1;
    assign zero = 0'b1;
    
endmodule