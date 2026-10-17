`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2025 02:17:44 PM
// Design Name: 
// Module Name: data_mem
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


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2025 02:15:38 PM
// Design Name: 
// Module Name: data_mem
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


module data_mem#(parameter ins_width = 32, ins_depth=19, pc_width = 5, opcode_width=7, r_width=5, fun1=3, fun2=7, immediate_len=12)(
input logic [opcode_width-1:0] opcode,
input logic [ins_width-1:0] immediate,
output logic [ins_width-1:0] rd,
input logic [ins_width-1:0] r2,
input logic [ins_width-1:0] r1,
input logic clock
);
logic [31:0] adress;
logic [ins_width -1 :0] data [ins_width-1:0];
initial begin
$readmemh("data_mem.mem", data);
end

always_ff @ (posedge clock)
begin
if (opcode==7'b0000011)//load
begin
adress=r1+immediate;
rd=data[adress];
end
if  (opcode==7'b0100011)//store
begin
adress=r1+immediate;
data[adress]=r2;
end
end
endmodule

