`timescale 1ns / 1ps

module tb_moore_fsm;

    // 테스트 벤치에서 사용할 신호 정의
    reg clk;         // 클럭 신호
    reg reset;       // 리셋 신호
    reg go;          // 입력 신호 go
    reg ws;          // 입력 신호 ws
    wire rd;         // 출력 신호 rd
    wire ds;         // 출력 신호 ds

    // DUT (Device Under Test) 인스턴스화
    moore_fsm uut (
        .clk(clk),
        .reset(reset),
        .go(go),
        .ws(ws),
        .rd(rd),
        .ds(ds)
    );

    // 클럭 생성: 10ns 주기로 클럭 신호 변경
    always #5 clk = ~clk;

    // 초기화 및 테스트 시퀀스 작성
    initial begin
        // 초기 상태 설정
        clk = 0;
        reset = 0;
        go = 0;
        ws = 0;

        // 리셋 활성화 (비동기 리셋)
        #10 reset = 1;
        #10 reset = 0;

        // IDLE -> READ 상태로 전환 (go=1)
        #10 go = 1;
        #10 go = 0;

        // READ -> DLY 상태로 전환 (ws=1)
        #10 ws = 1;

        // DLY -> DONE 상태로 전환 (ws=0)
        #20 ws = 0;

        // DONE -> IDLE 상태로 복귀 (자동 복귀)
        #20;

        // 추가 테스트: 다시 READ 상태로 전환
        #10 go = 1;
        #10 go = 0;

        // 종료 조건
        #50 $stop;
    end

    // 모니터링: 출력 값 확인
    initial begin
        $monitor("Time=%0t | clk=%b | reset=%b | go=%b | ws=%b | rd=%b | ds=%b | state=%b",
                 $time, clk, reset, go, ws, rd, ds, uut.state);
    end

endmodule

