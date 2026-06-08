`timescale 1ns / 1ps

module tri_state_io (
	// port list
	clk					, 
	rst_n				, 
	oe					, // Output Enable
	data_in				, 
	data_out			, 
	io_pin 				  // bi-directional pin
);

// port declaration
input 				clk			;
input 				rst_n		;
input 				oe			;
input 	[7:0] 		data_in		;
output 	[7:0] 		data_out	;
inout 	[7:0] 		io_pin		;


// tri-state buffer control logic when output mode
assign io_pin = ( oe ) ? data_in : 8'bz;


// read input data logic
reg [7:0] data_out;
always @(posedge clk, negedge rst_n) begin
	if ( !rst_n ) begin
		data_out <= 8'b0;
	end
	else begin
		if ( !oe ) begin
			data_out <= io_pin; // read data from IO Pin when input mode
		end
	end
end

	
endmodule
