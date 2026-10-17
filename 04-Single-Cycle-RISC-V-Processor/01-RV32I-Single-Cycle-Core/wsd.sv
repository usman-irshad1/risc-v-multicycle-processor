`timescale 1ns / 1ps

module multiplication_module_tb();
    logic clock;
    logic reset;
    logic [3:0] ALU_control;
    logic [31:0] data1, data2;
    logic [2:0] fun11;
    logic [31:0] hi, lo;
    logic mult_ready;

    // Instantiate your module
    multiplication_module #(.DATA_W(32)) dut (.*);

    // Clock generation
    initial clock = 0;
    always #5 clock = ~clock;

    initial begin
        // --- RESET ---
        reset = 1;
        ALU_control = 0;
        data1 = 0; data2 = 0; fun11 = 0;
        #20 reset = 0;

        // --- TEST 1: MULH (Signed -10 * 4) ---
        // Expected result: -40 (0xFFFFFFFFFFFFFFD8)
        // HI: 0xFFFFFFFF, LO: 0xFFFFFFD8
        #10;
        data1 = 32'hfffffff6; // -10
        data2 = 32'h00000004; // 4
        ALU_control = 4'b1000; // MUL
        fun11 = 3'b001;        // MULH (Signed)
        
        wait(mult_ready);
        $display("TEST MULH: HI=%h, LO=%h", hi, lo);
        if (hi == 32'hffffffff && lo == 32'hffffffd8) 
            $display("RESULT: SUCCESS");
        else 
            $display("RESULT: FAIL (Expected HI:ffffffff, LO:ffffffd8)");

        // --- TEST 2: REMU (10 % 4) ---
        // Expected result: 2
        #20;
        data1 = 32'd10;
        data2 = 32'd4;
        ALU_control = 4'b1001; // DIV/REM
        fun11 = 3'b111;        // REMU
        
        wait(mult_ready);
        $display("TEST REMU: LO=%d", lo);
        if (lo == 2) 
            $display("RESULT: SUCCESS");
        else 
            $display("RESULT: FAIL (Expected 2)");

        #50;
        $finish;
    end
endmodule