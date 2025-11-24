`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.11.2025 20:37:17
// Design Name: 
// Module Name: testbench
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

module testbench;

reg  [3:0] data_in;
reg  [1:0] shift;
reg        dire;
wire [3:0] data_out;

barrel_shift_reg uut(
    .data_in(data_in),
    .shift(shift),
    .dire(dire),
    .data_out(data_out)
);

initial begin
    $monitor("time=%0t data=%b shift=%d dire=%b out=%b",
              $time, data_in, shift, dire, data_out);

    data_in = 4'b1101;

    // Left shifts
    dire = 0;
    shift = 0; #10;
    shift = 1; #10;
    shift = 2; #10;
    shift = 3; #10;

    // Right shifts
    dire = 1;
    shift = 1; #10;
    shift = 2; #10;
    shift = 3; #10;

    $finish;
end

endmodule

