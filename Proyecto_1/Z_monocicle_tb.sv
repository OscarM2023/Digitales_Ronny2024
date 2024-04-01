`timescale 1ns/1ps
`include "monocicle.sv"
module z_monocicle_tb;

  reg  RST,CLK;

 monocicle monocicle_prueba (.RST(RST),.CLK(CLK));

 initial forever #1 CLK=~CLK;

initial begin

$dumpfile("prueba_monocicle");
$dumpvars(-2,z_monocicle_tb);

CLK=1'b0; //Inicializar el clock en bajo
RST<=1'b0;
$display("PC:",monocicle_prueba.PC_mono.OUT);
$display("Instmem[0]: |%b|%b|%b|%b|",monocicle_prueba.inst_mono.memory[3],monocicle_prueba.inst_mono.memory[2],monocicle_prueba.inst_mono.memory[1],monocicle_prueba.inst_mono.memory[0]);
$display("Instmem[4]: |%b|%b|%b|%b|",monocicle_prueba.inst_mono.memory[7],monocicle_prueba.inst_mono.memory[6],monocicle_prueba.inst_mono.memory[5],monocicle_prueba.inst_mono.memory[4]);
$display("Instmem[8]: |%b|%b|%b|%b|",monocicle_prueba.inst_mono.memory[11],monocicle_prueba.inst_mono.memory[10],monocicle_prueba.inst_mono.memory[9],monocicle_prueba.inst_mono.memory[8]);
$display("Instmem[12]: |%b|%b|%b|%b|",monocicle_prueba.inst_mono.memory[15],monocicle_prueba.inst_mono.memory[14],monocicle_prueba.inst_mono.memory[13],monocicle_prueba.inst_mono.memory[12]);
#1
RST<=1'b1;
#1
$display("\nACTIVACION DE RESET\n");
//Acá ya se programó la memoria
$display("----------------");
$display("PC:",monocicle_prueba.PC_mono.OUT);
$display("Instmem[0]: |%b|%b|%b|%b|",monocicle_prueba.inst_mono.memory[3],monocicle_prueba.inst_mono.memory[2],monocicle_prueba.inst_mono.memory[1],monocicle_prueba.inst_mono.memory[0]);
$display("Instmem[4]: |%b|%b|%b|%b|",monocicle_prueba.inst_mono.memory[7],monocicle_prueba.inst_mono.memory[6],monocicle_prueba.inst_mono.memory[5],monocicle_prueba.inst_mono.memory[4]);
$display("Instmem[8]: |%b|%b|%b|%b|",monocicle_prueba.inst_mono.memory[11],monocicle_prueba.inst_mono.memory[10],monocicle_prueba.inst_mono.memory[9],monocicle_prueba.inst_mono.memory[8]);
$display("Instmem[12]: |%b|%b|%b|%b|",monocicle_prueba.inst_mono.memory[15],monocicle_prueba.inst_mono.memory[14],monocicle_prueba.inst_mono.memory[13],monocicle_prueba.inst_mono.memory[12]);
$display("Registers[0](d): %d",{monocicle_prueba.register_mono.registers[7],monocicle_prueba.register_mono.registers[6],monocicle_prueba.register_mono.registers[5],monocicle_prueba.register_mono.registers[4],monocicle_prueba.register_mono.registers[3],monocicle_prueba.register_mono.registers[2],monocicle_prueba.register_mono.registers[1],monocicle_prueba.register_mono.registers[0]});
$display("Registers[8](d): %d",{monocicle_prueba.register_mono.registers[15],monocicle_prueba.register_mono.registers[14],monocicle_prueba.register_mono.registers[13],monocicle_prueba.register_mono.registers[12],monocicle_prueba.register_mono.registers[11],monocicle_prueba.register_mono.registers[10],monocicle_prueba.register_mono.registers[9],monocicle_prueba.register_mono.registers[8]});
$display("Registers[16](d): %d",{monocicle_prueba.register_mono.registers[23],monocicle_prueba.register_mono.registers[22],monocicle_prueba.register_mono.registers[21],monocicle_prueba.register_mono.registers[20],monocicle_prueba.register_mono.registers[19],monocicle_prueba.register_mono.registers[18],monocicle_prueba.register_mono.registers[17],monocicle_prueba.register_mono.registers[16]});
$display("----------------");

for(integer i=0;i<5;i=i+1) begin
#2
$display("PC:",monocicle_prueba.PC_mono.OUT);
$display("Registers[0](d): %d",{monocicle_prueba.register_mono.registers[7],monocicle_prueba.register_mono.registers[6],monocicle_prueba.register_mono.registers[5],monocicle_prueba.register_mono.registers[4],monocicle_prueba.register_mono.registers[3],monocicle_prueba.register_mono.registers[2],monocicle_prueba.register_mono.registers[1],monocicle_prueba.register_mono.registers[0]});
$display("Registers[8](d): %d",{monocicle_prueba.register_mono.registers[15],monocicle_prueba.register_mono.registers[14],monocicle_prueba.register_mono.registers[13],monocicle_prueba.register_mono.registers[12],monocicle_prueba.register_mono.registers[11],monocicle_prueba.register_mono.registers[10],monocicle_prueba.register_mono.registers[9],monocicle_prueba.register_mono.registers[8]});
$display("Registers[16](d): %d",{monocicle_prueba.register_mono.registers[23],monocicle_prueba.register_mono.registers[22],monocicle_prueba.register_mono.registers[21],monocicle_prueba.register_mono.registers[20],monocicle_prueba.register_mono.registers[19],monocicle_prueba.register_mono.registers[18],monocicle_prueba.register_mono.registers[17],monocicle_prueba.register_mono.registers[16]});
end


$finish;
end
    
    
endmodule

