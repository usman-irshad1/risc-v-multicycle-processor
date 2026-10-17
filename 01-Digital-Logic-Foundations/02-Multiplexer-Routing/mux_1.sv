`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2025 07:06:26 PM
// Design Name: 
// Module Name: mux_1
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


module mux_1(
input logic a,b,select,
output logic c
    );
    
always_ff@(*)
begin
if (select)
begin
c<=a;
end
else
begin
c<=b;
end
end
endmodule
