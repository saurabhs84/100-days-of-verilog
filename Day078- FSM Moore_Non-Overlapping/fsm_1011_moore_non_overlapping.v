
module fsm_1011_moore_non_overlapping(
    input clk,
    input reset,
    input din,
    output reg Z
);

    parameter S0 = 3'b000, 
              S1 = 3'b001,
              S2 = 3'b010, 
              S3 = 3'b011,  
              S4 = 3'b100; 

    reg [2:0] ps, ns;

    always @(posedge clk or posedge reset) begin
        if (reset)
            ps <= S0;
        else
            ps <= ns;
    end

    always @(*) begin
        ns = ps;  

        case (ps)
            S0: ns = din ? S1 : S0;
            S1: ns = din ? S1 : S2;
            S2: ns = din ? S3 : S0;
            S3: ns = din ? S4 : S2;
            S4: ns = S0; 
            default: ns = S0;
        endcase
    end

    always @(*) begin
        Z = (ps == S4);
    end

endmodule
