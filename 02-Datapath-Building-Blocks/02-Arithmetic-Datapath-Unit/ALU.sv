`timescale 1ns / 1ps

module ALU#(
    parameter opcode_size = 4,
    parameter width       = 32,
    parameter f_width     = 7
)(
    input  logic [opcode_size-1:0] opcode,
    input  logic [f_width-1:0]     function,
    input  logic [width-1:0]       r1,
    input  logic [width-1:0]       r2,
    output logic [width-1:0]       r3
);

always_comb begin
    case (opcode)

        // R-type operations
        2'b00: begin
            case (function)
                7'b0000000: r3 = r1 + r2;          // ADD
                7'b0000001: r3 = r1 - r2;          // SUB
                7'b0000010: r3 = r1 | r2;          // OR
                7'b0000011: r3 = r1 & r2;          // AND
                7'b0000101: r3 = ~(r1 | r2);       // NOR
                7'b0010010: r3 = ~(r1 & r2);       // NAND
                default:    r3 = '0;
            endcase
        end

        // Arithmetic ops (MUL/DIV etc.)
        2'b01: begin
            case (function)
                7'b0000000: r3 = r1 * r2;          // MUL
                7'b0000001: r3 = r1 / r2;          /
                default:    r3 = '0;
            endcase
        end

        default: r3 = '0;

    endcase
end

endmodule
