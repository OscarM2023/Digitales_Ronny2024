`timescale 1ns/1ns
`include "branch_comp.sv"

module branch_comp_tb (
);

    reg [31:0] IN11;
    reg [31:0] IN22;
    wire OUT1; 

branch_comp branch_comp_tb (
    .IN1(IN11),
    .IN2(IN22),
    .OUT(OUT1)
);
    
initial begin
    $dumpfile("branch_comp_tb.vcd");
    $dumpvars(0,branch_comp_tb);

    IN11 = 32'hFFFFFFFF;
    IN22 = 32'h00000000;
    //OUT = 0
    #10 

    IN11 = 32'hA5A5A5A5;
    IN22 = 32'hA5A5A5A5;
    //OUT = 1
    #10 

    IN11 = 32'hDEADBEEF;
    IN22 = 32'hFEEDBEEF;
    //OUT = 0
    #10 

    IN11 = 32'hA5A5A5A5;
    IN22 = 32'hDEADBEEF;
    //OUT = 0
    #10 

    IN11 = 32'h00000000;
    IN22 = 32'h00000000;
    //OUT = 1
    #10 

    IN11 = 32'h12345678;
    IN22 = 32'h12345678;
    //OUT = 1
    #10 

    $display("Test completado");

end

endmodule