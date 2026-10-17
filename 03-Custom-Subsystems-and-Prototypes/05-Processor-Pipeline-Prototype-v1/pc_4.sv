`timescale 1ns / 1ps

module pc_adder#(parameter ins_width=32)(
input logic [ins_width-1:0] pc,
output logic [ins_width-1:0] pc_4
    );
    
    always_comb
    begin
    pc_4=pc+32'd4;
    end
endmodule
