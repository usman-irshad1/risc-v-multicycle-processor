module ALU #(
    parameter ins_width = 32,
    parameter opcode_width = 7,
    parameter fun1 = 3,
    parameter fun2 = 7
)(
    input  logic [opcode_width-1:0] opcode,
    input  logic [fun1-1:0] fun11,
    input  logic [fun2-1:0] fun21,
    input  logic [ins_width-1:0] data1,
    input  logic [ins_width-1:0] data2,
    output logic signed [ins_width-1:0] dataW, // declare signed
    output logic enable
);

always_comb begin
    dataW = 0;

    case (opcode)
        7'b0010011: begin 
            case (fun11)
                3'b000: dataW = $signed(data1) + $signed(data2);
                3'b001: dataW = data1 << data2;
                3'b010: dataW = ($signed(data1) < $signed(data2));
                3'b011: dataW = (data1 < data2);
                3'b100: dataW = data1 ^ data2;
                3'b101: begin
                    if (fun21 == 7'b0000000)
                        dataW = data1 >> data2;
                    else
                        dataW = data1 >>> data2;
                end
                3'b110: dataW = data1 | data2;
                3'b111: dataW = data1 & data2;
            endcase
        end

        7'b0110011: begin
            case (fun11)
                3'b000: begin
                    if (fun21 == 7'b0000000)
                        dataW = $signed(data1) + $signed(data2);
                    else if (fun21 == 7'b0100000)
                        dataW = $signed(data1) - $signed(data2); 
                end
                3'b001: dataW = data1 << data2;
                3'b010: dataW = (data1 < data2);
                3'b011: dataW = (data1 < data2);
                3'b100: dataW = data1 ^ data2;
                3'b101: begin
                    if (fun21 == 7'b0000000)
                        dataW = data1 >> data2;
                    else
                        dataW = data1 >>> data2;
                end
                3'b110: dataW = data1 | data2;
                3'b111: dataW = data1 & data2;
            endcase
        end
    endcase
end

assign enable = 1;
endmodule
