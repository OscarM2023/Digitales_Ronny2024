`timescale 1ns/1ps
`include "PC.sv"
module z_PC_tb;

wire clk=0,rst=0;
wire [31:0]  IN;
wire [31:0] OUT;

PC PC_test (.clk(clk),.rst(rst),.IN(IN),.OUT(OUT));

initial forever #5 clk=~clk;

initial begin
$dumpfile("prueba_PC.vcd");
$dumpvars(0,z_PC_tb);

#5
rst<='b1;
#3
IN='hFFFFFFFF;
#10

    $finish;
end

endmodule