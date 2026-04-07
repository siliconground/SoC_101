`timescale 1ns / 1ps
//tb_bcdtoseg.v
module tb_bcd_to_7seg;

reg [3:0] bcd;           // 테스트용 BCD 입력
wire [6:0] seg;          // 출력 (7-세그먼트 제어 신호)

// DUT(Design Under Test) 인스턴스 생성
bcd_to_7seg uut (
    .bcd(bcd),
    .seg(seg)
);

initial begin
    $monitor("Time=%0t | BCD Input=%b | Seven Segment Output=%b", $time, bcd, seg);

    // 테스트 케이스들
    bcd = 4'b0000; #10; // 입력: 0 -> 출력: a~g = "1111110"
    bcd = 4'b0001; #10; // 입력: 1 -> 출력: a~g = "0110000"
    bcd = 4'b0010; #10; // 입력: 2 -> 출력: a~g = "1101101"
    bcd = 4'b0011; #10; // 입력: 3 -> 출력: a~g = "1111001"
    bcd = 4'b0100; #10; // 입력: 4 -> 출력: a~g = "0110011"
    bcd = 4'b0101; #10; // 입력: 5 -> 출력: a~g = "1011011"
    bcd = 4'b0110; #10; // 입력: 6 -> 출력: a~g = "1011111"
    bcd = 4'b0111; #10; // 입력: 7 -> 출력: a~g = "1110000"
    bcd = 4'b1000; #10; // 입력: 8 -> 출력: a~g = "1111111"
    bcd = 4'b1001; #10; // 입력: 9 -> 출력: a~g = "1111011"

    $finish;
end

endmodule
