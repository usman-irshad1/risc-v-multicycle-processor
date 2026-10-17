`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2025 02:27:14 PM
// Design Name: 
// Module Name: alu_tb
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


module alu_tb();
logic [1:0]opcode;
logic [15:0]r1;
logic [15:0]r2;
logic [15:0]r3;

ALU dut (.opcode(opcode),.r1(r1),.r2(r2),.r3(r3));

initial begin
r1=0;
r2=3;

opcode=2'b00;
#10
opcode=2'b01;
#10
opcode=2'b10;
#10
opcode=2'b11;
#10
opcode=2'b00;
end
endmodule
