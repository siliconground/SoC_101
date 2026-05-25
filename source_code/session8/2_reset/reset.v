`timescale 1ns / 1ps

module reset (
	// port list
	clk					, 
	rst_n				, 
	in_a				, 
	in_b				, 
	out_a				, 
	out_b				,
	synchronized_rst	,
);

// port declaration
input 	clk		;
input 	rst_n	;
input 	in_a	;
input 	in_b	;
output 	out_a	;
output 	out_b	;
output synchronized_rst;
	

// internal register for reset synchronization
reg sync_reg1, sync_reg2			;


// reset synchronous block
always @(posedge clk, negedge rst_n) begin
	if ( !rst_n ) begin
		sync_reg1 <= 1'b0			; // reset actviate in a asynchronous way
		sync_reg2 <= 1'b0			;
	end
	else begin
		sync_reg1 <= 1'b1			; // reset release in a synchronous way
		sync_reg2 <= sync_reg1		;
	end
end

wire synchronized_rst = sync_reg2	;

// data proess block
reg out_a;
reg out_b;
always @(posedge clk, negedge synchronized_rst) begin
	if ( !synchronized_rst ) begin
		out_a <= 1'b0				; // init on reset
		out_b <= 1'b0				;
	end
	else begin
		out_a <= in_a				;
		out_b <= in_b				;
	end
end


endmodule
