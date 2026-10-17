`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2025 02:10:15 PM
// Design Name: 
// Module Name: task1
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


module task1(
input logic t, 
input logic clk, 
output logic Q
);

always_ff @(posedge clk or posedge t )
begin
Q<=1;
if (t==1)
begin
Q<=~Q;
end
end 
endmodule
