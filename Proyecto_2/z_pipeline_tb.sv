`timescale 1ns/1ps
`include "monocicle.sv"
module z_pipeline_tb;

  reg  RST,CLK;

 pipeline_top pipeline_prueba (.RST(RST),.CLK(CLK));

 initial forever #1 CLK=~CLK;

initial begin

$dumpfile("prueba_monocicle");
$dumpvars(0,z_monocicle_tb);



CLK=1'b0; //Inicializar el clock en bajo
RST<=1'b0;
$display("PC:",pipeline_prueba.PC.OUT);
#1
RST<=1'b1;
#1

#0 $readmemb(inst_initial, INST_MEM.sub1.RAM_matrix);
$display("\n%t: INFO: %m: loading inst_initial %s\n", $realtime, inst_initial);

#0 $readmemb(data_initial, DATA_MEM.sub1.RAM_matrix);
$display("\n%t: INFO: %m: loading data_initial %s\n", $realtime, data_initial);

$display("\nACTIVACION DE RESET\n");
$display("----------------");
$display("PC:",pipeline_prueba.PC.OUT);
$display("----------------");

for(integer i=0;i<300;i=i+1) begin
#2
$display("-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-");
$display("PC:",pipeline_prueba.PC.OUT);

end
$finish;
end

/*

task automatic mostrar_pipes(); //funcion para mostrar "b" direcciones de mem instr
  
endtask 

*/

endmodule
