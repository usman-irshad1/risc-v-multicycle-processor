`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2025 06:14:05 PM
// Design Name: 
// Module Name: reg_mem
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


 module reg_file #(parameter ins_width = 32, ins_depth=19, pc_width = 5, opcode_width=7, r_width=5, fun1=3, fun2=7, immediate_len=12)(
        input logic [r_width-1:0]  rd,
        input logic [r_width-1:0] r2,
        input logic [r_width-1:0] r1,
        input logic [ins_width-1:0] dataW,
        output logic [ins_width-1:0] data1,
        output logic [ins_width-1:0] data2,
        output logic [ins_width-1:0] datard,
        input logic clock,
        input logic regwrite

    );
    
    logic [ins_width -1 :0] regs [0:31];
    initial begin
    $readmemh("reg.mem", regs);
    end
    always_comb begin
    data1=regs[r1];
    data2=regs[r2];
    end
    
    always_ff @(posedge clock)
    if (regwrite == 1) 
    begin
    regs[rd]<=dataW;
    datard<=regs[rd];
    end
    
   
    
    endmodule
        
