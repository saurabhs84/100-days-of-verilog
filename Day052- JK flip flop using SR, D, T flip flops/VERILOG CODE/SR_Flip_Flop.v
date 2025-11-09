module SR_Flip_Flop(
    input S, R, clk, rst,
    output reg Q
);
always @(posedge clk) begin
    if (rst)
        Q <= 0;
    else begin
        case ({S,R})
            2'b00: Q <= Q;
            2'b01: Q <= 0;
            2'b10: Q <= 1;
            default: Q <= 1'bx;
        endcase
    end
end
endmodule
