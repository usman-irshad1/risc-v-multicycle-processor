`timescale 1ns / 1ps

module Alu_result_reg#(
    parameter ins_width = 32,
    parameter opcode_width = 7
)(
    input logic [ins_width-1:0] alu_result,
    input logic clock,
    input logic reset,
    input logic [opcode_width-1:0] opcode,
    output logic [ins_width-1:0] stored_result_alu,
    input branch
);

    logic [ins_width-1:0] holder;

    always_ff @(posedge clock or posedge reset) begin
        if (reset)
            holder <= 32'b0;
        else if (opcode == 7'b1100011 && branch==1'b1)
            holder <= holder;
        else
            holder <= alu_result;
    end

    assign stored_result_alu = holder;

endmodule
