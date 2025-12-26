`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.12.2025 14:50:36
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

reg  [3:0] number;
wire even_odd;

even_or_odd uut (
    .number(number),
    .even_odd(even_odd)
);

initial begin
    number = 0;
    repeat (16) begin
        #10;
        if (even_odd)
            $display("%0t : %d is EVEN", $time, number);
        else
            $display("%0t : %d is ODD", $time, number);
        number = number + 1;
    end
    $finish;
end

endmodule

