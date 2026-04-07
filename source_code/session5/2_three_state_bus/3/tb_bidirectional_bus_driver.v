`timescale 1ns / 1ps
//tb_3state_ex2.v
module tb_bidirectional_bus_driver();

    reg [7:0] data_to_bus;       // 송신 데이터 입력
    reg send;                    // 송신 활성화 신호
    reg rcv;                     // 수신 활성화 신호
    wire [7:0] bus_data;         // 양방향 데이터 버스 (inout)
    wire [7:0] data_from_bus;    // 수신 데이터 출력
    // DUT(Design Under Test) 인스턴스 생성
    bidirectional_bus_driver uut (
        .data_to_bus(data_to_bus),
        .send(send),
        .rcv(rcv),
        .bus_data(bus_data),
        .data_from_bus(data_from_bus)
    );
    
    // 강제로 bus_data를 구동하기 위한 레지스터
    reg [7:0] bus_drive_data;
    assign bus_data = (rcv) ? bus_drive_data : 8'bz;  // rcv가 활성화되면 외부에서 값을 구동
    initial begin
        $monitor("Time=%0t | send=%b | rcv=%b | data_to_bus=%b | bus_data=%b | data_from_bus=%b", 
                 $time, send, rcv, data_to_bus, bus_data, data_from_bus);

        // 초기 상태 설정
        data_to_bus = 8'b00000000;
        send = 0;
        rcv = 0;
        bus_drive_data = 8'b00000000;
        #10;
        // 송신 테스트 (send 활성화)
        send = 1;
        rcv = 0;
        data_to_bus = 8'b10101010; #10;
        // 수신 테스트 (rcv 활성화)
        send = 0;
        rcv = 1;
        bus_drive_data = 8'b11001100; #10;
        // 둘 다 비활성화된 상태 확인 (고임피던스 상태)
        send = 0;
        rcv = 0; #10;
        $finish;
    end
endmodule

