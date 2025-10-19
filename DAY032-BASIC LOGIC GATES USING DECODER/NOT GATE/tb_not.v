`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2025 11:31:26
// Design Name: 
// Module Name: tb_not
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

module tb_not;
    reg a;
    wire not_out;
         
    Decoder_not dut(a, not_out);
    initial begin
        #0  a= 1'b0;
        #10 a= 1'b1;

    end
    initial 
     begin $monitor("a: %b  not: %b ",a, not_out);
     #20 $finish;
     end
endmodule