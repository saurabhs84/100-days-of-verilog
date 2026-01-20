`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.01.2026 02:30:59
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

    reg [5:0] t;

  
    wire [15:0] o;

    Sine_Wave_Generator uut (
        .t(t),
        .o(o)
    );

    integer i;

    initial begin
      
        t = 0;

        $display("Time(ns)\tt\tSine Output");
    
        for (i = 0; i < 64; i = i + 1) begin
            t = i;
            #10; 
            $display("%0t\t%0d\t%0d", $time, t, o);
        end
        $finish;
    end

endmodule

