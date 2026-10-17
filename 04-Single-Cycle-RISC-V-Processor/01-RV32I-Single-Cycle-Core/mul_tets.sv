`timescale 1ns/1ps

module tb_alu_and_mult;

  // Inputs
  logic [1:0] ALU_op;
  logic [6:0] fun21;
  logic [2:0] fun11;
  logic [31:0] data1;
  logic [31:0] data2;

  // Outputs
  logic [3:0] ALU_control;
  logic [31:0] hi;
  logic [31:0] lo;

  // Internal
  logic [31:0] alu_result;

  // Instantiate alu_control
  alu_control alu_ctrl_inst(
    .ALU_op(ALU_op),
    .fun21(fun21),
    .fun11(fun11),
    .ALU_control(ALU_control)
  );

  // Instantiate multiplication_module
  multiplication_module mul_inst(
    .ALU_control(ALU_control),
    .data1(data1),
    .data2(data2),
    .hi(hi),
    .lo(lo),
    .fun11(fun11)
  );

  initial begin
    $display("=== Starting ALU control + multiplication Testbench ===");
    $display("Instr | data1 | data2 | ALU_ctrl | hi | lo ");

    // Test ADD
    ALU_op = 2'b10; fun21 = 7'b0000000; fun11 = 3'b000;
    data1 = 10; data2 = 5;
    #10;
    $display("ADD  | %0d | %0d | %04b | %0d | %0d", data1, data2, ALU_control, hi, lo);

    // Test SUB
    ALU_op = 2'b10; fun21 = 7'b0100000; fun11 = 3'b000;
    data1 = 20; data2 = 7;
    #10;
    $display("SUB  | %0d | %0d | %04b | %0d | %0d", data1, data2, ALU_control, hi, lo);

    // Test MUL
    ALU_op = 2'b10; fun21 = 7'b0000001; fun11 = 3'b000;
    data1 = 6; data2 = 7;
    #10;
    $display("MUL  | %0d | %0d | %04b | %0d | %0d", data1, data2, ALU_control, hi, lo);

    // Test MULH (signed)
    ALU_op = 2'b10; fun21 = 7'b0000001; fun11 = 3'b001;
    data1 = -6; data2 = 7;
    #10;
    $display("MULH | %0d | %0d | %04b | %0d | %0d", data1, data2, ALU_control, hi, lo);

    // Test DIV
    ALU_op = 2'b10; fun21 = 7'b0000001; fun11 = 3'b100;
    data1 = 20; data2 = 3;
    #10;
    $display("DIV  | %0d | %0d | %04b | %0d | %0d", data1, data2, ALU_control, hi, lo);

    // Test REM
    ALU_op = 2'b10; fun21 = 7'b0000001; fun11 = 3'b110;
    data1 = 20; data2 = 3;
    #10;
    $display("REM  | %0d | %0d | %04b | %0d | %0d", data1, data2, ALU_control, hi, lo);

    $display("=== Testbench Finished ===");
    $finish;
  end

endmodule
