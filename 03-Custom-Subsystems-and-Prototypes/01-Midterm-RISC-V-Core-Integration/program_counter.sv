module program_counter #(parameter pcwidth = 5) (
    output logic [pcwidth-1:0] pc,
    input  logic clock,
    input  logic reset
);

    logic [pcwidth-1:0] next_pc;

    always_ff @(posedge clock or posedge reset) begin
        if (reset)
            pc <= 5'b0;
        else if (pc == 5'b10001)
            pc <= 5'd0;        
        else
            pc <= pc + 1'b1;   
    end

endmodule
