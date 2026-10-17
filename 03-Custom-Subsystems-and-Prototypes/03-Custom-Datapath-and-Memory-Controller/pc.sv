module program_counter #(parameter pcwidth = 5) (
    output logic [pcwidth-1:0] pc,
    input  logic clock,
    input  logic reset,
    input  logic [pcwidth-1:0] next_pc // Input from mux_3
);

    
    always_ff @(posedge clock or posedge reset)
    begin
        if (reset)
            pc <= 5'b0;
        else
            pc <= next_pc; // Always load the value from the mux
    end

endmodule