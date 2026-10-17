`timescale 1ns / 1ps

module top_tb;

    // Parameters
    parameter ins_width     = 32;
    parameter ins_depth     = 19;
    parameter pc_width      = 5;
    parameter opcode_width  = 7;
    parameter r_width       = 5;
    parameter fun1          = 3;
    parameter fun2          = 7;
    parameter immediate_len = 12;

    // Testbench signals
    logic [pc_width-1:0]     pc;
    logic [r_width-1:0]      r1;
    logic [r_width-1:0]      r2;
    logic [r_width-1:0]      rd;
    logic [ins_width-1:0]    immediate_32;
    logic [opcode_width-1:0] opcode;
    logic [fun1-1:0]         fun11;
    logic [fun2-1:0]         fun21;
    logic [ins_width-1:0]    ins;
    logic [ins_width-1:0]    dataholder;
    logic [ins_width-1:0]    data1;
    logic [ins_width-1:0]    data2;
    logic                     clock;
    logic                     reset;
    logic                     enable;

    // Instantiate the top module
    top uut (
        .pc(pc),
        .r1(r1),
        .r2(r2),
        .rd(rd),
        .immediate_32(immediate_32),
        .opcode(opcode),
        .fun11(fun11),
        .fun21(fun21),
        .ins(ins),
        .dataholder(dataholder),
        .data1(data1),
        .data2(data2),
        .clock(clock),
        .reset(reset),
        .enable(enable)
    );

    // Clock generation: 10ns period
    initial clock = 0;
    always #5 clock = ~clock;

    // Simple test sequence
    initial begin
        // Initialize signals
        reset = 1;
        enable = 0;

        // Apply reset for a few cycles
        #20;
        reset = 0;
        enable = 1;

        // Let the simulation run for 200ns
        #200;

        // Finish simulation
        $finish;
    end

endmodule
