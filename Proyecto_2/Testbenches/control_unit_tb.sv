`timescale 1ns/1ns
`include "control_unit.sv"

module control_unit_tb (
);
    reg [31:0] INSTRUCTION;
    wire [3:0] ALUOP;
    wire PCSRC, ALUSRC, MEMTOREAD, MEMWRITE, MEMTOREG, REGWRITE;

control_unit control_unit_tb (

    .INSTRUCTION(INSTRUCTION),
    .ALUOP(ALUOP), 
    .PCSRC(PCSRC),
    .ALUSRC(ALUSRC),
    .MEMTOREAD(MEMTOREAD),
    .MEMWRITE(MEMWRITE),
    .MEMTOREG(MEMTOREG),
    .REGWRITE(REGWRITE)
);

initial begin

    $dumpfile("control_unit_tb.vcd");
    $dumpvars(0,control_unit_tb);


    //pruebas

    $display("Test completado");
end

endmodule