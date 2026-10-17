`timescale 1ns / 1ps

module top(
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

    



    assign opcode_D = instr_D[6:0];
    assign rs1_D = instr_D[19:15];
    assign rs2_D = instr_D[24:20];
    assign rd_D = instr_D[11:7];
    assign fun11_D = instr_D[14:12];
    assign fun21_D = instr_D[31:25];

   
  

    Generic_pipeline_reg_reg #(
        .pc_w(32), .ins_w(32), .imm_w(32), .reg_w(5), .alu_w(32), .op_w(7)
    ) ID_EX_REG (
        .clock(clock), .reset(reset),
        .pc(pc_D),
        .instruction(instr_D),
        .opcode(opcode_D),
        .immediate(imm_D),
        .r1(rs1_D), .r2(rs2_D), .rd(rd_D),
        .r2_value(data2_D),
        .ALU_result(data1_D),
        .memread(memread_D), .memwrite(memwrite_D), .mem_to_reg(mem_to_reg_D), 
        .regwrite(regwrite_D), .ALU_source(alu_src_D), .ALU_op(alu_op_D), 
        .branch(branch_D), .jump(jump_D),
        .out_pc(pc_E),
        .out_instruction(instr_E_slice),
        .out_opcode(opcode_E),
        .out_immediate(imm_E),
        .out_r1(rs1_E), .out_r2(rs2_E), .out_rd(rd_E),
        .out_r2_value(data2_E),
        .out_ALU_result(data1_E),
        .out_memread(memread_E), .out_memwrite(memwrite_E), .out_mem_to_reg(mem_to_reg_E), 
        .out_regwrite(regwrite_E), .out_ALU_source(alu_src_E), .out_ALU_op(alu_op_E), 
        .out_branch(branch_E), .out_jump(jump_E)
    );

    assign fun11_E = instr_E_slice[14:12];
    assign fun21_E = instr_E_slice[31:25];

    alu_control alu_con_inst (
        .ALU_op(alu_op_E), .fun21(fun21_E), .fun11(fun11_E), 
        .ALU_control(alu_control_E)
    );

    MUX_1 mux1_inst (
        .data_from_reg2(data2_E),
        .immediate(imm_E),
        .ALU_source(alu_src_E),
        .data2(alu_operand2_E)
    );





ALU alu_inst (
    .data1(data1_E),
    .data2(data2_E),
    .dataW(alu_result_E),
    .ALU_control(alu_control_E),
    .zero(zero_E)
);

    assign pc = pc_F;
    assign ins = instr_F;
    assign data1 = data1_D;
    assign data2 = data2_D;
    assign wb_data = alu_control_E;
    assign opcode = opcode_D;
    assign r1 = rs1_E;
    assign r2 = rs2_E;
    assign rd = rd_D;
    assign immediate_32 = imm_E;
    assign memread = memread_D;
    assign memwrite = memwrite_D;
    assign regwrite = regwrite_W;
    assign zero = zero_E;

endmodule
