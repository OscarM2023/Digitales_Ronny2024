`timescale 1ns/1ns
`include "mux21.sv"

module mux21_tb (
);

    reg SEL;
    reg [31:0] IN0, IN1;
    wire [31:0] OUT;

mux21 deviceundertest (
    .SEL(SEL),
    .IN0(IN0),
    .IN1(IN1),
    .OUT(OUT)
);


initial begin
    $dumpfile("mux21_tb.vcd");
    $dumpvars(0,mux21_tb);

    IN0 = 32'hAAAAAAAA; 
    IN1 = 32'h55555555; 
    SEL = 0;
    #10;
    // out = 32'hAAAAAAAA

    SEL = 1;
    #10;
    // out = 32'h55555555


    IN0 = 32'h12345678; 
    SEL = 0;
    #10;
    // out = 32'h12345678


    IN1 = 32'h87654321; 
    SEL = 1;
    #10;
    // out = 32'h87654321


    IN0 = 32'hFFFFFFFF; 
    IN1 = 32'h00000000; 
    SEL = 0;
    #10;
    // out = 32'hFFFFFFFF


    SEL = 1;
    #10;
    // out = 32'h00000000

    $display("Test completado");
    $finish;

end



endmodule