`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.10.2025 21:08:00
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

`timescale 1ns / 1ps

module testbench;
    reg [7:0] Bin;
    wire [11:0] BCD;

    Binary_to_BCD uut (
        .Bin(Bin),
        .BCD(BCD)
    );

    initial begin
        $display("Time\tBinary Input\tBCD (Hundreds Tens Ones)");
        $display("------------------------------------------------");
        $monitor("%0t\t%b (%0d)\t%b", $time, Bin, Bin, BCD);
    end

    initial begin
        Bin = 8'd0;   #10;
        Bin = 8'd5;   #10;
        Bin = 8'd9;   #10;
        Bin = 8'd10;  #10;
        Bin = 8'd42;  #10;
        Bin = 8'd85;  #10;
        Bin = 8'd99;  #10;
        Bin = 8'd128; #10;
        Bin = 8'd173; #10;
        Bin = 8'd255; #10;
        $finish;
    end
endmodule

