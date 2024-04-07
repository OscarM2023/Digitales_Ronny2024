`timescale 1ns/1ps
`include "inst_mem.sv"
module z_inst_mem_tb #(parameter  width=32,depth=80,adr_in=64,registers_shown=10); //mostrar cierta cantidad de registros para verificar su funcionamiento

reg clk,rst;
reg [adr_in-1:0] read_adr;
wire [width-1:0] instruction;

inst_mem #(width,depth,adr_in) memory_test (.clk(clk),.rst(rst),.read_adr(read_adr),.instruction(instruction));

initial forever #5 clk=~clk;

initial begin
$dumpfile("prueba_inst_mem.vcd");
$dumpvars(0,z_inst_mem_tb);
clk<=1'b0; //reloj inicializado en bajo
rst<=1'b0; //reiniciar el sistema
read_adr={adr_in{1'b0}};
#5
rst<=1'b1;

for(integer a=0;a<registers_shown;a=a+1) begin //inicializar la memoria con valores crecientes
    $force(memory_test.memory[a],a);
end

for(integer i=0;i<registers_shown;i=i+1) begin //mostrar contenidos de memoria
    read_adr=i;
    #5;
end

    $finish;
end

endmodule