`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.12.2025 19:21:55
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
 reg clk;
 reg rst;
 reg sensor;

  wire [1:0] highway_light;
  wire [1:0] side_light;

  Traffic_light_Controller dut (.clk(clk),.rst(rst),.sensor(sensor),.highway_light(highway_light),.side_light(side_light) );
    
  always #5 clk = ~clk;
  initial begin
    $monitor("T=%0t | sensor=%b | highway=%b | side=%b",
                  $time, sensor, highway_light, side_light);
   end
  initial begin
      
   clk = 0;
   rst = 1;
   sensor = 0; #20;
 rst = 0;#50;
 sensor = 1; #150;
 sensor = 0;#150;
 sensor = 1;#100;
 sensor = 0;#100;
 $stop;
 end
endmodule

