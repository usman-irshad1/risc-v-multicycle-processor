`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2025 03:01:36 PM
// Design Name: 
// Module Name: tb_task1
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


module tb_task1();

logic clk;
logic Q;
logic t;
task1 dut(.clk(clk),.Q(Q),.t(t));

always #5 
clk=~clk;

initial begin

clk=0;
t=0;

#10
t=1;
#15
t=0;
#5
t=1;
#10
t=0;
end
endmodule
