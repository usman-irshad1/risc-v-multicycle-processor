module WB_MUX #(
    parameter DATA_W = 32
)(
    input logic [DATA_W-1:0] alu_data,
    input logic [DATA_W-1:0] mem_data,
    output logic [DATA_W-1:0] wb_data,
    input logic [6:0] opcode
);

always_comb begin
    if (opcode==7'b0000011)
        wb_data = mem_data;
    else
        wb_data = alu_data;
end

endmodule
