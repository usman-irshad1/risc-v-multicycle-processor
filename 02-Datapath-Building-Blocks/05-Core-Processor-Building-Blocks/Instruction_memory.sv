`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2025 02:44:31 PM
// Design Name: 
// Module Name: Instruction_memory
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


module Instruction_memory#(parameter ins_width=16)(input logic [1:0] pc,
output logic [1:0] r1,
output logic [1:0] r2,
output logic [1:0] opcode,
output logic [1:0] dr
);

logic [ins_width-1:0] ins_block [3:0];
initial begin
$readmemb("ins_file.mem",ins_block);
end

always_comb
begin
opcode=ins_block[pc][1:0];
r1=ins_block[pc][3:2];
r2=ins_block[pc][5:4];
dr=ins_block[pc][7:6];
end
endmodule
