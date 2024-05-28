`timescale 1ns/1ns
`include "mux41.sv"

module mux41_tb (
);

    reg [1:0] SELECT;
    reg [31:0] INP0, INP1, INP2, INP3;
    wire [31:0] RESULT;

mux41 DUT (
    .SEL(SELECT),
    .IN0(INP0),
    .IN1(INP1),
    .IN2(INP2),
    .IN3(INP3),
    .OUT(RESULT)
);


initial begin
    $dumpfile("mux41_tb.vcd");
    $dumpvars(0,mux41_tb);

    INP0 = 32'hAAAAAAAA;
    INP1 = 32'h55555555;
    INP2 = 32'h12345678;
    INP3 = 32'h87654321;

    SELECT = 2'b00;
    #10;
    // RESULT = 32'hAAAAAAAA

    SELECT = 2'b01;
    #10;
    // RESULT = 32'h55555555

    SELECT = 2'b10;
    #10;
    // RESULT = 32'h12345678

    SELECT = 2'b11;
    #10;
    // RESULT = 32'h87654321



    INP0 = 32'hFFFFFFFF;
    INP1 = 32'h00000000;
    INP2 = 32'hABCDEF01;
    INP3 = 32'h10FEDCBA;

    SELECT = 2'b00;
    #10;
    // RESULT = 32'hFFFFFFFF

    SELECT = 2'b01;
    #10;
    // RESULT = 32'h00000000

    SELECT = 2'b10;
    #10;
    // RESULT = 32'hABCDEF01

    SELECT = 2'b11;
    #10;
    // RESULT = 32'h10FEDCBA

    $display("Test completado");
    $finish;


end



endmodule