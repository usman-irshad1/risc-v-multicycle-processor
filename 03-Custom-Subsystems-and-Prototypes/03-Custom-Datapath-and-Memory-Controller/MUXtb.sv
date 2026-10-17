`timescale 1ns / 1ps

module MUX_tb;

    logic [31:0] data_from_reg2;
    logic [11:0] immediate;
    logic [5:0] opcode;
    logic [31:0] data2;

    // Instantiate the module
    MUX uut (
        .data_from_reg2(data_from_reg2),
        .immediate(immediate),
        .opcode(opcode),
        .data2(data2)
    );

    initial begin
        // Case 1: Not I-type ? should output data_from_reg2
        data_from_reg2 = 32'hAAAAAAAA;
        immediate = 12'b000000001111;
        opcode = 6'b000000;   // not I-type
        #10;
        $display("Case 1: data2 = %h", data2);

        // Case 2: I-type with negative immediate
        opcode = 6'b010011;   // I-type
        immediate = 12'b100000001111;
        #10;
        $display("Case 2: data2 = %h", data2);

        // Case 3: I-type with positive immediate
        immediate = 12'b000000001111;
        #10;
        $display("Case 3: data2 = %h", data2);

        $finish;
    end

endmodule
