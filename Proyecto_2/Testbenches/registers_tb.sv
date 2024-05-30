`timescale 1ns/1ns
`include "registers.sv"

module registers_tb (
);
    parameter WIDTH = 32;
    parameter DEPTH = 32;
    reg clk, rst;
    reg REGWRITE;
    reg [$clog2(DEPTH)-1:0] ADR_REG1, ADR_REG2, ADR_WR_REG;
    reg [WIDTH-1:0] WR_DATA; 
    wire [WIDTH-1:0] REG_DATA1, REG_DATA2;

registers registers_tb (
    
    .clk(clk),
    .rst(rst),
    .REGWRITE(REGWRITE),
    .ADR_REG1(ADR_REG1),
    .ADR_REG2(ADR_REG2),
    .ADR_WR_REG(ADR_WR_REG),
    .WR_DATA(WR_DATA),
    .REG_DATA1(REG_DATA1),
    .REG_DATA2(REG_DATA2)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end


initial begin

    $dumpfile("registers_tb.vcd");
    $dumpvars(0, registers_tb);

    //inicializacion
    rst = 1;
    REGWRITE = 0;
    ADR_REG1 = 0;
    ADR_REG2 = 0;
    ADR_WR_REG = 0;
    WR_DATA = 0;
    #10;
 
    rst = 0;
    #10;

    rst = 1;
    #10;

    REGWRITE = 1;
    ADR_WR_REG = 5'b00001;
    WR_DATA = 32'hDEADBEEF;
    #10; 
 

    //escribir y leer register 2
    ADR_WR_REG = 5'b00010;
    WR_DATA = 32'h12345678;
    #10; 
    ADR_REG1 = 5'b00010;
    #10; 
    //REG_DATA1 = 12345678

    //escribir en register 3 y leer de register 2 y 3
    ADR_WR_REG = 5'b00011;
    WR_DATA = 32'h87654321;
    #10; 
    ADR_REG1 = 5'b00010;
    ADR_REG2 = 5'b00011;
    #10; 
    // REG_DATA1 = 12345678
    //REG_DATA2 = 87654321

    //escribir en register 0 
    ADR_WR_REG = 5'b00000;
    WR_DATA = 32'hFFFFFFFF;
    #10; 
    ADR_REG1 = 5'b00000;
    #10; 
    //REG_DATA1 = 00000000

    // resetear los registros
    rst = 0;
    #10;
    rst = 1;
    ADR_REG1 = 5'b00001;
    ADR_REG2 = 5'b00010;
    #10; 
    // REG_DATA1 = 00000000
    //REG_DATA2 = 00000000


    $display("Test completado");
    $finish;



end



endmodule
