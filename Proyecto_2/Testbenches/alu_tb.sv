`timescale 1ns/1ns
`include "alu.sv"

module alu_tb;
    // Declaración de señales
    reg [31:0] A;
    reg [31:0] B;
    reg [3:0] ALU_OPERATION;
    wire [31:0] ALU_RESULT;

    // Instanciación del módulo alu
    alu uut (
        .A(A),
        .B(B),
        .ALU_OPERATION(ALU_OPERATION),
        .ALU_RESULT(ALU_RESULT)
    );

    initial begin
        $dumpfile("alu_tb.vcd");
        $dumpvars(0, alu_tb);

        // AND
        A = 32'd0;
        B = 32'd0;
        ALU_OPERATION = 4'b0000;
        #10;

        A = 32'd1;
        B = 32'd0;
        ALU_OPERATION = 4'b0000;
        #10;

        A = 32'd0;
        B = 32'd1;
        ALU_OPERATION = 4'b0000;
        #10;

        A = 32'd1;
        B = 32'd1;
        ALU_OPERATION = 4'b0000;
        #10;

        // OR
        A = 32'd0;
        B = 32'd0;
        ALU_OPERATION = 4'b0001;
        #10;

        A = 32'd1;
        B = 32'd0;
        ALU_OPERATION = 4'b0001;
        #10;

        A = 32'd0;
        B = 32'd1;
        ALU_OPERATION = 4'b0001;
        #10;

        A = 32'd1;
        B = 32'd1;
        ALU_OPERATION = 4'b0001;
        #10;

        // SUM
        A = 32'd89;
        B = 32'd11;
        ALU_OPERATION = 4'b0010;
        // ALU_RESULT = 100
        #10;

        A = 32'd567;
        B = 32'd879;
        ALU_OPERATION = 4'b0010;
        // ALU_RESULT = 1446
        #10;

        // SUB
        A = 32'd89;
        B = 32'd11;
        ALU_OPERATION = 4'b0110;
        // ALU_RESULT = 78
        #10;

        A = 32'd73256;
        B = 32'd897;
        ALU_OPERATION = 4'b0110;
        // ALU_RESULT = 72359
        #10;

        // Operación indefinida
        ALU_OPERATION = 4'b1111;
        #10;

        $display("Test completado");

        // Terminar la simulación
        $finish;
    end

endmodule