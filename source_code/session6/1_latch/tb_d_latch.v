`timescale 1ns/1ps

module tb_d_latch (
    // TB
);

// signal def
reg clk, d;
wire q;

// DUt instantiation
d_latch DUT(
    .clk(clk),
    .d(d), 
    .q(q)
);

// clock gen
always #5 clk = ~clk; // 10ns

// put stimulus

initial begin
    clk = 1'b0;
    d = 1'b0; 

    #15 d=1'b1; #20 d=1'b0;
    #10 d=1'b1; #10 d=1'b0;
    #10 d=1'b1; #15 d=1'b0;

    #50; $finish;

end
endmodule



