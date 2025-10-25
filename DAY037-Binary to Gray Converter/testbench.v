`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.10.2025 19:59:36
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
reg [3:0] bin;
wire [3:0] Gout;

Binary_to_Gray DUT (.bin(bin),.Gout(Gout));

initial begin
$monitor("time=%d | bin=%d | Gout=%d",$time,bin,Gout);
bin=4'b1000; #10
bin=4'b1100; #10
bin=4'b1110; #10
bin=4'b1001; #10
bin=4'b1010; #10
$finish;
end

endmodule
