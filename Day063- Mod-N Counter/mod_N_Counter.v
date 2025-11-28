`timescale 1ns / 1ps

module mod_N_Counter
#(parameter N=6,
  parameter Length=3)
(
    input clk,
    input reset,
    output reg [Length-1:0] counter
);

always @(posedge clk) begin
    if (reset)
        counter <= 0;
    else if (counter == N-1)
        counter <= 0;
    else
        counter <= counter + 1;
end

endmodule
