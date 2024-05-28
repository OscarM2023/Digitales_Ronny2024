`timescale 1ns/1ns
`include "PC.sv"

module pc_tb (
);
    reg clkTB, rstTB, STALLER;
    reg [31:0] IN0;
    wire [31:0] RESULT;


pc dut (
    .clk(clkTB),     
    .rst(rstTB),
    .STALL(STALLER),
    .IN(IN0),
    .OUT(RESULT)
);

initial begin
    clkTB = 0;
    rstTB = 1;  
    STALLER = 0;
    IN0 = 32'hFFFFFFFF;

    //generar clk
    forever #5 clkTB =~ clkTB;
 
end



initial begin

    $dumpfile("pc_tb.vcd");
    $dumpvars(0, pc_tb);

    //rstTB activo
    rstTB = 0;  
    #10;
    // RESULT = 32'h00000000

    // rstTB desactivado
    rstTB = 1; 
    #10;
    // RESULT = 32'hFFFFFFFF



    IN0 = 32'h12345678;
    #10;
    // RESULT = 32'h12345678



    STALLER = 1;
    IN0 = 32'hFFFFFFFF; // IN0 cambia pero RESULT no debe cambiar
    #10;
    // RESULT = 32'h12345678

    STALLER = 0;
    IN0 = 32'h0F0F0F0F;
    #10;
    // RESULT = 32'h0F0F0F0F




    rstTB = 0;  // rstTB activo
    #10;
    // RESULT = 32'h00000000


    rstTB = 1;  //rstTB desactivado
    IN0 = 32'h87654321;
    #10;
    // RESULT = 32'h87654321

    $display("Test completado");
    $finish;

end

endmodule