`timescale 1ns / 1ps
module ALU_tb;

    logic [5:0] opcode;
    logic [2:0] fun11;
    logic [6:0] fun21;
    logic signed [31:0] data1;
    logic signed [31:0] data2;
    logic signed [31:0] dataW;

    ALU uut (
        .opcode(opcode),
        .fun11(fun11),
        .fun21(fun21),
        .data1(data1),
        .data2(data2),
        .dataW(dataW)
    );

    initial begin
        // -----------------------
        // I-type instructions
        // -----------------------
        opcode = 6'b010011;

        // ADDI
        data1 = 10; data2 = 5; fun11 = 3'b000; fun21 = 7'b0000000; #10;

        // SLLI
        data1 = 3; data2 = 2; fun11 = 3'b001; fun21 = 7'b0000000; #10;

        // SLTI
        data1 = -2; data2 = 3; fun11 = 3'b010; fun21 = 7'b0000000; #10;

        // SLTIU
        data1 = 2; data2 = 3; fun11 = 3'b011; fun21 = 7'b0000000; #10;

        // XORI
        data1 = 6; data2 = 3; fun11 = 3'b100; fun21 = 7'b0000000; #10;

        // SRLI
        data1 = -16; data2 = 2; fun11 = 3'b101; fun21 = 7'b0000000; #10;

        // SRAI
        data1 = -16; data2 = 2; fun11 = 3'b101; fun21 = 7'b0100000; #10;

        // ORI
        data1 = 5; data2 = 2; fun11 = 3'b110; fun21 = 7'b0000000; #10;

        // ANDI
        data1 = 5; data2 = 3; fun11 = 3'b111; fun21 = 7'b0000000; #10;

        // -----------------------
        // R-type instructions
        // -----------------------
        opcode = 6'b110011;

        // ADD
        data1 = 10; data2 = 5; fun11 = 3'b000; fun21 = 7'b0000000; #10;

        // SUB
        data1 = 10; data2 = 5; fun11 = 3'b000; fun21 = 7'b0100000; #10;

        // SLL
        data1 = 3; data2 = 2; fun11 = 3'b001; fun21 = 7'b0000000; #10;

        // SLT
        data1 = -2; data2 = 3; fun11 = 3'b010; fun21 = 7'b0000000; #10;

        // SLTU
        data1 = 2; data2 = 3; fun11 = 3'b011; fun21 = 7'b0000000; #10;

        // XOR
        data1 = 6; data2 = 3; fun11 = 3'b100; fun21 = 7'b0000000; #10;

        // SRL
        data1 = 16; data2 = 2; fun11 = 3'b101; fun21 = 7'b0000000; #10;

        // SRA
        data1 = -16; data2 = 2; fun11 = 3'b101; fun21 = 7'b0100000; #10;

        // OR
        data1 = 5; data2 = 2; fun11 = 3'b110; fun21 = 7'b0000000; #10;

        // AND
        data1 = 5; data2 = 3; fun11 = 3'b111; fun21 = 7'b0000000; #10;

        #10;
        $finish;
    end

endmodule
