`timescale 1ns/1ps
`include "inst_mem.sv"
module z_inst_mem_tb;

reg clk,rst;
reg [63:0] read_adr;
wire [31:0] instruction;

inst_mem memory_test (.clk(clk),.rst(rst),.read_adr(read_adr),.instruction(instruction));

initial forever #5 clk=~clk;

initial begin
$dumpfile("prueba_inst_mem.vcd");
$dumpvars(0,z_inst_mem_tb);
clk<=1'b0;
rst<=1'b0;
read_adr={64{1'b0}};
#5
rst<=1'b1;

#5
{memory_test.memory[3],memory_test.memory[2],
memory_test.memory[1],memory_test.memory[0]
}<=32'hFFAAFFAA; 

{memory_test.memory[7],memory_test.memory[6],
memory_test.memory[5],memory_test.memory[4]
}<=32'hAABBCCDD; 

//Prueba de inicializacion de memoria


//memory_test.memory[8]={8'hBB};
read_adr<=64'd0;
#5
read_adr<=64'd4;
#5
read_adr<=64'd8;
#5
read_adr<=64'd12;
#5

read_adr<=64'd64; //direccion no disponible
#5



    $finish;
end

endmodule