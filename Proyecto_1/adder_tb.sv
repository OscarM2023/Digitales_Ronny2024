`timescale 1ns/1ps
module adder_tb;

reg [31:0] A,B;
wire [31:0] Q;

adder adder_test(.A(A),.B(B),.Q(Q));
initial begin

    $dumpfile("prueba_adder");
    $dumpvars(0,adder_tb);

    A='d30;
    B='d60;
    #1
    A='d2;
    B='d65;
    #1

    $finish;
end
    
endmodule