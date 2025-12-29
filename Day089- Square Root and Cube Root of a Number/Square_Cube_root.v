`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.12.2025 18:21:59
// Design Name: 
// Module Name: Square_Cube_root
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

module Square_Cube_root (
    input  [31:0] number,
    output reg [15:0] sq_root,
    output reg [10:0] cube_root
);

    always @(*) begin
        find_sqrt(number, sq_root);
        find_cuberoot(number, cube_root);
    end

    task find_sqrt;
        input  [31:0] num;
        output reg [15:0] res;

        integer i;
        reg [31:0] low, high, mid;

        begin
            low  = 0;
            high = num;
            res  = 0;

            for (i = 0; i < 16; i = i + 1) begin
                mid = (low + high) >> 1;

                if (mid * mid <= num) begin
                    res = mid;
                    low = mid + 1;
                end else begin
                    high = mid - 1;
                end
            end
        end
    endtask

    task find_cuberoot;
        input  [31:0] num;
        output reg [10:0] res;

        integer i;
        reg [31:0] low, high, mid;

        begin
            low  = 0;
            high = num;
            res  = 0;

            for (i = 0; i < 16; i = i + 1) begin
                mid = (low + high) >> 1;

                if (mid * mid * mid <= num) begin
                    res = mid;
                    low = mid + 1;
                end else begin
                    high = mid - 1;
                end
            end
        end
    endtask

endmodule
