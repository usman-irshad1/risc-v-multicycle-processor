`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2025 11:33:04 AM
// Design Name: 
// Module Name: Control_unit
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


module Control_unit#(parameter ins_width = 32, ins_depth=19, pc_width = 5, opcode_width=7, r_width=5, fun1=3, fun2=7, immediate_len=12)(
       input logic [opcode_width-1:0] opcode,
        output logic memread,
        output logic memwrite,
        output logic mem_to_reg,
        output logic regwrite,
        output logic ALU_source,
        output logic [1:0 ]ALU_op,
        output logic branch
        );
        
        always_comb
        begin
        if (opcode==7'b0110011)//r type
        begin
        memread=0;
        memwrite=0;
        mem_to_reg=0;
        regwrite=1;
        ALU_source=0;
        ALU_op=2'b10;
        branch=0;
        end
        end
        
endmodule
