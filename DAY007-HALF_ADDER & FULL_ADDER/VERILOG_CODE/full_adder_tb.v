`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.08.2025 00:06:42
// Design Name: 
// Module Name: full_adder_tb
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


module full_adder_tb;
reg a,b,cin;
wire sum,cout;
full_adder uut(.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));

initial begin
    $display("time   a b cin| sum cout");  // header
    
    a = 0; b = 0; cin=0;
    #4 $display("%0t   %b %b %b|  %b    %b", $time, a, b,cin,sum, cout);

    a = 0; b = 0; cin=1;
    #4 $display("%0t   %b %b %b|  %b    %b", $time, a, b,cin,sum, cout);

    a = 0; b = 1; cin=0;
    #4 $display("%0t   %b %b %b|  %b    %b", $time, a, b,cin,sum, cout);

    a = 0; b = 1; cin=1;
    #4 $display("%0t   %b %b %b|  %b    %b", $time, a, b,cin,sum, cout);
    a = 1; b = 0; cin=0;
    #4 $display("%0t   %b %b %b|  %b    %b", $time, a, b,cin,sum, cout);

    a = 1; b = 0; cin=1;
    #4 $display("%0t   %b %b %b|  %b    %b", $time, a, b,cin,sum, cout);

    a = 1; b = 1; cin=0;
    #4 $display("%0t   %b %b %b|  %b    %b", $time, a, b,cin,sum, cout);

    a = 1; b = 1; cin=1;
    #4 $display("%0t   %b %b %b|  %b    %b", $time, a, b,cin,sum, cout);

    $finish;
end
endmodule
