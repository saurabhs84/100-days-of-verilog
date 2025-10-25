`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.10.2025 20:32:15
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
reg [3:0] Grayin;
wire  [3:0]Bout;

Gray_to_Binary uut (.Bout(Bout),.Grayin(Grayin));

initial begin
$monitor("time=%d | Grayin=%d | Bout=%d ", $time,Grayin,Bout);

Grayin=4'b1011;#10
Grayin=4'b1111;#10
Grayin=4'b1000;#10
Grayin=4'b1001;#10
Grayin=4'b0011;#10
Grayin=4'b1101;#10
$finish;
end

endmodule
