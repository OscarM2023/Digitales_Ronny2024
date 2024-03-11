`timescale 1ns / 1ps
module mux_pam_tb #(parameter Width=64,Depth=4);

 reg [Width-1:0] INPUTS [Depth-1:0];
 reg  [$clog2(Depth)-1:0] SEL;
 wire [Width-1:0] OUT ;

 mux_pam #(Width,Depth) mux_dut   (.INPUTS(INPUTS),.SEL(SEL),.OUT(OUT));
 

initial begin

    
$dumpfile("prueba_mux");
$dumpvars(0,mux_pam_tb);

INPUTS[0]='d300;
INPUTS[1]='d299;
INPUTS[2]='d298;
INPUTS[3]='d297;
SEL='d0;
#1;
SEL='d1;
#1;
SEL='d2;
#1;
SEL='d3;
#1;

$finish;
end
    
    
endmodule

