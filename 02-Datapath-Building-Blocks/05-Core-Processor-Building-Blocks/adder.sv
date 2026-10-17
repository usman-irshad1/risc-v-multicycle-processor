`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2025 02:14:04 PM
// Design Name: 
// Module Name: adder
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


module ALU#(
    parameter opcode_size=2,
    parameter width=16
)(
    input  logic [opcode_size-1:0] opcode,
    input  logic [width-1:0] r1,
    input  logic [width-1:0] r2,
    output logic [width-1:0] r3

);


always_comb
begin
case(opcode)
    2'b00:r3 = r1 + r2;
    2'b01:r3 = r1 - r2;
    2'b10:r3 = r1 & r2;
    2'b11:r3 = r1 | r2;
    endcase
end
endmodule
