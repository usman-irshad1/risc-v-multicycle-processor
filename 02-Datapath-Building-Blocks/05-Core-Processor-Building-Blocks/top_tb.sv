module top_tb;
  logic clock;
  logic reset;
  logic [1:0] pc;
  logic [1:0] opcode;
  logic [1:0] rd_adress;
  logic [1:0] r1_add;
  logic [1:0] r2_add;
  logic [15:0] r1_cont;
  logic [15:0] r2_cont;
  logic [15:0] r3_cont;
  logic enable;

  
  top dut (
    .clock(clock),
    .reset(reset),
    .pc(pc),
    .opcode(opcode),
    .rd_adress(rd_adress),
    .r1_add(r1_add),
    .r2_add(r2_add),
    .r1_cont(r1_cont),
    .r2_cont(r2_cont),
    .r3_cont(r3_cont),
    .enable(enable)
  );

  
  initial clock = 0;
  always #5 clock = ~clock;

  
  initial 
  begin
    reset =  1;
    #2
    reset=0;
    enable = 1;       
  end

endmodule
