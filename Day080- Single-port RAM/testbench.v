`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.12.2025 17:18:25
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

    parameter ADDR_WIDTH = 7;
    parameter DATA_WIDTH = 8;
    parameter DEPTH = 128;

    reg clk;
    reg we;
    reg [ADDR_WIDTH-1:0] address;
    reg [DATA_WIDTH-1:0] data;
    wire [DATA_WIDTH-1:0] q;

    single_port_ram #(
        .ADDR_WIDTH(ADDR_WIDTH),
        .DATA_WIDTH(DATA_WIDTH),
        .DEPTH(DEPTH)
    ) dut (
        .clk(clk),
        .we(we),
        .address(address),
        .data(data),
        .q(q)
    );
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        we = 0;
        address = 0;
        data = 0;
        #10;
        we = 1;
        address = 7'd10;
        data = 8'hA5; 

        #10;
        address = 7'd20;
        data = 8'h3C;  

        #10;
        we = 0;       

        #10;
        address = 7'd10; 

        #10;
        address = 7'd20; 

        #10;
        we = 1;
        address = 7'd30;
        data = 8'hFF;   

        #10;
        we = 0;
        address = 7'd30;

        #20;
        $finish;
    end

    initial begin
        $monitor("T=%0t | WE=%b | ADDR=%d | DATA_IN=%h | DATA_OUT=%h",
                  $time, we, address, data, q);
    end

endmodule
