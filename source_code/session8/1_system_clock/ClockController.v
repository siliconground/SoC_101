`timescale 1ns / 1ps

module ClockController (
	// port list
	clk_in		, 
	rst_n		, 
	prescaler	, 
	cpu_clk		, 
	io_clk
);

// port declaration
input clk_in;
input rst_n;
input [3:0] prescaler;
output cpu_clk;
output io_clk;

wire devided_clk;

// DUT instantiation
SystemClockPrescaler DUT (
	.clk_in 	( clk_in 		), 
	.rst_n 		( rst_n 		), 
	.clkps 		( prescaler 	),
	.clk_out 	( divided_clk 	)	
);


// Modeling
assign cpu_clk 	= divided_clk	;
assign io_clk 	= divided_clk	;
	
endmodule
