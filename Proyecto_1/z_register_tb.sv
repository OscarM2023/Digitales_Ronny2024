`timescale 1ns/1ps
`include "register.sv"
module z_register_tb;

 reg rst; //senales de control.
 reg clk;
 reg regwrite;

 reg [4:0] adr_reg1; //direcciones de registros .
 reg [4:0] adr_reg2;
 reg [4:0] adr_wr_reg;
    
 reg [63:0] wr_data; //dato para escritura.

 wire [63:0] reg_data1; //salidas de registros.
 wire [63:0] reg_data2;

register memory_test (.clk(clk),.rst(rst),.regwrite(regwrite),
.adr_reg1(adr_reg1),.adr_reg2(adr_reg2),.adr_wr_reg(adr_wr_reg),
.wr_data(wr_data),.reg_data1(reg_data1),.reg_data2(reg_data2)
);

initial forever #5 clk=~clk;

initial begin

$dumpfile("prueba_register.vcd");
$dumpvars(0,z_register_tb);

regwrite<=1'b0;
clk<=1'b0;
rst<=1'b0;
adr_reg1=5'b00000;
adr_reg2=5'b00000;
adr_wr_reg=5'b00010;
wr_data=64'hAABBCCDDAABBCCDD;
#5
rst<=1'b1;
#5
{memory_test.registers[7],memory_test.registers[6],memory_test.registers[5],
memory_test.registers[4],memory_test.registers[3],memory_test.registers[2],
memory_test.registers[1],memory_test.registers[0]
}<=64'hFFAAFFAAFFAAFFAA; 

{memory_test.registers[15],memory_test.registers[14],memory_test.registers[13],
memory_test.registers[12],memory_test.registers[11],memory_test.registers[10],
memory_test.registers[9],memory_test.registers[8]
}<=64'hAABBCCDDAABBCCDD; 

//Prueba de inicializacion de memoria

adr_reg1<=64'd0;
#5
adr_reg2<=64'd8;
#5
adr_reg1<=64'd16;
#5
adr_reg2<=64'd24;
#5

adr_reg1<=64'd64; //direccion no disponible
#5
adr_reg2<=64'd64; //direccion no disponible
#5
    $finish;
end

endmodule