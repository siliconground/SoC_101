`timescale 1ns / 1ps
//3state_ex1.v
module multiplexed_bus_driver (
    input [7:0] data_a,    // 회로 블록 A의 데이터
    input [7:0] data_b,    // 회로 블록 B의 데이터
    input en_a,            // 회로 블록 A의 활성화 신호
    input en_b,            // 회로 블록 B의 활성화 신호
    output [7:0] bus_data  // 공통 데이터 버스
);

    wire select;           // XOR 게이트 출력 (MUX 선택 신호)
    wire [7:0] mux_out;    // MUX 출력

    // XOR 게이트로 활성화 신호 결합
    assign select = en_a ^ en_b;

    // MUX 구현: 선택 신호에 따라 data_a 또는 data_b 선택
    assign mux_out = (en_a) ? data_a :
                     (en_b) ? data_b :
                     8'bz;  // 고임피던스 상태

    // 3상태 버퍼 구현: select 신호에 따라 MUX 출력 전달
    assign bus_data = (select) ? mux_out : 8'bz;

endmodule
