`timescale 1ns / 1ps
//tb_int_cntl.v
module tb_interrupt_controller;

    // 테스트 벤치에서 사용할 신호 선언
    reg [7:0] Int;          // 8개의 인터럽트 입력
    reg IntAck;             // CPU로부터의 인터럽트 승인 신호
    wire [2:0] IntID;       // 활성화된 인터럽트의 인덱스 출력
    wire IntReq;            // 유효한 인터럽트 요청 신호

    // DUT (Device Under Test) 인스턴스화
    interrupt_controller uut (
        .Int(Int),
        .IntAck(IntAck),
        .IntID(IntID),
        .IntReq(IntReq)
    );

    // 테스트 시뮬레이션
    initial begin
        // 모니터링: 시뮬레이션 결과를 출력
        $monitor("Time=%0t | Int=%b | IntAck=%b | IntID=%b | IntReq=%b", 
                    $time, Int, IntAck, IntID, IntReq);

        // 초기화
        Int = 8'b0000_0000; // 모든 인터럽트 비활성화
        IntAck = 1'b0;      // 승인 신호 비활성화
        
        #10 Int = 8'b0000_0001;  // Int0 활성화 (우선순위 최하위)
        #10 Int = 8'b0010_0000;  // Int5 활성화 (우선순위 중간)
        #10 Int = 8'b1000_0000;  // Int7 활성화 (우선순위 최고)
        #10 IntAck = 1'b1;       // CPU가 인터럽트를 수락 (모든 요청 초기화)
        #10 IntAck = 1'b0;       // 승인 신호 비활성화 후 다음 요청 대기
        
        #10 Int = 8'b0100_0010;  // 여러 입력 활성화 (Int6 선택)
        #10 IntAck = 1'b1;       // CPU가 인터럽트를 수락
        #10 IntAck = 1'b0;
        
        #10 Int = 8'b0000_0000;  // 모든 입력 비활성화
        
        #20 $finish;             // 시뮬레이션 종료
    end

endmodule
