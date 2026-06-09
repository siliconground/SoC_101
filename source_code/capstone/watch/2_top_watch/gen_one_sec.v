`timescale 1ns / 1ps

module gen_one_sec (
	// port list
	clk				,
	rst_n			,
	i_start_clock	,
	i_set_freq		,
	o_one_sec		 // high when clock counting comes to 100
);
// parameter
parameter COUNT_WIDTH = 30; // support MAX = 1GHz
							// 2^30 = 1,073,741,824

// port declaration
input 						clk				;
input 						rst_n			;
input 						i_start_clock	;
input [COUNT_WIDTH - 1:0] 	i_set_freq		;
output 						o_one_sec		;

// internal register(FF)
reg [COUNT_WIDTH - 1:0] 	reg_count		; // store counting value

reg o_one_sec;
always @(posedge clk, negedge rst_n) begin
	if ( ~rst_n ) begin // init
		//reg_count <= {COUNT_WIDTH{1'b0}};
		reg_count <= 30'b0;
		o_one_sec <= 1'b0;
	end else if ( i_start_clock ) begin
		if ( reg_count == i_set_freq - 1 ) begin
			reg_count <= 30'b0;
			o_one_sec <= 1'b1;
		end else begin // reg_count less than i_set_freq
			reg_count <= reg_count + 1'b1;
			o_one_sec <= 1'b0;
		end
	end else begin // i_start_clock doesn't enable
		o_one_sec <= 1'b0;
	end
end


endmodule
