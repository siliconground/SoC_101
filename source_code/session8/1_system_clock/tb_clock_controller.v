`timescale 1ns / 1ps

module tb_clock_controller ();

	// stimulus signal
	reg clk_in;
	reg rst_n;
	reg [3:0] prescaler;

	// monitor signal
	wire cpu_clk;
	wire io_clk;

	// DUT instantiation
	ClockController DUT (
		.clk_in 	( clk_in 		), 
		.rst_n 		( rst_n 		), 
		.prescaler 	( prescaler 	), 
		.cpu_clk 	( cpu_clk 		), 
		.io_clk 	( io_clk 		)
	
	);

	// Generate System Clock
	initial begin
		clk_in = 1'b0;
		forever #5 clk_in = ~clk_in; // 10ns, 100MHz
	end

	// Put Stimlus
	initial begin
		rst_n = 1'b0; // rst=on
		prescaler = 4'd1; // prescaling = 4 (2 * (2^1)), 25MHz

		#20;
		rst_n = 1'b1;
		#200;
		prescaler = 4'd2; // prescaling = 8 ( 2 * (2^2)), 12.5MHz
		#200;
		prescaler = 4'd3; // prescaling = 16 ( 2 * (2^3)) 6.25MHz
		#400;
		prescaler = 4'd0;
		#100;
		$finish;
	end

	// Generate Dump
	initial begin
		$dumpfile("./dump.vcd");
		$dumpvars(0, tb_clock_controller);
	end

endmodule
