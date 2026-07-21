`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2025 10:26:36 AM
// Design Name: 
// Module Name: sll
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


module sll#(parameter ins_width=32)(
input logic [ins_width-1:0] immediate,
output logic [ins_width-1:0] shifted_immediate
    );
    
    always_comb
    begin
    shifted_immediate=immediate<<<1;
    end
endmodule
