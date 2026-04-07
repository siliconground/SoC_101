`timescale 1ns / 1ps
//tb_3state_ex1.v
module tb_multiplexed_bus_driver();
    reg [7:0] data_a;      // 테스트용 회로 블록 A 데이터 입력
    reg [7:0] data_b;      // 테스트용 회로 블록 B 데이터 입력
    reg en_a;              // 테스트용 회로 블록 A 활성화 신호
    reg en_b;              // 테스트용 회로 블록 B 활성화 신호
    wire [7:0] bus_data;   // 공통 데이터 버스 출력
    // DUT(Design Under Test) 인스턴스 생성
    multiplexed_bus_driver uut (
        .data_a(data_a),
        .data_b(data_b),
        .en_a(en_a),
        .en_b(en_b),
        .bus_data(bus_data)
    );
    initial begin
        $monitor("Time=%0t | en_a=%b, data_a=%b | en_b=%b, data_b=%b | bus_data=%b", 
                 $time, en_a, data_a, en_b, data_b, bus_data);
        // 초기값 설정
        data_a = 8'b10101010;
        data_b = 8'b11001100;

        // 테스트 케이스들
        en_a = 1; en_b = 0; #10; // A 활성화 -> bus_data = data_a (10101010)
        en_a = 0; en_b = 1; #10; // B 활성화 -> bus_data = data_b (11001100)
        en_a = 1; en_b = 1; #10; // XOR 조건 위반 -> bus_data는 고임피던스 상태(Z)
        en_a = 0; en_b = 0; #10; // 둘 다 비활성화 -> bus_data는 고임피던스 상태(Z)
        $finish;
    end

endmodule
