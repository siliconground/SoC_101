`timescale 1ns/1ps

module d_latch (
    // port list
    clk,
    d, 
    q
);

input clk;
input d;
output q;

reg q;
always @(*) begin
    if( clk ) q <= d;
end
    
endmodule


