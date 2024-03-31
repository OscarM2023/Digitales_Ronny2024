`timescale 1ns/1ps
`include "control.sv"
module z_control_tb;

reg [10:0] instruction;  // los primeros 7 bits son Instruction[6:0],
                                    //los siguientes tres son  Instruction[14:12],

                                    //el msb es Instruction[31]
reg zero; //bandera de zero de la ALU

wire Branch,MemtoReg,MemWrite,ALUSrc,RegWrite; //Branch va directo al mux21 de arriba
wire [3:0] ALUOp;

 control control_prueba   ( .instruction(instruction),
                            .Branch(Branch),
                            .MemtoReg(MemtoReg),
                            .MemWrite(MemWrite),
                            .ALUSrc(ALUSrc),
                            .RegWrite(RegWrite),
                            .ALUOp(ALUOp)
);

initial begin
    $dumpfile("prueba_Deco");
    $dumpvars(0,z_control_tb);
    
    // Initialize the signals
    instruction = 0;
    zero = 0;

    // Apply some test vectors
    #10 {zero, instruction} = {1'b0, 3'b000, 7'b0000011};  // LW
    #10 {zero, instruction} = {1'b0, 3'b000, 7'b0100011};  // SW
    #10 {zero, instruction} = {1'b0, 3'b000, 7'b0110011};  // ADD
    #10 {zero, instruction} = {1'b0, 3'b100, 7'b0110011};  // SUB
    #10 {zero, instruction} = {1'b0, 3'b111, 7'b0110011};  // AND
    #10 {zero, instruction} = {1'b0, 3'b110, 7'b0110011};  // OR
    #10 {zero, instruction} = {1'b1, 3'b000, 7'b1100011};  // BEQ, jump
    #10 {zero, instruction} = {1'b0, 3'b000, 7'b1100011};  // BEQ, continue

    // End the simulation
    #10 $finish;
  end

endmodule

