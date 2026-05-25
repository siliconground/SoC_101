`timescale 1ns / 1ps

module SystemClockPrescaler (
	// port list
	clk_in		, 
	rst_n		, 
	clkps		, 
	clk_out
);

// port declaration
input clk_in		;
input rst_n		;
input [3:0] clkps	; // store prescaler
output clk_out		;

// counter register
reg [7:0] prescaler_counter		;

reg clk_out; // set clk_out to reg data type
always @(posedge clk_in, negedge rst_n) begin
	if ( ~ rst_n ) begin
		prescaler_counter <= 8'b0		;
		clk_out 		  <= 1'b0		;
	end
	else begin
		if ( prescaler_counter == (2**clkps - 1) ) begin
			prescaler_counter <= 8'b0		; // counter reset
			clk_out 		  <= ~clk_out	; // toggle output clock
		end
		else begin
			prescaler_counter <= prescaler_counter + 1'b1	;
		end
	end
end

	
endmodule
