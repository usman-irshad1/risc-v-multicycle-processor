`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2025 03:46:01 PM
// Design Name: 
// Module Name: reg_tb
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


module reg_tb();

logic [1:0]c1;
logic [1:0]c2;
logic [15:0]r1;
logic enable;
logic [15:0]o1;
logic[15:0]o2;

reg_file dut (.c1(c1),.c2(c2),.r1(r1),.o1(o1),.o2(o2),.enable(enable));
initial begin
c1=1;
c2=2;
#10
c1=2;
c2=1;
#10
c1=3;
c2=4;
#10
c1=4;
c2=3;
#10
enable=1;
r1='b0000101000101010;
c1=1;

end

endmodule
