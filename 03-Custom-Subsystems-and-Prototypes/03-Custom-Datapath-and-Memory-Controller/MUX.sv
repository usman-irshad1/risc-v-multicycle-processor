`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2025 07:03:48 PM
// Design Name: 
// Module Name: MUX
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


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2025 07:03:06 PM
// Design Name: 
// Module Name: MUX
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


module MUX#(parameter ins_width = 32, opcode_width=7,  immediate_len=12)(
input logic [ins_width-1:0] data_from_reg2,
input logic [ins_width-1:0] immediate,
input logic [opcode_width-1:0] opcode,
output logic [ins_width-1:0] data2
    );
    always_comb
    begin
    if (opcode==7'b0010011)//this will bbe for the I type
    begin
    data2=immediate; //this is sign extending the immediate using the last bit
    end
    else 
    begin 
    data2=data_from_reg2;
    end
    end
endmodule
