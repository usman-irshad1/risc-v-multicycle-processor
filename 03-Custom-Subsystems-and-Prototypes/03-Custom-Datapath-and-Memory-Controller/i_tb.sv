`timescale 1ns / 1ps

module tb_Instruction_memory;

    // --- Signals based on DUT port list (pc_width=5, r_width=5, immediate_len=12, etc.) ---
    logic [4:0] pc;
    logic [4:0] r1, r2, rd;
    logic [11:0] immediate;
    logic [5:0] opcode;
    logic [2:0] fun11;
    logic [6:0] fun21;
    
    // Test Control Signal
    integer cycles;

    Instruction_memory uut(
        .pc(pc),
        .r1(r1),
        .r2(r2),
        .rd(rd),
        .immediate(immediate),
        .opcode(opcode),
        .fun11(fun11),
        .fun21(fun21)
    );

    initial begin
        pc = 0;
        cycles = 0;
        
        forever begin
            #10;
            
            // Increment the PC
            pc = pc + 1; 
            
        
            if (pc == 19) begin
                pc = 0; // loop back to address 0
                cycles = cycles + 1;
            end
        end
    end

endmodule
