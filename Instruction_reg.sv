`timescale 1ns / 1ps

module Instruction_reg#(
    parameter ins_width = 32
)(
    input logic [ins_width-1:0] old_pc,
    input logic [ins_width-1:0] instruction,
    input logic clock,
    input logic reset,
    input logic ins_write,
    output logic [ins_width-1:0] old_pc_output,
    output logic [ins_width-1:0] old_instruction
);

    logic [ins_width-1:0] pc_store, ins_store;
    
always_ff @(posedge clock or posedge reset) 
begin
        if (reset) begin
            pc_store <= {ins_width{1'b0}};
            ins_store <= {ins_width{1'b0}};
        end
        else 
        begin
            pc_store <= old_pc;             
            if (ins_write)
                ins_store <= instruction;   
        end
    end

    
    assign old_pc_output = pc_store;
    assign old_instruction = ins_store;

endmodule
