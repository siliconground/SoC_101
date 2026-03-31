`timescale 1ns / 1ps
//peri_mux_io.v
module gpio_mux (
    input wire [1:0] sel,       // 2비트 선택 신호
    input wire tx0,             // UART0 Tx 신호
    input wire rx0,             // UART0 Rx 신호
    input wire pwm1,            // PWM 신호
    input wire other_signal,    // 기타 주변 장치 신호
    output reg gpio_pin         // GPIO 핀 출력
);

    always @(*) begin
        case (sel)
            2'b00: gpio_pin = tx0;          // UART0 Tx 선택
            2'b01: gpio_pin = rx0;          // UART0 Rx 선택
            2'b10: gpio_pin = pwm1;         // PWM 신호 선택
            2'b11: gpio_pin = other_signal; // 기타 신호 선택
            default: gpio_pin = 1'bz;       // 기본값: High-Z 상태
        endcase
    end

endmodule
