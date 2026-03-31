`timescale 1ns / 1ps
//int_cntl_priority_encoder.v
module interrupt_controller (
    input [7:0] Int,        // 8개의 인터럽트 입력
    input IntAck,           // CPU로부터의 인터럽트 승인 신호
    output reg [2:0] IntID, // 활성화된 인터럽트의 인덱스 출력
    output reg IntReq       // 유효한 인터럽트 요청 신호
);

reg [7:0] active_int;       // 활성화된 인터럽트를 추적

always @(*) begin
    IntReq = 1'b0;          // 기본값: 요청 없음
    IntID = 3'b000;         // 기본값: 출력 없음
    active_int = Int;       // 현재 활성화된 인터럽트를 저장

    if (IntAck) begin
        active_int = 8'b0000_0000; // 승인 시 모든 요청 초기화
    end else begin
        casex (active_int)
            8'b1xxx_xxxx: begin IntID = 3'b111; IntReq = 1'b1; end // Int7
            8'b01xx_xxxx: begin IntID = 3'b110; IntReq = 1'b1; end // Int6
            8'b001x_xxxx: begin IntID = 3'b101; IntReq = 1'b1; end // Int5
            8'b0001_xxxx: begin IntID = 3'b100; IntReq = 1'b1; end // Int4
            8'b0000_1xxx: begin IntID = 3'b011; IntReq = 1'b1; end // Int3
            8'b0000_01xx: begin IntID = 3'b010; IntReq = 1'b1; end // Int2
            8'b0000_001x: begin IntID = 3'b001; IntReq = 1'b1; end // Int1
            8'b0000_0001: begin IntID = 3'b000; IntReq = 1'b1; end // Int0
            default: begin IntID = 3'b000; IntReq = 1'b0; end      // 요청 없음
        endcase
    end
end

endmodule

