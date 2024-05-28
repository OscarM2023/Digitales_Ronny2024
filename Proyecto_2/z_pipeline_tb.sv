`timescale 1us/1ns
`include "pipeline_top.sv"
module z_pipeline_tb;

  reg  RST,CLK;

 pipeline_top pipeline_prueba (.rst(RST),.clk(CLK));

 initial forever #1 CLK=~CLK;

initial begin

$dumpfile("prueba_pipeline");
$dumpvars(0,z_pipeline_tb);



CLK=1'b0; //Inicializar el clock en bajo
RST<=1'b0;
$display("PC:",pipeline_prueba.PC.OUT);
mostrar_inst_mem(6);
mostrar_regs(5);
mostrar_data_mem(1);

#5
RST<=1'b1;
#3

$readmemh("data_initial.mem", pipeline_prueba.DATA_MEM.memory);
$readmemb("inst_initial.mem", pipeline_prueba.INST_MEM.memory);

$display("\nACTIVACION DE RESET\n");
$display("----------------");
$display("PC:",pipeline_prueba.PC.OUT);
mostrar_inst_mem(6);
mostrar_regs(5);
mostrar_data_mem(5);
$display("----------------");

for(integer i=0;i<100;i=i+1) begin
#2
$display("-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-");
$display("PC:",pipeline_prueba.PC.OUT);
mostrar_regs(6);
mostrar_data_mem(6);

end
$finish;
end


task automatic mostrar_inst_mem(input integer b); //funcion para mostrar "b" direcciones de mem instr
  for(integer a=0;a<b;a=a+1) begin
  $display("Inst_Mem[%d]:|%b|",a,pipeline_prueba.INST_MEM.memory[a]);
  end
endtask 

task automatic mostrar_regs(input integer b); //funcion para mostrar "b" registros
  for(integer a=0;a<b;a=a+1) begin
  $display("Reg[%d]:(h)|%h|(d)|%d|",a,pipeline_prueba.REGISTERS.register_bank[a],pipeline_prueba.REGISTERS.register_bank[a]);
  end
endtask 


task automatic mostrar_data_mem(input integer b); //funcion para mostrar "b" direcciones de mem data
  for(integer a=0;a<(2**b)+1;a=a+8) begin
  $display("Data_Mem[%d]:(h)|%h|(d)|%d|",a,{pipeline_prueba.DATA_MEM.memory[a+7],pipeline_prueba.DATA_MEM.memory[a+6],pipeline_prueba.DATA_MEM.memory[a+5],pipeline_prueba.DATA_MEM.memory[a+4],pipeline_prueba.DATA_MEM.memory[a+3],pipeline_prueba.DATA_MEM.memory[a+2],pipeline_prueba.DATA_MEM.memory[a+1],pipeline_prueba.DATA_MEM.memory[a]}
  ,{pipeline_prueba.DATA_MEM.memory[a+7],pipeline_prueba.DATA_MEM.memory[a+6],pipeline_prueba.DATA_MEM.memory[a+5],pipeline_prueba.DATA_MEM.memory[a+4],pipeline_prueba.DATA_MEM.memory[a+3],pipeline_prueba.DATA_MEM.memory[a+2],pipeline_prueba.DATA_MEM.memory[a+1],pipeline_prueba.DATA_MEM.memory[a]});
  end
endtask 

endmodule

