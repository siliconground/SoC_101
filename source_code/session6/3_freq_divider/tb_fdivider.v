`timescale 1ns / 1ps
module tb_fdivider;
    // signal list
	reg clk_in;
    reg reset;
    wire clk_out;
	
	// DUT instantiation with the designated param
    fdivider #(
        .DIVISOR(10)
    ) divider (
        .clk_in(clk_in),
        .reset(reset),
        .clk_out(clk_out)
    );

    // clock gen (10 ns, 100MHz)
	always #5 clk_in = ~clk_in;
	
	// apply stimulus
    initial begin
        clk_in = 0;
        reset = 1;
        #20 reset = 0;  // 20ns 후 리셋 해제
        // 200 사이클 동안 시뮬레이션
        repeat(200) @(posedge clk_in);
        $finish;
    end
    // Monitor the results
    always @(posedge clk_in) begin
        $display("Time=%0t, clk_in=%b, clk_out=%b", $time, clk_in, clk_out);
    end
endmodule

