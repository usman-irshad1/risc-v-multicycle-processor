`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2025 11:33:04 AM
// Design Name: 
// Module Name: Control_unit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Control_unit#(parameter ins_width = 32, ins_depth=19, pc_width = 32, opcode_width=7, r_width=5, fun1=3, fun2=7, immediate_len=12)(
        input logic [opcode_width-1:0] opcode,
        input logic [fun2-1:0] fun21, // funct7
        input logic [fun1-1:0] fun11, // funct3
        input logic clock,
        input logic reset,
        input logic zero,
        output logic regwrite,
        output logic [1:0 ]ALU_op,
        output logic [1:0] Alu_source_1,
        output logic [1:0] Alu_source_2,
        output logic [1:0] Alu_result,
        output logic PC_write ,
        output logic ins_write,
        output logic adress_source,
        output logic memwrite,
        output logic pc_update,
        output logic branch
        

        );
        
        typedef enum logic [4:0] {
        fetch,
        decode,
        mem_read,
        mem_write,
        mem_adress,
        exec_r,
        exec_i,
        alu_wb,
        beq,
        jal,
        mem_to_reg,
        beq_last
        }state_t; 
        
        state_t state, next; 
        
        always_comb begin
        // default outputs
        ins_write = 0;
        adress_source = 0;
        regwrite = 0;
        memwrite = 0;
        ALU_op = 2'b00;
        Alu_source_1 = 2'b00;
        Alu_source_2 = 2'b00;
        Alu_result = 2'b00;
        PC_write = 0;
        pc_update=0;
        branch=0;

    
    case(state)
        fetch: 
        begin
            ins_write = 1;
            adress_source = 0;
            Alu_result=2'b10;
            Alu_source_1 =2'b00 ;
            Alu_source_2  =2'b10 ;
            pc_update=1;  
            ALU_op=2'b00; 
            PC_write=1;
            
        end
        decode: 
        begin
            // NEW: Use ALU to calculate PC + imm for branches
            ALU_op = 2'b00;       // ADD
            Alu_source_1 = 2'b01; // PC
            Alu_source_2 = 2'b10; // immediate
        end
        
        mem_adress:
        begin
            ALU_op=2'b00;
            Alu_source_1 =2'b10 ;
            Alu_source_2  =2'b01 ;
            Alu_result=2'b00;
        end
        mem_read:
        begin
            Alu_result=2'b00;
            adress_source=1;
        end
        exec_r:
        begin
            Alu_result=2'b00;
            ALU_op=2'b10;
            Alu_source_1 =2'b10;
            Alu_source_2  =2'b00;
        end
        exec_i:
        begin
            Alu_result=2'b00;
            ALU_op=2'b10;
            Alu_source_1 =2'b10;
            Alu_source_2  =2'b01;
            
        end
        jal:
        begin
            // 1. Calculate jump target (PC + imm)
            ALU_op = 2'b10;
            Alu_source_1 = 2'b01; 
            Alu_source_2 = 2'b10;
            
            // 2. Update PC with the ALU's result (FIXED)
            pc_update = 1;
            PC_write = 1; 
            
            // 3. Write PC+4 (from fetch) into rd (FIXED)
            regwrite = 1;
            Alu_result = 2'b10; // Assumes 2'b10 selects 'stored PC+4'
        
        end
        
        beq: // This is the COMPARE state
        begin
            Alu_result=2'b00;
            ALU_op=2'b01;       // Do the compare (subtract)
            Alu_source_1 =2'b10; // RegA
            Alu_source_2  =2'b00; // RegB
            branch = 1;         // NEW: Tell Alu_result_reg to FREEZE
        end
        
        alu_wb:
        begin
            Alu_result=2'b00;
            regwrite=1;
        end
        
        mem_to_reg:
        begin
            Alu_result=2'b01;
            regwrite=1;
        end
        
        mem_write:
        begin
            adress_source=1;
            memwrite=1;
        end
        
        beq_last: // This is the BRANCH state
        begin
            // NOW the 'zero' flag is stable and correct.
            if (zero == 1)
            begin
                // NEW: Branch is taken. Tell PC to load
                // the value from Alu_result_reg.
                PC_write = 1; 
                pc_update = 1; // Assumes pc_update=1 selects Alu_result_reg
                
                // The ALU is not used in this state!
            end
            // else: Branch not taken. All signals are default 0.
        end
    endcase
    
end

    
    
    always_ff @(posedge clock or posedge reset)
    begin
    if (reset)
    begin
    state<=fetch;
    end
    else 
    begin
    state<=next;
    end
    end
    
    
    always_comb 
    
    begin
    case(state)
    fetch://////////////////////////////////////
    begin
    next=decode;
    end
    decode:////////////////////////////////////////////////////
    begin
    case(opcode)
    7'b0110011: 
    next=exec_r;
    7'b0010011: 
    next=exec_i;
    7'b0000011:
    next=mem_adress;
    7'b0100011:
    next=mem_adress;
    7'b1101111:
    next=jal;
    7'b1100011:
    next=beq;
    endcase
    end
    /////////////////////////////////////////////////////////////
    mem_adress:
    begin
    case(opcode)
    7'b0000011:
    next=mem_read;
    7'b0100011:
    next=mem_write;
    endcase
    end
    ////////////////////////////////////////////////////////////
    mem_read:
    begin
    case(opcode)
    7'b0000011:
    next=mem_to_reg;
    endcase
    end
    /////////////////////////////////////////////////////////
    mem_write:
    begin
    next=fetch;
    end
    
    ///////////////////////////////////////////////////////////////////
    exec_r:
    begin
    next=alu_wb;
    end
    
    /////////////////////
    exec_i:
    begin
    next=alu_wb;
    end
    /////////////////////
    jal:
    begin
    next=fetch; // FIXED: Was alu_wb
    end
    /////////////////////
    alu_wb:
    begin
    next=fetch; // FIXED: Was alu_wb
    end
    
    /////////////////////
    beq:
    begin
    next=beq_last;
    end
    
    mem_to_reg:
    begin
    next=fetch;
    end
    
    beq_last:
    begin
    next=fetch;
    end
    endcase
    end
    
    
endmodule