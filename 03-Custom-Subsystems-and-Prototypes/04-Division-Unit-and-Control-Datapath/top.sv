module top(
input logic clock,
input logic reset,
output logic [4:0] pc,
output logic [4:0] r1,
output logic [4:0] r2,
output logic [4:0] rd,
output logic [31:0] ins,
output logic [31:0] data1,
output logic [31:0] data2,
output logic [31:0] immediate_32,
output logic [6:0] opcode,
output logic [2:0] fun11,
output logic [6:0] fun21,
output logic [31:0] wb_data,
output logic zero,
output logic memread,
output logic memwrite,
output logic mem_to_reg,
output logic regwrite,
output logic ALU_source,
output logic [1:0] ALU_op,
output logic [3:0] ALU_control,
output logic branch,
output logic [31:0] hi,
output logic [31:0] lo
);
logic [31:0] dataholder;
logic [31:0] alu_result, mem_data;
logic [31:0] alu_result_final;

logic [4:0] pc_wire, next_pc;
logic [31:0] i;

program_counter pc_inst(.pc(pc),.clock(clock),.reset(reset),.next_pc(next_pc));
Instruction_memory instr_mem_inst(.pc(pc), .r1(r1), .r2(r2), .rd(rd), .ins(ins), .opcode(opcode), .fun11(fun11), .fun21(fun21));
reg_file regfile_inst(.r1(r1), .r2(r2), .rd(rd), .dataW(wb_data), .data1(data1), .data2(dataholder), .clock(clock), .regwrite(regwrite), .ALU_control(ALU_control), .hi(hi), .lo(lo));
immediate_gen imm_inst(.ins(ins), .immediate(immediate_32));
MUX_1 mux1_inst(.data_from_reg2(dataholder), .immediate(immediate_32), .ALU_source(ALU_source), .data2(data2));
ALU alu_inst(.data1(data1), .data2(data2), .dataW(alu_result), .ALU_control(ALU_control), .zero(zero));
data_mem dmem_inst(.rd(mem_data), .r2(dataholder), .clock(clock), .memwrite(memwrite), .memread(memread), .dataW(alu_result));

multiplication_module mul_mod_inst(.ALU_control(ALU_control), .data1(data1), .data2(dataholder), .hi(hi), .lo(lo),.fun11(fun11));
mul_mux mul_mux_inst(.ALU_control(ALU_control), .alu_1(alu_result), .mul_1(lo), .alu_result_final(alu_result_final));

MUX_2 mux2_inst(.alu_data(alu_result_final), .mem_data(mem_data), .mem_to_reg(mem_to_reg), .wb_data(wb_data));
Control_unit con_unit_inst(.opcode(opcode), .memread(memread), .memwrite(memwrite), .mem_to_reg(mem_to_reg), .regwrite(regwrite), .ALU_source(ALU_source), .ALU_op(ALU_op), .branch(branch));
alu_control alu_con_inst(.ALU_op(ALU_op), .fun21(fun21), .fun11(fun11), .ALU_control(ALU_control));
pc_immediate pc_immediate_inst(.pc_1(pc), .dataW(i), .pc_i(pc_wire));
sll shift_inst(.immediate(immediate_32), .shifted_immediate(i));
mux_3 mux3_inst(.pc_1(pc+5'b00001), .pc_jump(pc_wire), .pc(next_pc), .zero(zero), .branch(branch));

endmodule
