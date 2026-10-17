`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2025 06:12:12 PM
// Design Name: 
// Module Name: ins_mem
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module Instruction_memory#(parameter ins_width = 32, ins_depth=19, pc_width = 5, opcode_width=7, r_width=5, fun1=3, fun2=7, immediate_len=12)(
input logic [pc_width-1:0] pc, 
output logic [r_width-1:0] r1, 
output logic [r_width-1:0] r2,
output logic [r_width-1:0] rd,
output logic [ins_width-1:0] ins,

output logic [opcode_width-1:0] opcode,
output logic [fun1-1:0] fun11,
output logic [fun2-1:0] fun21
);

logic [ins_width-1:0] ins_block[ins_depth-1:0];
initial begin
$readmemh("ins.mem",ins_block);
end

always_comb
begin
opcode=ins_block[pc][6:0];
r1=ins_block[pc][19:15];
r2=ins_block[pc][24:20];
rd=ins_block[pc][11:7];
fun11=ins_block[pc][14:12];
fun21=ins_block[pc][31:25];
ins=ins_block[pc];

end
endmodule

