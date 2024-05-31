`timescale 1ns/1ns
`include "and1.sv"

module and1_tb (
);
    reg A, B;
    wire Q;
    
    
and1 and_tb(
    .A(A),
    .B(B),
    .Q(Q)
);


initial begin
    $dumpfile("and1_tb.vcd");
    $dumpvars(0,and1_tb);

    A = 0;
    B = 0;
    //Q = 0
    #10

    A = 1;
    B = 0;
    //Q = 0
    #10

    A = 0;
    B = 1;
    //Q = 0
    #10

    A = 1;
    B = 1;
    //Q = 1
    #10

    $display("Test completado");


end


endmodule