`timescale 1ns/1ns
`include "adder.sv"

module adder_tb (
);
    reg [31:0] A, B;
    wire [31:0] Q;

adder adder_tb (
    .A(A),
    .B(B),
    .Q(Q)
);

    initial begin
        $dumpfile("adder_tb.vcd");
        $dumpvars(0,adder_tb); 

        A = 32'd1;
        B = 32'd2;
        // Q = 3
        #20

        A = 32'd15499;
        B = 32'd1;
        // Q = 15500
        #20

        A = 32'd120000;
        B = 32'd240000;
        // Q = 360000
        #20

        A = 32'h40000000;  // 1073741824
        B = 32'h40000000;  // 1073741824
        // Q = 2147483648
        #20


        $display("Test completado");



    end
    
endmodule