`timescale 1ns/1ps
module registers_tb;

 reg rst; //senales de control.
 reg clk;
 reg regwrite;

 reg [4:0] adr_reg1; //direcciones de registros .
 reg [4:0] adr_reg2;
 reg [4:0] adr_wr_reg;
    
 reg [31:0] wr_data; //dato para escritura.

 wire [31:0] reg_data1; //salidas de registros.
 wire [31:0] reg_data2;


 register registro_prueba(.rst(rst),.clk(clk),.regwrite(regwrite),.adr_reg1(adr_reg1),.adr_reg2(adr_reg2),
 .adr_wr_reg(adr_wr_reg),.wr_data(wr_data),.reg_data1(reg_data1),.reg_data2(reg_data2) 
 );

always begin #5 clk=~clk; end//cambiar clock



 initial begin
$dumpfile("prueba_registers.vcd");
$dumpvars(0,registers_tb);
 regwrite='b0;
 clk<=0;
 rst<=0;
 #5
 rst<=1;
 #5
 adr_reg1<='d1;
 adr_reg2<='d2;
 
 adr_wr_reg<='d1;
 wr_data<='d3;
 #5
 regwrite<='b1;
 #10  
 regwrite<='b0;

 #100

    $finish;
 end

    
endmodule