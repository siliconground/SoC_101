`timescale 1ns / 1ps

module tb_shift_register_sipo;
localparam WIDTH = 8;

reg clk;
reg reset;
reg serial_in;
wire [WIDTH -1 :0] parallel_out;
// 모듈 인스턴스화
shift_register_sipo uut (
    .clk(clk),
    .reset(reset),
    .serial_in(serial_in),
    .parallel_out(parallel_out)
);

// 클럭 생성 (100MHz)
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 주기 10ns (100MHz)
end

// 입력 데이터 및 리셋 신호 설정
initial begin
    reset = 1'b1; serial_in = 0;
    #15 reset = 1'b0;
    // random vector 생성 test
    repeat(WIDTH*2) begin
        @(negedge clk);
        serial_in = $random % 2; // 랜덤 비트 입력 (SoC 환경에서의 데이터 입력 상황 모사)
    end
    // 추가 클럭 사이클 진행 후 종료
    #50 $finish;
end

// 결과 모니터링
initial begin
    $monitor("time=%0t | reset=%b | serial_in=%b | parallel_out=%b", $time, reset, serial_in, parallel_out);
end

endmodule

