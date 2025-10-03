`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.10.2025 23:24:05
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
    reg a;
    wire not_out;
         
    not_gate_demux dut(a, not_out);
    initial begin
            a= 1'b0;
        #10 a= 1'b1;

    end
    initial 
     begin $monitor("a: %b  not: %b ",a, not_out);
     #20 $finish;
     end
endmodule