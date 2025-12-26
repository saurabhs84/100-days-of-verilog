`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.12.2025 15:12:23
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

reg  [7:0] number;
wire is_prime;

prime_or_notprime uut (.number(number), .is_prime(is_prime));

initial begin
    for (number = 0; number < 20; number = number + 1) begin
        #10;
        if (is_prime)
            $display("%d is PRIME", number);
        else
            $display("%d is NOT PRIME", number);
    end
    $finish;
end

endmodule
