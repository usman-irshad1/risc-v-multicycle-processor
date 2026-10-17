`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2025 02:40:23 PM
// Design Name: 
// Module Name: program_counter
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


module program_counter #(parameter pcwidth=2)(
    output logic [pcwidth-1:0] pc,
    input  logic clock,
    input  logic reset
);

always_ff @(posedge clock or posedge reset) begin
    if (reset)
        pc <= 2'b00;   
    else
        pc <= pc + 1;  
end

endmodule

