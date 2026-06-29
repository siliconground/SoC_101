`timescale 1ns / 1ps
module simple_register (
    // port list
    clk,
    rst_n       ,
    wen       , // write enable
    i_wdata     , // wrting data
    o_rdata     , // reding data
);
input           clk         ;             // 클럭 신호
input           rst_n       ;           // 리셋 신호
input           wen       ;    // 쓰기 활성화 신호
input   [7:0]   i_wdata     ; // 쓰기 데이터
output  [7:0]   o_rdata     ; // 읽기 데이터
// 8비트 레지스터 선언
reg     [7:0]   r_reg8      ;

// 클럭 상승 에지에서 동작
always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        r_reg8 <= 8'b0; // 리셋 시 레지스터 초기화
    end else if (wen) begin
        r_reg8 <= i_wdata; // 쓰기 활성화 시 데이터 저장
    end
end

    // 읽기 데이터는 항상 현재 레지스터 값 출력
    assign o_rdata = r_reg8;

endmodule
