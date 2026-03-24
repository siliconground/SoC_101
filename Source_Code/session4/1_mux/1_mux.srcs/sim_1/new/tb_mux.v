// `timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2026 11:08:54 PM
// Design Name: 
// Module Name: tb_mux
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_mux(
 // Test Bench
    );

    // signal list
    reg [1:0] sel;
    reg tx0;
    reg rx0;
    reg pwm1;
    reg other_signal;
    wire gpio_pin;

    // DUT Instantiation
    mux dut (
        .sel(sel),
        .tx0(tx0),
        .rx0(rx0),
        .pwm1(pwm1),
        .other_signal(other_signal),
        .gpio_pin(gpio_pin)
    );

    // Inject Stimulus
    initial begin
        // init
        tx0 = 1'b0; rx0 = 1'b1; pwm1 = 1'b0; other_signal = 1'b1;

        // Inject Stimulus
        sel = 2'b00; #10; // select tx0 -> gpio_pin = tx0 (0)
        sel = 2'b01; #10; // select rx0 -> gpio_pin = rx0 (1)
        sel = 2'b10; #10; // select pwm1 -> gpio_pin = pwm1 (0)
        sel = 2'b11; #10; // select other_signal -> gpio_pin = other_signal (1)

        $finish;
    end

endmodule
