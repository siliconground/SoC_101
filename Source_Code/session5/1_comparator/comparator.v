`timescale 1ns / 1ps
//comparator.v
module comparator #(parameter WIDTH = 4)(
  input [WIDTH-1:0] a, b,
  output equal, greater, less
);
  assign equal = (a == b);
  assign greater = (a > b);
  assign less = (a < b);
endmodule

