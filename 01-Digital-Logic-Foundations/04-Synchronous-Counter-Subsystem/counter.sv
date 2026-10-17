`timescale 1ns / 1ps

module counter(
    input  logic clk,
    input  logic reset,
    input  logic enable,
    output logic [3:0] counter);

always_ff @(posedge clk) begin
    if (reset) begin
        counter <= 4'b0000;          
    end
    else if (enable) begin
        if (counter == 4'b1111)      
            counter <= 4'b0000;
        else
            counter <= counter + 1;
    end
end

endmodule
