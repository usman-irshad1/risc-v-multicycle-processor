module multiplication_module #(
    parameter ins_width = 32
)(
    input  logic [3:0]  ALU_control,
    input  logic [ins_width-1:0] data1,
    input  logic [ins_width-1:0] data2,
    output logic [ins_width-1:0] hi,
    output logic [ins_width-1:0] lo,
    input  logic [2:0]  fun11
);

logic [63:0] result;
logic [63:0] result_s;
logic multiply_enable;

always_comb begin
    multiply_enable = (ALU_control == 4'b1000 |

| ALU_control == 4'b1001);
end

always_comb begin
    hi = 0;
    lo = 0;  // <-- THIS IS THE CRITICAL LINE. Make sure it's not data1.

    if (multiply_enable) begin
        case (fun11)  // use only funct3 for RISC-V M-extension
            3'b000: begin    // MUL
                result = data1 * data2;
                hi = result[63:32];
                lo = result[31:0];
            end
            3'b001: begin    // MULH
                result_s = $signed(data1) * $signed(data2);
                hi = result_s[63:32];
                lo = result_s[31:0];
            end
            3'b010: begin    // MULHSU
                result_s = $signed(data1) * data2;
                hi = result_s[63:32];
                lo = result_s[31:0];
            end
            3'b011: begin    // MULHU
                result = data1 * data2;
                hi = result[63:32];
                lo = result[31:0];
            end
            3'b100: begin    // DIV
                if (data2!= 0) begin
                    lo = $signed(data1) / $signed(data2);
                    hi = $signed(data1) % $signed(data2);
                end
                else begin
                    lo = -1;
                    hi = data1;
                end
            end
            3'b101: begin    // DIVU
                if (data2!= 0) begin
                    lo = data1 / data2;
                    hi = data1 % data2;
                end
                else begin
                    lo = {32{1'b1}};
                    hi = data1;
                end
            end
            3'b110: begin    // REM
                if (data2!= 0) begin
                    lo = $signed(data1) % $signed(data2);
                end
                else begin
                    lo = data1;
                end
                hi = 0;
            end
            3'b111: begin    // REMU
                if (data2!= 0) begin
                    lo = data1 % data2;
                end
                else begin
                    lo = data1;
                end
                hi = 0;
            end
        endcase
    end
end

endmodule