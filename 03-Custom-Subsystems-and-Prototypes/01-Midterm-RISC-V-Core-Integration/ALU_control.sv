

module alu_control#(parameter ins_width = 32, ins_depth=19, pc_width = 5, opcode_width=7, r_width=5, fun1=3, fun2=7, immediate_len=12)( 
input logic [1:0 ]ALU_op,
input logic fun21,
input logic [fun1-1:0] fun11,
output logic [3:0] ALU_control);

always_comb 
begin
case (ALU_op)
2'b00:
begin
ALU_control=4'b0010;
end

2'b10:
    begin
    if (fun11 == 3'b111 && fun21 == 1'b0)//and
    begin
    ALU_control=4'b0000;
    end
    else if (fun11 == 3'b110 && fun21 == 1'b0)//or
    begin
     ALU_control=4'b0001;
    end
     else if (fun11 == 3'b000 && fun21 == 1'b0)//add
    begin
     ALU_control=4'b0010;
    end
     else if (fun11 == 3'b000 && fun21 == 1'b1)//sub
    begin
     ALU_control=4'b0110;
    end
    else if (fun11 == 3'b001 && fun21==1'b0) //shit ll
    begin
    ALU_control=4'b0100;
    end
    else if (fun11 == 3'b101) //srl
    begin
    ALU_control=4'b0101;
    end 
    else if (fun11 == 3'b010 && fun21==1'b0) //slt
    begin
    ALU_control=4'b0011;
    end
    else if (fun11 == 3'b100 && fun21 == 1'b0) //xor
    begin
     ALU_control=4'b0111;
    end
     else if (fun11 == 3'b000 ) //beq
    begin
     ALU_control=4'b0110;
    end
end

endcase
end

endmodule
