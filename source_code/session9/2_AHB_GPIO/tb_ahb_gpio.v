`timescale 1ns / 1ps

module tb_ahb_gpio ();
	// stimulus signal
	reg 			clk				;
	reg 			rst_n			;
	reg [31:0] 		addr			;
	reg [31:0] 		wdata			;
	reg 			write_enable	;
	reg [7:0 ]		gpio_in			;
	// monitor signal
	wire [31:0] 	rdata			;
	wire [7:0 ] 	gpio_out		;

	// DUT instantiation
	ahb_gpio DUT (
	
		.clk				(clk			),
		.rst_n				(rst_n			),
		.addr				(addr			),
		.wdata				(wdata			),
		.write_enable		(write_enable	),
		.rdata				(rdata			),
		.gpio_in			(gpio_in		),
		.gpio_out			(gpio_out		)
	);

	// clock gen
	initial begin
		clk = 1'b0;
		forever #5 clk = ~clk; // 10ns, 100MHz
	end

	// apply stimulus
	initial begin
		// init
		rst_n 			= 1'b0				;
		addr 			= 32'b0				;
		wdata 			= 32'b0				;
		write_enable 	= 1'b0				;
		gpio_in 		= 8'b1010_1010		;

		// 10ns : reset release
		#10 rst_n = 1'b1;

		// set direction(output)
		#10 addr = 32'h5300_0008; wdata = 8'b1111_0000; write_enable = 1'b1;
		#10 write_enable = 1'b0;

		// confirm input data
		#10 addr = 32'h5300_0000; write_enable = 1'b0;
		$display("Input Data Read: %b", rdata[7:0]);
		
		// stop sim
		#50 $stop;
	end


endmodule
