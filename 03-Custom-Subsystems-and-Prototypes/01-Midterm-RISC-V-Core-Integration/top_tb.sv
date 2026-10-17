module top_tb;
logic clock,reset;
logic [4:0] pc,r1,r2,rd;
logic [31:0] ins,data1,data2,wb_data,datard;
logic [6:0] opcode,fun21;
logic [2:0] fun11;
logic memread,memwrite,mem_to_reg,regwrite,ALU_source,branch;
logic [1:0] ALU_op;
logic [3:0] ALU_control;

top dut(.clock(clock),.reset(reset),.pc(pc),.r1(r1),.r2(r2),.rd(rd),.ins(ins),.data1(data1),.data2(data2),
.opcode(opcode),.fun11(fun11),.fun21(fun21),.wb_data(wb_data),
.memread(memread),.memwrite(memwrite),.mem_to_reg(mem_to_reg),
.regwrite(regwrite),.ALU_source(ALU_source),.ALU_op(ALU_op),.datard(datard),
.ALU_control(ALU_control),.branch(branch));

initial begin
clock=0;
forever #5 clock=~clock;
end

initial begin
reset=1;
#10 reset=0;
#200 $stop;
end
endmodule
