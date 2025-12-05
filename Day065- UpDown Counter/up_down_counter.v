`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.12.2025 10:57:22
// Design Name: 
// Module Name: up_down_counter
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

module up_down_counter
  #(parameter N = 4)
  (
    input clk,
    input reset,
    input upordown,
    output reg [N-1:0] count
  );

  localparam MAX_COUNT = (1 << N) - 1;   

  always @(posedge clk) begin
    if (reset)
      count <= 0;

    else if (upordown) begin                     
      if (count == MAX_COUNT)
        count <= 0;
      else
        count <= count + 1;
    end

    else begin                                    
      if (count == 0)
        count <= MAX_COUNT;
      else
        count <= count - 1;
    end
  end
endmodule
