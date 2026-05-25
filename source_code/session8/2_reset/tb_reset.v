`timescale 1ns / 1ps

module tb_reset;
	// stimulus signal
	reg clk		;
	reg rst_n	;
	reg in_a	;
	reg in_b	;

	// monitor signal
	wire out_a	;
	wire out_b	;

	// DUT instantiation
	reset DUT (
		.clk				( clk		), 
		.rst_n				( rst_n		), 
		.in_a				( in_a		), 
		.in_b				( in_b		), 
		.out_a				( out_a		), 
		.out_b				( out_b		), 
		.synchronized_rst	(			)
	);

	// clock gen
	initial begin
		clk = 1'b0				;
		forever #5 clk = ~clk	; // 10ns, 100MHz
	end		

	// put stimulus
	initial begin
		// init
		rst_n 	= 1'b0		; // reset activate(active low)
		in_a 	= 1'b0		;
		in_b 	= 1'b0		;

		#20;
		rst_n 	= 1'b1		; // reset release
		#20;
		in_a 	= 1'b1		;
		in_b 	= 1'b0		;
		#10;
		in_a 	= 1'b0		;
		in_b 	= 1'b1		;
		#10;
		in_a 	= 1'b1		;
		in_b 	= 1'b1		;
		#10;
		rst_n 	= 1'b0		;
		#20;
		rst_n 	= 1'b1		;
		#10;
		$stop				;
	end

endmodule
