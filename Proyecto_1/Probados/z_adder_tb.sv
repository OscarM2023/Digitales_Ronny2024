`timescale 1ns/1ps
`include "adder.sv"
module z_adder_tb;

reg [63:0] A,B;
wire [63:0] Q;

adder adder_test(.A(A),.B(B),.Q(Q));
initial begin

    $dumpfile("prueba_adder");
    $dumpvars(0,z_adder_tb);

    A=64'd30;
    B=64'd60;
    #1
    A=64'd2;
    B=64'd65;
    #1

    $finish;
end
    
endmodule