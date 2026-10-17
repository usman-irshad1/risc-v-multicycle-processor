`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2025 01:31:51 PM
// Design Name: 
// Module Name: immediate_gen
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


module immediate_gen#(parameter ins_width = 32, ins_depth=19, pc_width = 5, opcode_width=7, r_width=5, fun1=3, fun2=7, immediate_len=12)(
 
input logic [ins_width-1:0] ins,
output logic [ins_width-1:0] immediate

);

always_comb
begin
if (ins[6:0]==7'b0100011)
begin 
immediate={{11{ins[31]}},ins[31:25],ins[11:7]};
end
else 
begin
immediate={{20{ins[31]}},ins[31:20]};
end

end

endmodule
