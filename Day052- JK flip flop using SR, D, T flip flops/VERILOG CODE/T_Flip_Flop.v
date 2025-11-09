module T_Flip_Flop(
    input T, clk, rst,
    output reg Q
);
always @(posedge clk)
begin
    if (rst)
        Q <= 0;
    else if (T)
        Q <= ~Q;
end
endmodule
