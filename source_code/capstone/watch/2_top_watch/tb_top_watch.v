`timescale 1ns / 1ps

module tb_top_watch ();
// parameter
localparam COUNT_WIDTH 	= 30				;
localparam SEC_WIDTH 	= 6					;
localparam MIN_WIDTH 	= 6					;
localparam HOUR_WIDTH 	= 5					;
// stimulus signal
reg 						clk				;
reg 						rst_n			;
reg 						i_start_clock	;
reg [COUNT_WIDTH - 1:0] 	i_set_freq		;
	
// monitor signal
wire [SEC_WIDTH - 1:0 ] 	o_sec			;
wire [MIN_WIDTH - 1:0 ] 	o_min			;
wire [HOUR_WIDTH - 1:0] 	o_hour			;


// DUT instantiation
top_watch
#(
	.COUNT_WIDTH 	(COUNT_WIDTH)			,
	.SEC_WIDTH 		(SEC_WIDTH)				,
	.MIN_WIDTH 		(MIN_WIDTH)				,
	.HOUR_WIDTH 	(HOUR_WIDTH)
) DUT (
	.clk 			(clk)					,
	.rst_n 			(rst_n)					,
	.i_start_clock 	(i_start_clock)			,
	.i_set_freq 	(i_set_freq)			,
	.o_sec			(o_sec)					,
	.o_min			(o_min)					,
	.o_hour			(o_hour)
);

// clock generation
always #5 clk = ~clk; // 10ns, 100MHz



///////////////////////////////////////////////////////////////////////////////
// Apply Stimulus
initial begin
// init
	i_set_freq <= 30'd10;
$display("INIT: [%d]", $time);
	rst_n 			<= 1'b1; // release reset
	clk 			<= 1'b0;
	i_start_clock 	<= 1'b0;

// Reset Control
$display("Reset ON: [%d]", $time);
#100
	rst_n 			<= 1'b0; // reset ON
$display("Reset Release: [%d]", $time);
#100
	rst_n 			<= 1'b1; // reset OFF(system ON)
	i_start_clock 	<= 1'b1;
#10
@(posedge clk);
$display("Clock Start: [%d]", $time);

#100000
$display("Clock Stop: [%d]", $time);
	i_start_clock 	<= 1'b0;
$finish;
end

endmodule
