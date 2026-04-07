`timescale 1ns / 1ps
//tb_3state_ex0.v
module tb_data_bus_driver();
    reg [7:0] data_A;      // 테스트용 회로 블록 A 데이터 입력
    reg [7:0] data_B;      // 테스트용 회로 블록 B 데이터 입력
    reg en_A;              // 테스트용 회로 블록 A 활성화 신호
    reg en_B;              // 테스트용 회로 블록 B 활성화 신호
    wire [7:0] bus_data;   // 공통 데이터 버스 출력

    // DUT(Design Under Test) 인스턴스 생성
    data_bus_driver uut (
        .data_A(data_A),
        .data_B(data_B),
        .en_A(en_A),
        .en_B(en_B),
        .bus_data(bus_data)
    );
    initial begin
        $monitor("Time=%0t | en_A=%b, data_A=%b | en_B=%b, data_B=%b | bus_data=%b", 
                 $time, en_A, data_A, en_B, data_B, bus_data);
        // 초기값 설정
        data_A = 8'b10101010; data_B = 8'b11001100;
        en_A = 0; en_B = 0; #10; // 둘 다 비활성화 -> bus_data는 고임피던스 상태
        en_A = 1; en_B = 0; #10; // A 활성화 -> bus_data는 data_A 출력
        en_A = 0; en_B = 1; #10; // B 활성화 -> bus_data는 data_B 출력
        en_A = 1; en_B = 1; #10; // 둘 다 활성화 -> 충돌 상황 (테스트에서 확인)
        en_A = 0; en_B = 0; #10; // 둘 다 비활성화 -> bus_data는 고임피던스 상태

        $finish;
    end
endmodule
