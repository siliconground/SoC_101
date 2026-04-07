`timescale 1ns / 1ps
//3state_ex2.v
module bidirectional_bus_driver (
    input [7:0] data_to_bus,     // 회로 블록에서 버스로 보낼 데이터
    input send,                  // 데이터 전송 활성화 신호
    input rcv,                   // 데이터 수신 활성화 신호
    inout [7:0] bus_data,        // 양방향 데이터 버스
    output reg [7:0] data_from_bus // 버스에서 읽어온 데이터
);

    // 3상태 버퍼 구현: send 신호가 활성화되면 data_to_bus를 bus_data로 전달
    assign bus_data = (send) ? data_to_bus : 8'bz;

    // 데이터 수신 로직: rcv 신호가 활성화되면 bus_data를 data_from_bus로 읽어옴
    always @(*) begin
        if (rcv) begin
            data_from_bus = bus_data;
        end else begin
            data_from_bus = 8'b0; // 기본값 설정
        end
    end

endmodule
