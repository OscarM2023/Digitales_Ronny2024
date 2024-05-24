`timescale 1ns/1ns
`include "branch_comp.sv"

module branch_comp_tb (
);

    reg [31:0]IN1, IN2;
    wire OUT; 

branch_comp branch_comp_tb (

    .IN1(IN1),
    .IN2(IN2),
    .OUT(OUT)
);
    
initial begin
    $dumpfile("branch_comp_tb.vdc");
    $dumpvars(0,branch_comp_tb_tb);

    IN1 = 32'hFFFFFFFF;
    IN2 = 32'h00000000
    //OUT = 0
    #10 

    IN1 = 32'hA5A5A5A5;
    IN2 = 32'hA5A5A5A5;
    //OUT = 1
    #10 

    IN1 = 32'hDEADBEEF;
    IN2 = 32'hFEEDBEEF;
    //OUT = 0
    #10 

    IN1 = 32'hA5A5A5A5;
    IN1 = 32'hDEADBEEF;
    //OUT = 0
    #10 

    IN1 = 32'h00000000;
    IN2 = 32'h00000000;
    //OUT = 1
    #10 

    IN1 = 32'h12345678;
    IN2 = 32'h12345678;
    //OUT = 1
    #10 

    $display("Test completado");

end

endmodule