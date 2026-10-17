module reg_file #(
    parameter ins_width = 32, 
    ins_depth=19, 
    pc_width = 5, 
    opcode_width=7, 
    r_width=5, 
    fun1=3, 
    fun2=7, 
    immediate_len=12
)(
    input logic [r_width-1:0]  rd,
    input logic [r_width-1:0]  r2,
    input logic [r_width-1:0]  r1,
    input logic [3:0 ]         ALU_control,
    input logic [ins_width-1:0] hi,
    input logic [ins_width-1:0] lo,
    input logic [ins_width-1:0] dataW,
    output logic [ins_width-1:0] data1,
    output logic [ins_width-1:0] data2,
    input logic clock,
    input logic regwrite
);

    logic [ins_width -1 :0] regs [0:31];
    
    initial begin
        $readmemh("reg.mem", regs);
    end
    
    
    // Combinational Read Logic with fix for simulator bug
    always_comb begin
        
        // --- Handle r1 port ---
        if (r1 == 5'b00000)
            data1 = 32'b0;
        else
            data1 = regs[r1];
            
        // --- Handle r2 port ---
        // If r2 is the same as r1, just copy data1.
        // This avoids the (r1==r2) simulator bug.
        if (r2 == r1)
            data2 = data1; 
        else if (r2 == 5'b00000)
            data2 = 32'b0;
        else
            data2 = regs[r2];
    end
    
    // Sequential Write Logic (with x0 protection)
    always_ff @(posedge clock) begin
        
        if (regwrite && (rd != 5'b00000)) begin
            regs[rd] = dataW;  // Use blocking '=' for simulation
        end
    end
    
endmodule