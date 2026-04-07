`timescale 1ns / 1ps
//tb_comparator.v

module tb_comparator();

  // 입력 및 출력 신호 정의
  reg [3:0] a, b;
  wire greater, equal, less;

  // 테스트할 comparator 인스턴스 생성
  comparator uut (
    .a(a),
    .b(b),
    .greater(greater),
    .equal(equal),
    .less(less)
  );

  // 테스트 시나리오
  initial begin
    $monitor("%0t\t %b\t %b\t %b\t %b\t %b", $time, a, b, greater, equal, less);

    // 테스트 케이스
    a = 4'b0000; b = 4'b0000; #10; // 같음
    a = 4'b0101; b = 4'b0011; #10; // A > B
    a = 4'b0010; b = 4'b1000; #10; // A < B
    a = 4'b1111; b = 4'b1111; #10; // 같음 (최대값)
    a = 4'b1010; b = 4'b0101; #10; // A > B
    a = 4'b0111; b = 4'b1001; #10; // A < B
    a = 4'b1100; b = 4'b1100; #10; // 같음
    a = 4'b0000; b = 4'b1111; #10; // A < B (최소값 vs 최대값)

    // 시뮬레이션 종료
    #10 $finish;
  end

endmodule


