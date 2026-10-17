module top#(parameter width_1 = 2 , width_2 = 16)(
  input logic clock,
  input logic reset,
  output logic [width_1-1:0] pc,
  output logic [width_1-1:0] opcode,
  output logic [width_1-1:0] rd_adress,
  output logic [width_1-1:0] r1_add,
  output logic [width_1-1:0] r2_add,
  output logic [width_2-1:0] r1_cont,
  output logic [width_2-1:0] r2_cont,
  output logic [width_2-1:0] r3_cont,
  logic [width_2-1:0] storage,
  input logic enable
);
  

  program_counter pc_inst (.pc(pc), .clock(clock), .reset(reset));
  Instruction_memory im_inst (.pc(pc), .r1(r1_add), .r2(r2_add), .dr(rd_adress), .opcode(opcode));
  reg_file rf_inst (.clock(clock), .c1(r1_add), .c2(r2_add), .data_in(storage), .o1(r1_cont), .o2(r2_cont), .rdadress(rd_adress), .enable(enable),.r3(r3_cont));
  ALU alu_inst (.opcode(opcode), .r1(r1_cont), .r2(r2_cont), .r3(storage));
endmodule
