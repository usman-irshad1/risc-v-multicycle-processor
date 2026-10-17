`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2025 06:51:28 PM
// Design Name: 
// Module Name: tb_div
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

module tb_div;

    // Inputs
    logic [1:0] ALU_op;
    logic [6:0] fun21; // funct7
    logic [2:0] fun11; // funct3

    // Output
    logic [3:0] ALU_control;

    // Instantiate your ALU Control
    alu_control alu_ctrl_inst(
        .ALU_op(ALU_op),
        .fun21(fun21),
        .fun11(fun11),
        .ALU_control(ALU_control)
    );

    initial begin
        $display("Time | ALU_op | funct7 | funct3 | ALU_control");

        // Test: R-type division
        ALU_op = 2'b10;        // R-type
        fun21   = 7'b0000001;  // MUL/DIV group
        fun11   = 3'b100;      // funct3 for DIV

        #10 $display("%0t | %b | %b | %b | %b", $time, ALU_op, fun21, fun11, ALU_control);

        // Test: R-type multiply (for comparison)
        fun11 = 3'b000; // MUL
        #10 $display("%0t | %b | %b | %b | %b", $time, ALU_op, fun21, fun11, ALU_control);

        $stop;
    end

endmodule

