`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2025 02:04:07 PM
// Design Name: 
// Module Name: custom_processor_1
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


module reg_file #(parameter datawidth=16, control=2)(
    output logic [datawidth-1:0] r3,
    input logic [control-1:0] c1,
    input logic [control-1:0] c2,
    output logic [datawidth-1:0] o1,
    output logic [datawidth-1:0] o2,
    input logic enable,
    input logic [control-1:0] rdadress,
    input logic clock,
    input logic [datawidth-1:0] data_in
);

logic [datawidth -1 :0] regs [0:3];
initial begin
$readmemb("regfile.mem", regs);
end
always_comb begin
o1=regs[c1];
o2=regs[c2];
end
always_ff @(posedge clock)
begin
if (enable)
begin
regs[rdadress]<=data_in;
end
end
assign r3 = regs[rdadress];  
endmodule
    
