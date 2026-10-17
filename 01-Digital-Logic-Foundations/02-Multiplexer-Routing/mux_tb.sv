`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2025 07:10:58 PM
// Design Name: 
// Module Name: mux_tb
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


module mux_tb();
logic a,b,select;
mux_1 dut(.a(a),.b(b),.select(select));

initial
begin
a=1;
b=0;
select=1;
#5
select=0;
#5
select=1;
#5
select=0;
end
    
endmodule
