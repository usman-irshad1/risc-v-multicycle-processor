module pc_reg #(
    parameter pc_width = 32
)(
    input logic [pc_width-1:0] next_pc,
    input logic clock,
    input logic reset,
    input logic PC_write,
    output logic [pc_width-1:0] pc
);

    always_ff @(posedge clock) begin
        if (reset) begin
            pc <= {pc_width{1'b0}};  // reset to 0
        end
        else if (PC_write) begin
            pc <= next_pc;           // update PC
        end
    end

endmodule
