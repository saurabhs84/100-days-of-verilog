`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.12.2025 18:23:37
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
    reg  [31:0] number;
    wire [15:0] sq_root;
    wire [10:0] cube_root;
    
    Square_Cube_root dut (.number(number),.sq_root(sq_root),.cube_root(cube_root) );

    initial begin
        $display("   NUMBER   |  SQ_ROOT  |  CUBE_ROOT");
        number = 0;      #10; show;
        number = 1;      #10; show;
        number = 8;      #10; show;
        number = 16;     #10; show;
        number = 27;     #10; show;
        number = 50;     #10; show;
        number = 64;     #10; show;
        number = 100;    #10; show;
        number = 125;    #10; show;
        number = 1000;   #10; show;

        $stop;
    end

    task show;
        begin
            $display("   %6d   |    %4d    |    %4d",
                      number, sq_root, cube_root);
        end
    endtask

endmodule
