`timescale 1ns / 1ps
module data_bus_driver (
    input [7:0] data_A,    // 회로 블록 A의 데이터
    input [7:0] data_B,    // 회로 블록 B의 데이터
    input en_A,            // 회로 블록 A의 활성화 신호
    input en_B,            // 회로 블록 B의 활성화 신호
    output [7:0] bus_data  // 공통 데이터 버스
);

    // 3상태 버퍼 구현
    assign bus_data = (en_A) ? data_A : 
                      (en_B) ? data_B : 
                      8'bz;  // 고임피던스 상태

endmodule
