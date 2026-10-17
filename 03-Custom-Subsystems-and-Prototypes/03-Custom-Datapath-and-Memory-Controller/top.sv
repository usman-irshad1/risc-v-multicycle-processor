`timescale 1ns / 1ps

module top#(
    parameter ins_width     = 32,
    parameter ins_depth     = 19,
    parameter pc_width      = 5,
    parameter opcode_width  = 7,
    parameter r_width       = 5,
    parameter fun1          = 3,
    parameter fun2          = 7,
    parameter immediate_len = 12
)(
    output logic [pc_width-1:0]     pc,
    output logic [r_width-1:0]      r1,
    output logic [r_width-1:0]      r2,
    output logic [r_width-1:0]      rd,
    output logic [ins_width-1:0]    immediate_32,
    output logic [opcode_width-1:0] opcode,
    output logic [fun1-1:0]         fun11,
    output logic [fun2-1:0]         fun21,
    output logic [ins_width-1:0]    ins,
    output logic [ins_width-1:0]    dataholder,
    output logic [ins_width-1:0]    data1,
    output logic [ins_width-1:0]    data2,
    input  logic                    clock,
    input  logic                    reset,
    output logic                    enable
);

    // --- Internal Wires for the Datapath ---
    logic [ins_width-1:0] data_mem_out; // Data from memory for loads
    logic [ins_width-1:0] alu_result;   // Output of the ALU
    logic [ins_width-1:0] wb_data;      // **FIX**: Final data to be written back to the register file

    // --- Module Instantiations ---
    program_counter  pc_inst(
        .pc(pc),
        .clock(clock),
        .reset(reset)
    );

    Instruction_memory mem_inst(
        .pc(pc),
        .r1(r1),
        .r2(r2),
        .rd(rd),
        .ins(ins),
        .opcode(opcode),
        .fun11(fun11),
        .fun21(fun21)
    );

    // **FIX**: The register file's write-data port (.dataW) now correctly
    // receives its data from the output of the write-back MUX.
    reg_file regfolder_inst (
        .r1(r1),
        .r2(r2),
        .rd(rd),
        .dataW(wb_data),
        .data1(data1),
        .data2(dataholder),
        .enable(enable),
        .clock(clock)
    );

    immediate_gen im_inst(
        .ins(ins),
        .immediate(immediate_32)
    );

    MUX mux_inst(
        .data_from_reg2(dataholder),
        .immediate(immediate_32),
        .opcode(opcode),
        .data2(data2)
    );

    // **FIX**: The ALU's output drives the 'alu_result' wire.
    ALU alu_inst(
        .opcode(opcode),
        .fun11(fun11),
        .fun21(fun21),
        .dataW(alu_result),
        .data1(data1),
        .data2(data2),
        .enable(enable)
    );

    data_mem dmem_inst(
        .opcode(opcode),
        .immediate(immediate_32),
        .rd(data_mem_out),
        .r1(data1),
        .r2(dataholder),
        .clock(clock)
    );

    // **FIX**: The WB_MUX correctly takes the ALU output ('alu_result') as an input
    // and drives the final write-back data wire ('wb_data').
    WB_MUX wb_mux_inst(
        .alu_data(alu_result),
        .mem_data(data_mem_out),
        .wb_data(wb_data),
        .opcode(opcode)
    );

endmodule