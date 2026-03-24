// `timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: William S. Woo 
// 
// Create Date: 03/24/2026 11:06:54 PM
// Design Name: Customized IO Multiplexer
// Module Name: mux
// Project Name: session4/1_mux
// Target Devices: Zybo Z7-20
// Tool Versions: Vivado 2024-2
// Description: 
// 
// Dependencies: N/A
// 
// Revision: 0.01
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mux(
    // port list and declaration
    
    input wire [1:0] sel,       // select signal
    input wire tx0,             // UART0 Tx 
    input wire rx0,             // UART0 Rx 
    input wire pwm1,            // PWM 
    input wire other_signal,    // other peripheral signal
    output reg gpio_pin         // GPIO Output Pin
    );
    


    // behavioral modeling
    always @(*) begin
        case (sel)
            2'b00: gpio_pin = tx0;          // Select UART0 Tx
            2'b01: gpio_pin = rx0;          // Select UART0 Rx
            2'b10: gpio_pin = pwm1;         // Select PWM
            2'b11: gpio_pin = other_signal; // Select Ohter Peripheral Signal
            default: gpio_pin = 1'bz;       // Default: High-Z(not connected)
        endcase
    end

endmodule
