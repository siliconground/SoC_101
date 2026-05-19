`timescale 1ns / 1ps
module moore_fsm (
    input clk,          // 클럭 신호
    input reset,        // 리셋 신호 (비동기)
    input go,           // 입력 신호 go
    input ws,           // 입력 신호 ws
    output reg rd,      // 출력 신호 rd
    output reg ds       // 출력 신호 ds
);

    // 상태 정의 (4개의 상태)
    localparam IDLE = 2'b00,
               READ = 2'b01,
               DLY  = 2'b10,
               DONE = 2'b11;

    reg [1:0] state, next_state;  // 현재 상태와 다음 상태

    // 상태 레지스터: 현재 상태를 저장
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= IDLE;        // 리셋 시 초기 상태는 IDLE
        else
            state <= next_state; // 다음 상태로 전환
    end

    // 다음 상태 로직: 입력(go, ws)에 따라 상태 전환 결정
    always @(*) begin
        case (state)
            IDLE: 
                if (go)
                    next_state = READ;   // go=1이면 READ로 전환
                else
                    next_state = IDLE;   // go=0이면 IDLE 유지

            READ: 
                if (ws)
                    next_state = DLY;    // ws=1이면 DLY로 전환
                else
                    next_state = READ;   // ws=0이면 READ 유지

            DLY: 
                if (!ws)
                    next_state = DONE;   // ws=0이면 DONE으로 전환
                else
                    next_state = DLY;    // ws=1이면 DLY 유지

            DONE: 
                next_state = IDLE;       // DONE 이후에는 항상 IDLE로 복귀

            default: 
                next_state = IDLE;       // 기본값은 IDLE
        endcase
    end


    // 출력 로직: 현재 상태에 따라 출력 결정 (Moore 머신)
    always @(*) begin
        case (state)
            IDLE: begin
                rd = 0;
                ds = 0;
            end

            READ: begin
                rd = 1;  // READ 상태에서 rd 활성화
                ds = 0;
            end

            DLY: begin
                rd = 1;  // DLY 상태에서 rd 유지 활성화
                ds = 0;
            end

            DONE: begin
                rd = 0;
                ds = 1;  // DONE 상태에서 ds 활성화
            end

            default: begin
                rd = 0;
                ds = 0;
            end
        endcase
    end

endmodule


