`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.09.2025 15:01:31
// Design Name: 
// Module Name: CSA_tb
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


module CSA_tb;

    reg [7:0] A, B;
    reg cin;
    wire [7:0] s;
    wire cout;

    CSA uut(A, B, cin, s, cout);

    initial begin
        $monitor("Time=%0t A=%d B=%d Cin=%b => Sum=%d Cout=%b", 
                  $time, A, B, cin, s, cout);

        // Test cases
        A=8'd15; B=8'd10; cin=0; #10;
        A=8'd25; B=8'd50; cin=1; #10;
        A=8'd100; B=8'd155; cin=0; #10;
        A=8'd200; B=8'd55; cin=1; #10;

        $stop;
    end

endmodule

