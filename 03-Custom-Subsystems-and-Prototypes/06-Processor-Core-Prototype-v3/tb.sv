`timescale 1ns / 1ps

module top_tb;

    logic clock;
    logic reset;

    // Outputs from DUT
    logic [31:0] pc;
    logic [4:0]  r1;
    logic [4:0]  r2;
    logic [4:0]  rd;
    logic [31:0] ins;
    logic [31:0] data1;
    logic [31:0] data2;
    logic [31:0] immediate_32;
    logic [6:0]  opcode;
    logic [2:0]  fun11;
    logic [6:0]  fun21;
    logic [31:0] wb_data;
    logic        zero;
    logic        memread;
    logic        memwrite;
    logic        mem_to_reg;
    logic        regwrite;
    logic        ALU_source;
    logic [1:0]  ALU_op;
    logic [3:0]  ALU_control;
    logic        branch;
    logic [31:0] hi;
    logic [31:0] lo;

    // Instantiate DUT
    top dut (
        .clock(clock),
        .reset(reset),

        .pc(pc),
        .r1(r1), .r2(r2), .rd(rd),
        .ins(ins),
        .data1(data1),
        .data2(data2),
        .immediate_32(immediate_32),
        .opcode(opcode),
        .fun11(fun11),
        .fun21(fun21),
        .wb_data(wb_data),
        .zero(zero),
        .memread(memread),
        .memwrite(memwrite),
        .mem_to_reg(mem_to_reg),
        .regwrite(regwrite),
        .ALU_source(ALU_source),
        .ALU_op(ALU_op),
        .ALU_control(ALU_control),
        .branch(branch),
        .hi(hi),
        .lo(lo)
    );

    // Clock generator (10ns period)
    always #5 clock = ~clock;

    initial begin
        // Initialize
        clock = 0;
        reset = 1;
      
        #20;
        reset = 0;

        // Let program run for 200ns
        #200;

        $display("Simulation Finished");
        $stop;
    end

endmodule
