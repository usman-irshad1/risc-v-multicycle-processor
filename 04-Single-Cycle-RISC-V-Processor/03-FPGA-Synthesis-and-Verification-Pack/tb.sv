`timescale 1ns / 1ps

module tb_top_processor;

    // Testbench signals
    logic clock;
    logic reset;

    // Outputs from top_processor
    logic [31:0] alu_result;
    logic [31:0] mul_lo;
    logic [31:0] old_pc;
    logic [31:0] old_instruction;
    logic [31:0] data1;
    logic [31:0] data2;
    logic [4:0] r1;
    logic [4:0] r2;
    logic [4:0] rd;

    // Instantiate the DUT (Device Under Test)
    top_processor uut (
        .clock(clock),
        .reset(reset),
        .alu_result(alu_result),
        .mul_lo(mul_lo),
        .old_pc(old_pc),
        .old_instruction(old_instruction),
        .data1(data1),
        .data2(data2),
        .r1(r1),
        .r2(r2),
        .rd(rd)
    );

    // Clock generation: 10ns period
    initial begin
        clock = 0;
        forever #10 clock = ~clock; // 50 MHz
    end

    // Test sequence
    initial begin
        // Apply reset
        reset = 1;
        #20;         // hold reset for 20 ns
        reset = 0;

        // Let the processor run for some time
        #20000;

        // End simulation
        $finish;
    end

    // Monitor all outputs
    initial begin
        $display("Time\tPC\tInstr\tALU_Result\tMul_LO\tData1\tData2\tR1\tR2\tRD");
        $monitor("%0t\t%h\t%h\t%h\t%h\t%h\t%h\t%h\t%h\t%h",
                 $time, old_pc, old_instruction, alu_result, mul_lo,
                 data1, data2, r1, r2, rd);
    end

endmodule
