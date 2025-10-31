`timescale 1ns / 1ps

module testbench;

    reg [7:0] M, Q;
    wire [15:0] product;

    Booths_Multiplicatuon_Algorithm dut (
        .M(M),
        .Q(Q),
        .product(product)
    );

    initial begin
        // Test 1: Positive × Positive
        M = 8'd5; Q = 8'd3;
        #10;
        $display("5 x 3 = %d", $signed(product));

        // Test 2: Positive × Negative
        M = 8'd6; Q = -8'd3;
        #10;
        $display("6 x -3 = %d", $signed(product));

        // Test 3: Negative × Positive
        M = -8'd4; Q = 8'd7;
        #10;
        $display("-4 x 7 = %d", $signed(product));

        // Test 4: Negative × Negative
        M = -8'd5; Q = -8'd5;
        #10;
        $display("-5 x -5 = %d", $signed(product));

        $stop;
    end
endmodule
