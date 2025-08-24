module testbench;
reg [3:0] a,b;
reg cin;
wire [3:0] sum;
wire cout;

full_adder uut (.x(a), .y(b), .zin(cin), .s(sum), .co(cout));

initial begin
  $monitor("time=%0d | a=%b | b=%b | cin=%b | sum=%b | cout=%b", 
            $time, a, b, cin, sum, cout);

  a=4'b0000; b=4'b0000; cin=0; #5
  a=4'b0101; b=4'b0011; cin=0; #5
  a=4'b1111; b=4'b0001; cin=0; #5
  a=4'b1010; b=4'b0101; cin=1; #5

  $finish;
end
endmodule
