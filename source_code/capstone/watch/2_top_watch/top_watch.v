`timescale 1ns / 1ps

module top_watch (
// port list
	clk				,
	rst_n			,
	i_start_clock	,
	i_set_freq		,
	o_sec			,
	o_min			,
	o_hour
);
// parameters
parameter COUNT_WIDTH 		= 30			;
parameter SEC_WIDTH 		= $clog2(60)	; // 6, 60sec
parameter MIN_WIDTH 		= $clog2(60)	; // 6, 60min
parameter HOUR_WIDTH 		= $clog2(24)	; // 5, 24hours

// port declaration
input 								clk				;
input 								rst_n			;
input 								i_start_clock	;
input 	[COUNT_WIDTH - 1:0	] 		i_set_freq		;
output 	[SEC_WIDTH - 1:0	] 		o_sec			;
output 	[MIN_WIDTH - 1:0	] 		o_min			;
output 	[HOUR_WIDTH - 1:0	] 		o_hour			;


// internal wire
wire w_o_one_sec; // to receive 1 sec tick from bottom module

// instantiation bottom module
gen_one_sec #(
	.COUNT_WIDTH (COUNT_WIDTH)
) u1 (
	.clk 				(clk			),
	.rst_n 				(rst_n			),
	.i_start_clock 		(i_start_clock	),
	.i_set_freq 		(i_set_freq		),
	.o_one_sec			(w_o_one_sec	) // connect to internal wire
);

// internal registers to store each count
reg [5:0 ] 		reg_min_count		;
reg [11:0] 		reg_hour_count		;

// internal wires to convey each tick
wire sec_tick 	= o_sec  == 59		; // 60 - 1
wire min_tick 	= o_min  == 59		; // 60 - 1
wire hour_tick 	= o_hour == 23		; // 24 - 1

// 1. second tick modeling
reg [SEC_WIDTH - 1:0] o_sec; // type overriding
always @(posedge clk, negedge rst_n) begin
	if ( ~rst_n ) begin
		o_sec <= 6'b0;
	end else if ( w_o_one_sec ) begin
		if ( sec_tick ) begin // sec tick=1, reset sec
			o_sec <= 6'b0;
		end else begin
			o_sec <= o_sec + 1'b1;
		end
	end
end

// 2. minute tick modeling
reg [MIN_WIDTH - 1:0] o_min;
always @(posedge clk, negedge rst_n) begin
	if ( ~rst_n ) begin
		reg_min_count 	<= 6'b0;
		o_min 			<= 6'b0;
	end else if ( w_o_one_sec ) begin
		if ( sec_tick & min_tick ) begin // sec tick = 1 and min_tick = 1, reset min
			o_min <= 6'b0;
			reg_min_count <= 6'b0;
		end else if ( reg_min_count == 59 ) begin // 60 sec
			o_min <= o_min + 1'b1;
			reg_min_count <= 6'b0;
		end else begin // reg_min_count less than 59
			reg_min_count <= reg_min_count + 1'b1;
		end
	end
end

// 3. hour tick modeling
reg [HOUR_WIDTH - 1:0] o_hour;
always @(posedge clk, negedge rst_n) begin
	if ( ~rst_n ) begin
		reg_hour_count <= 12'b0;
		o_hour <= 5'b0;
	end else if ( w_o_one_sec ) begin
		if ( sec_tick & min_tick & hour_tick ) begin
			o_hour <= 5'b0;
			reg_hour_count <= 12'b0;
		end else if ( reg_hour_count == 60**2-1) begin // 3600 sec
			o_hour <= o_hour + 1'b1;
			reg_hour_count <= 12'b0;
		end else begin
			reg_hour_count <= reg_hour_count + 1'b1;
		end
	end
end







endmodule
