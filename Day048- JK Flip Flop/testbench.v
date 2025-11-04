`timescale 1ns / 1ps

module testbench;
    reg J, K, rst, clk;
    wire Q, Qbar;

    JK_Flip_Flop uut (.J(J), .K(K), .rst(rst), .clk(clk), .Q(Q), .Qbar(Qbar));

    always #5 clk = ~clk;  

    initial begin
        clk = 0;    
        rst = 1;    
        #10 rst = 0;
    end

    initial begin
        $monitor("Time=%0t | rst=%b J=%b K=%b | Q=%b Qbar=%b", $time, rst, J, K, Q, Qbar);

        J = 0; K = 0; #10  
        J = 0; K = 1; #10 
        J = 1; K = 0; #10  
        J = 0; K = 0; #10 
        J = 1; K = 1; #10  
        $finish;
    end
endmodule
