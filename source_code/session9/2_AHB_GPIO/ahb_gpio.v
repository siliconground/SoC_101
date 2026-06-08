`timescale 1ns / 1ps

module ahb_gpio (
	// port list
	clk				, 
	rst_n			,
	addr			, 
	wdata			, 
	write_enable	,
	rdata			,
	gpio_in			,
	gpio_out		,
	gpio_dir
);

// port declaration
input 					clk				; // system clock
input 					rst_n			; // async reset(active low)
input 	[31:0] 			addr			; // AHB address
input 	[31:0] 			wdata			; // AHB write data
input 					write_enable	; // AHB write enable signal
output 	[31:0] 			rdata			; // AHB read data
input 	[7:0 ] 			gpio_in			; // external input data
output 	[7:0 ] 			gpio_out		; // external output data
output 	[7:0 ] 			gpio_dir		; // control GPIO direction(1 : output, 0 : input)


// internal register
reg [7:0] input_data					; // input data register
reg [7:0] output_data					; // output data register
reg [7:0] direction						; // direction register(1 : output, 0 : input)

// params for address mapping(refer to the table)
localparam ADDR_INPUT 	= 32'h5300_0000	; // input register address
localparam ADDR_OUTPUT 	= 32'h5300_0004	; // output register address
localparam ADDR_DIR 	= 32'h5300_0008	; // direction register

///////////////////////////////////////////////////////////////////////////////
// 1. Logic for reading data
reg [31:0] rdata;
always @(*) begin
	case ( addr )
		ADDR_INPUT 	: rdata = { 24'b0, input_data  }	; // read input data
		ADDR_OUTPUT : rdata = { 24'b0, output_data }	; // read output data
		ADDR_DIR 	: rdata = { 24'b0, direction   }	; // read direction register
		default		: rdata = 32'b0						; // default value
	endcase
end

///////////////////////////////////////////////////////////////////////////////
// 2. logic for writing data to internal register
always @(posedge clk, negedge rst_n) begin
	if ( !rst_n ) begin
		input_data 	<= 8'b0								; 
		output_data <= 8'b0								; 
		direction 	<= 8'b0								;
	end else if (write_enable) begin
		case ( addr )
			ADDR_OUTPUT : output_data 	<= wdata[7:0]	; // write output data
			ADDR_DIR 	: direction 	<= wdata[7:0]	; // write direction register
			default		: 								; // retain initial value
		endcase
	end

end

///////////////////////////////////////////////////////////////////////////////
// 3. logic for Controlling GPIO
reg [7:0] gpio_out;
reg [7:0] gpio_dir;
always @(posedge clk, negedge rst_n) begin
	if ( !rst_n ) begin
		gpio_out <= 8'b0								;
		gpio_dir <= 8'b0								;
	end else begin
		gpio_out <= output_data & direction				;
		gpio_dir <= direction							;
	end
end
endmodule


