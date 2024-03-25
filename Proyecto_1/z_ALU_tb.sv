`timescale 1ns/1ps
`include "ALU.sv"
module z_ALU_tb;

  reg [31:0] A,B;
  reg [3:0] ALU_operation;

  wire [31:0] ALU_result;
  wire  zero;

 ALU ALU_prueba   (.A(A),.B(B),.ALU_operation(ALU_operation),.ALU_result(ALU_result),.zero(zero0));
 
initial begin

    
$dumpfile("prueba_ALU");
$dumpvars(0,z_ALU_tb);

A='d45;
B='d67;
ALU_operation='b0000;
#1;
ALU_operation='b0001;
#1;
ALU_operation='b0010;
#1;
ALU_operation='b0110;
#1;
A='d33;
B='d33;
#1;
A='d67;
B='d45;
ALU_operation='b0000;
#1;
ALU_operation='b0001;
#1;
ALU_operation='b0010;
#1;
ALU_operation='b0110;
#1;
A='d33;
B='d33;
#1;

$finish;
end
    
    
endmodule

