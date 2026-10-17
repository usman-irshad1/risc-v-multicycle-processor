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
output logic [6:0] opcode,
output logic [2:0] fun11,
output logic [6:0] fun21,
output logic [31:0] wb_data,
output logic memread,
output logic memwrite,
output logic mem_to_reg,
output logic regwrite,
output logic ALU_source,
output logic [1:0] ALU_op,
output logic [3:0] ALU_control,
output logic [31:0] datard,
output logic branch
);

program_counter pc_inst(.pc(pc),.clock(clock),.reset(reset));
Instruction_memory instr_mem_inst(.pc(pc),.r1(r1),.r2(r2),.rd(rd),.ins(ins),.opcode(opcode),.fun11(fun11),.fun21(fun21));
reg_file regfile_inst(.r1(r1),.r2(r2),.rd(rd),.dataW(wb_data),.data1(data1),.data2(data2),.clock(clock),.regwrite(regwrite),.datard(datard));
ALU alu_inst(.data1(data1),.data2(data2),.dataW(wb_data),.ALU_control(ALU_control));
Control_unit con_unit_inst(.opcode(opcode),.memread(memread),.memwrite(memwrite),.mem_to_reg(mem_to_reg),.regwrite(regwrite),.ALU_source(ALU_source),.ALU_op(ALU_op),.branch(branch));
alu_control alu_con_inst(.ALU_op(ALU_op),.fun21(fun21[5]),.fun11(fun11),.ALU_control(ALU_control));
endmodule
