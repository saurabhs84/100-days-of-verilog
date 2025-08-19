`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.08.2025 23:40:15
// Design Name: 
// Module Name: tb
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


module tb;
reg a,b;
wire sum,cout;
half_adder uut (.a(a),.b(b),.sum(sum),.cout(cout));
initial begin

    $display("time   a b | sum cout"); 
    
    a = 0; b = 0;
    #4 $display("%0t   %b %b |  %b    %b", $time, a, b, sum, cout);

    a = 0; b = 1;
    #4 $display("%0t   %b %b |  %b    %b", $time, a, b, sum, cout);

    a = 1; b = 0;
    #4 $display("%0t   %b %b |  %b    %b", $time, a, b, sum, cout);

    a = 1; b = 1;
    #20 $display("%0t   %b %b |  %b    %b", $time, a, b, sum, cout);

    $finish;

end
endmodule
