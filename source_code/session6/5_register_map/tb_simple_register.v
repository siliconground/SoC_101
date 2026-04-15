`timescale 1ns / 1ps
module tb_simple_register;

    reg clk;
    reg reset;
    reg write_enable;
    reg [7:0] write_data;
    wire [7:0] read_data;

    // SimpleRegister 인스턴스 생성
    simple_register uut (
        .clk(clk),
        .reset(reset),
        .write_enable(write_enable),
        .write_data(write_data),
        .read_data(read_data)
    );

    // 클럭 생성기
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns 주기의 클럭 생성
    end

    initial begin
        // 초기화 및 테스트 시퀀스 시작
        reset = 1; write_enable = 0; write_data = 8'b0;
        #10 reset = 0; // 리셋 비활성화

        // 쓰기 테스트: 값 42 저장
        #10 write_enable = 1; write_data = 8'd42;
        #10 write_enable = 0;

        // 읽기 테스트: 저장된 값 확인
        #10 $display("Read Data: %d", read_data);

        $finish; // 시뮬레이션 종료
    end

endmodule
