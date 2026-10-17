`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2025 11:24:30 AM
// Design Name: 
// Module Name: pc_immediate
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


module pc_immediate#(parameter pc_adress=5,  parameter ins_width = 32 )(
input logic [pc_adress-1:0] pc_1,
output logic [pc_adress-1:0] pc_i,
input logic [ins_width-1:0] dataW
  );
  
  always_comb
  begin
  pc_i=pc_1+dataW[pc_adress-1:0];
  end
endmodule
