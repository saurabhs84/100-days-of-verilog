`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.09.2025 15:59:23
// Design Name: 
// Module Name: DFF_Tb
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


module DFF_Tb;
reg clk,rst;
wire [3:0]q;
counter_using_DFF uut (.q(q),.clk(clk),.rst(rst));
initial clk=0;
always #5 clk=~clk;
initial begin
rst=1'b0;
#10 rst=1'b1;

end


 initial begin
        #200; 
        $finish;
    end

endmodule
