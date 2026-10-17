`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2025 11:55:13 AM
// Design Name: 
// Module Name: t_b
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module tb_counter;

    // Testbench signals
    logic clk;
    logic reset;
    logic enable;
    logic [3:0] counter;

    // Instantiate the counter module
    counter uut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .counter(counter)
    );

    // Clock generation: 10ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;   
    end

    // Stimulus
    initial begin
        // Initialize signals
        reset = 1;
        enable = 0;

        // Apply reset for 2 cycles
        #12 reset = 0;

        // Enable counting
        enable = 1;
        #200;   // let it count for some time

        // Disable counting
        enable = 0;
        #50;

        // Re-enable counting
        enable = 1;
        #100;

     

        // Let it run more
        #100;

        // Finish simulation

    end

endmodule
