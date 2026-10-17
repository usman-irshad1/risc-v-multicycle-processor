`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2025 04:58:38 PM
// Design Name: 
// Module Name: tb
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


module tb();

logic i1, clock, s;
logic o1;

task1 dut (.i1(i1),.clock(clock),.s(s),.o1(o1));

 initial begin 
 clock=0;
 forever #10 clock=~clock;
 end
 
 initial begin
 i1=1;
 #10
 s=1;
 #10
 s =0;
 #10 
 s =1;
 i1=0;
 #10
 s =0;
  i1=1;
 #10
 s =1;
end

endmodule
