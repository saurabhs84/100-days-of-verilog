`timescale 1ns / 1ps
module testbench;
    reg [2:0] in;
    wire [7:0] out;

    DECODER dut (.in(in), .out(out));

    initial begin
        $monitor("time=%0t | in=%b | out=%b", $time, in, out);
        in = 3'b000;
        repeat(8) begin
            #10 in = in + 1;
        end
        #10 $finish;
    end
endmodule
