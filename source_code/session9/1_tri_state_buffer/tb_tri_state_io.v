`timescale 1ns / 1ps
module tb_tri_state_io ();

	// stimulus
	reg clk;
	reg oe;
	reg [7:0] data_in;
	wire [7:0] io_pin;
	wire [7:0] data_out;

	// external environment modeling
	reg [7:0] external_data;
	reg external_drive_enable;


	// connect bi-directional pin (activate external environment)
	assign io_pin = external_drive_enable ? external_data : 8'bz;

	// DUT instantiation
	tri_state_io DUT (
		.clk		(clk			), 
		.oe			(oe				),
		.data_in	(data_in		),
		.data_out	(data_out		),
		.io_pin		(io_pin			)	
	);

	// clock gen
	always #5 clk = ~clk;



	// gen dumpvar
	initial begin
		$dumpfile("./tri_state_io.vcd");
		$dumpvars(0, tb_tri_state_io);
	end

	// put stimlus
	initial begin
		// init
		clk = 1'b0;
		oe = 1'b0;
		data_in = 8'h00;
		external_data = 8'hAA;
		external_drive_enable = 1'b0;


		$display("Simulation Start");
		
		// Step 1 : Put external data into DUT
		#10;
		external_drive_enable = 1'b1;
		external_data = 8'h55;
		
		#20;
		oe = 1'b1; // DUT: output mode
		external_drive_enable = 1'b0; // stop external driver
		data_in = 8'hF0;

		#20;
		oe = 1'b0; // DUT: input mode

		#20;
		external_drive_enable = 1'b1;
		external_data = 8'hA5;

		#40;
		$display("Simulation End");
		$finish;
	end
	
endmodule
