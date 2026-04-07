`timescale 1ns / 1ps
// tb_peri_mux_io.v
module gpio_mux_tb;

    reg [1:0] sel;
    reg tx0;
    reg rx0;
    reg pwm1;
    reg other_signal;
    wire gpio_pin;

    // DUT (Device Under Test) 인스턴스화
    gpio_mux dut (
        .sel(sel),
        .tx0(tx0),
        .rx0(rx0),
        .pwm1(pwm1),
        .other_signal(other_signal),
        .gpio_pin(gpio_pin)
    );

    initial begin
        // 초기화
        tx0 = 1'b0; rx0 = 1'b1; pwm1 = 1'b0; other_signal = 1'b1;

        // 테스트 케이스 실행
        sel = 2'b00; #10; // tx0 선택 -> gpio_pin = tx0 (값: 0)
        sel = 2'b01; #10; // rx0 선택 -> gpio_pin = rx0 (값: 1)
        sel = 2'b10; #10; // pwm1 선택 -> gpio_pin = pwm1 (값: 0)
        sel = 2'b11; #10; // other_signal 선택 -> gpio_pin = other_signal (값: 1)

        $finish;
    end

endmodule
