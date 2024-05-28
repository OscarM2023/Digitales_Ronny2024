`timescale 1ns/1ps
`include "pipeline_top.sv"
module z_pipeline_tb;

  reg  RST,CLK;

 pipeline_top pipeline_prueba (.RST(RST),.CLK(CLK));

 initial forever #1 CLK=~CLK;

initial begin

$dumpfile("prueba_pipeline");
$dumpvars(0,z_pipeline_tb);



CLK=1'b0; //Inicializar el clock en bajo
RST<=1'b0;
$display("PC:",pipeline_prueba.PC.OUT);
#1
RST<=1'b1;
#1

#0 $readmemb("inst_initial", INST_MEM.sub1.RAM_matrix);
$display("\n%t: INFO: %m: loading inst_initial %s\n", $realtime, inst_initial);

#0 $readmemb("data_initial", DATA_MEM.sub1.RAM_matrix);
$display("\n%t: INFO: %m: loading data_initial %s\n", $realtime, data_initial);

$display("\nACTIVACION DE RESET\n");
$display("----------------");
$display("PC:",pipeline_prueba.PC.OUT);
mostrar_regs(5);
$display("----------------");

for(integer i=0;i<300;i=i+1) begin
#2
$display("-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-");
$display("PC:",pipeline_prueba.PC.OUT);
mostrar_regs(6);

end
$finish;
end

task automatic mostrar_regs(input integer b); //funcion para mostrar "b" registros
  for(integer a=0;a<b;a=a+1) begin
  $display("Reg[%d]:(h)|%h|(d)|%d|",a,monocicle_prueba.register_mono.registers[a],monocicle_prueba.register_mono.registers[a]);
  end
endtask 

endmodule
