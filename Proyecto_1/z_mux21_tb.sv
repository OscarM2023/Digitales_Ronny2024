`timescale 1ns/1ps
`include "mux21.sv"
module z_mux21_tb;

 reg SEL;
 reg [31:0] IN0,IN1;
 wire [31:0] OUT;

mux21 mux (.SEL(SEL),.IN0(IN0),.IN1(IN1));

initial begin
$dumpfile("prueba_mux21.vcd");
$dumpvars(0,z_mux21_tb);

    IN0=32'hFFFFFFFF;
    IN1=32'h00000000;
    SEL=0;
    #3
    SEL=1;
    #3

    $finish;
end

endmodule