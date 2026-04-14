`timescale 1ns / 1ps

module shift_register_sipo #(
    parameter WIDTH = 8
)(
    input clk,
    input reset,
    input serial_in,
    output reg [7:0] parallel_out
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        parallel_out <= 8'b0;
    end else begin
        parallel_out <= {parallel_out[6:0], serial_in}; // 왼쪽으로 한 비트씩 시프트하고 가장 오른쪽에 입력 삽입
    end
end

endmodule

