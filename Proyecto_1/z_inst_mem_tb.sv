`timescale 1ns/1ps
`include "inst_mem.sv"
module z_inst_mem_tb;

reg clk=0,rst=0;
reg [31:0] read_adr=0;
wire [31:0] instruction;

inst_mem memory_test (.clk(clk),.rst(rst),.read_adr(read_adr),.instruction(instruction));

initial forever #5 clk=~clk;

initial begin
$dumpfile("prueba_inst_mem.vcd");
$dumpvars(0,z_inst_mem_tb);
#5
rst<=1'b1;
#5
read_adr<=0;
#5
read_adr<=1;
#5
read_adr<=2;
#5
read_adr<=3;
#5


    $finish;
end

endmodule