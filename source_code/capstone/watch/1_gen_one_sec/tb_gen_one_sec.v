`timescale 1ns / 1ps

module tb_gen_one_sec ();
// parameter
localparam COUNT_WIDTH = 30;

// stimulus signal
reg 						clk				;
reg 						rst_n			;
reg 						i_start_clock	;
reg [COUNT_WIDTH - 1:0] 	i_set_freq		;
	
// monitor signal
wire 						o_one_sec		;


// DUT instantiation
gen_one_sec
#(
	.COUNT_WIDTH (COUNT_WIDTH)
) DUT (
	.clk 			(clk)					,
	.rst_n 			(rst_n)					,
	.i_start_clock 	(i_start_clock)			,
	.i_set_freq 	(i_set_freq)			,
	.o_one_sec 		(o_one_sec)
);

// clock generation
always #5 clk = ~clk; // 10ns, 100MHz



///////////////////////////////////////////////////////////////////////////////
// Applay Stimulus
initial begin
// init
$display("INIT: [%d]", $time);
	clk 			<= 1'b0;
	rst_n 			<= 1'b1;
	i_start_clock 	<= 1'b0;

// Reset Control
$display("Reset ON: [%d]", $time);
#100
	rst_n 			<= 1'b0; // rst on
$display("Reset Release: [%d]", $time);
#100
	rst_n 			<= 1'b1; // rst off(system on)
	i_start_clock 	<= 1'b1; // start clock
	//i_set_freq		<= 30'd1000000; // this is real frequency
	i_set_freq 		<= 30'd100; // set frequency

#10
@(posedge clk);
$display("Clock Start: [%d]", $time);

#100000
$display("Clock Stop: [%d]", $time);
	i_start_clock 	<= 1'b0;
$finish;
end


endmodule
