`timescale 1ns/1ns
`include "control_unit.sv"

module control_unit_tb (
);
    reg [31:0] INSTRUCTION;
    wire [3:0] ALUOP;
    wire PCSRC, ALUSRC, MEMTOREAD, MEMWRITE, MEMTOREG, REGWRITE;

    localparam [6:0] beq_op = 7'b1100011;
    localparam [6:0] arit_op = 7'b0110011;
    localparam [6:0] sw_op = 7'b0100011;
    localparam [6:0] lw_op = 7'b0000011;

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

    //instrucción BEQ
    INSTRUCTION = {25'b0, beq_op}; 
    #10;
    // PCSRC = 1
    // MEMTOREG = 0
    // MEMWRITE = 0
    // ALUSRC = 0
    // REGWRITE = 0
    // ALUOP = 4'b0110

    // instrucción SW
    INSTRUCTION = {25'b0, sw_op}; 
    #10;
    // PCSRC = 0
    // MEMTOREG = 0
    // MEMWRITE = 1
    // ALUSRC = 1
    // REGWRITE = 0
    // ALUOP = 4'b0010

    //instrucción LW
    INSTRUCTION = {25'b0, lw_op}; 
    #10;
    // PCSRC = 0
    // MEMTOREG = 1
    // MEMWRITE = 0
    // ALUSRC = 1
    // REGWRITE = 1
    // ALUOP = 4'b0010
    // MEMTOREAD = 1




    //instrucción aritmética resta
    INSTRUCTION = {1'b0, 1'b1, 15'b0, 3'b0, 5'b0, arit_op};
    #10;
    // PCSRC = 0
    // MEMTOREG = 0
    // MEMWRITE = 0
    // ALUSRC = 0
    // REGWRITE = 1
    // ALUOP = 4'b0110


    //instrucción aritmética suma
    INSTRUCTION = {25'b0, arit_op};
    #10;
    // PCSRC = 0
    // MEMTOREG = 0
    // MEMWRITE = 0
    // ALUSRC = 0
    // REGWRITE = 1
    // ALUOP = 4'b0010
    

    //instrucción aritmética or
    INSTRUCTION = {17'b0, 1'b1, 1'b1, 6'b0, arit_op};
    #10;
    // PCSRC = 0
    // MEMTOREG = 0
    // MEMWRITE = 0
    // ALUSRC = 0
    // REGWRITE = 1
    // ALUOP = 4'b0001

    //instrucción aritmética and
    INSTRUCTION = {1'b0, 1'b0, 15'b0, 1'b1, 1'b1, 1'b1, 5'b0, arit_op};
    #10;
    // PCSRC = 0
    // MEMTOREG = 0
    // MEMWRITE = 0
    // ALUSRC = 0
    // REGWRITE = 1
    // ALUOP = 4'b0000

    //instrucción desconocida default case
    INSTRUCTION = 32'b0; 
    #10;
    // PCSRC = 1
    // MEMTOREG = 1
    // MEMWRITE = 1
    // ALUSRC = 1
    // REGWRITE = 1
    // ALUOP = 4'b1111




    $display("Test completado");
    $finish;

end

endmodule