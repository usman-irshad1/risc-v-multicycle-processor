`timescale 1ns / 1ps
module Unified_Memory#(
    parameter ins_width = 32,
    parameter mem_size = 4096, 
    parameter pc_width = 32, 
    parameter opcode_width = 7, 
    parameter r_width = 5, 
    parameter fun1 = 3, 
    parameter fun2 = 7, 
    parameter immediate_len = 12
)(
    input logic clock,
    input logic [pc_width-1:0] pc_byte_address, 
    output logic [r_width-1:0] r1_out, 
    output logic [r_width-1:0] r2_out,
    output logic [r_width-1:0] rd_out,
    output logic [ins_width-1:0] ins_out,
    output logic [opcode_width-1:0] opcode_out,
    output logic [fun1-1:0] fun11_out,
    output logic [fun2-1:0] fun21_out,

    
    input logic memread,
    input logic memwrite,
    input logic [ins_width-1:0] data_address,
    input logic [ins_width-1:0] data_write,    
    output logic [ins_width-1:0] data_read      
);

    
    logic [ins_width-1:0] memory [0:mem_size-1];

    
    logic [9:0] ins_word_index;
    logic [9:0] data_word_index;

    assign ins_word_index = pc_byte_address[11:2];
    assign data_word_index = data_address[11:2];
    
    initial begin
        $readmemh("unified_memory.mem", memory); 
    end

    always_comb
    begin
        logic [ins_width-1:0] current_ins;
        current_ins = memory[ins_word_index];
        
        opcode_out = current_ins[6:0];
        r1_out = current_ins[19:15];
        r2_out = current_ins[24:20];
        rd_out = current_ins[11:7];
        fun11_out = current_ins[14:12];
        fun21_out = current_ins[31:25];
        ins_out = current_ins;
    end

    
    always_comb
    begin
        if (memread) begin 
            data_read = memory[data_word_index]; 
        end
    end

    always_ff @(posedge clock)
    begin
        if (memwrite) begin 
            memory[data_word_index] <= data_write; 
        end
    end

endmodule