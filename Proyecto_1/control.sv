module control (
    input wire [10:0] instruction,  // los primeros 7 bits son Instruction[6:0],
                                    //los siguientes tres son  Instruction[14:12],
                                    //el msb es Instruction[31]
    
    input wire zero, //bandera de zero de la ALU

   output reg Branch,MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite, //Branch va directo al mux21 de arriba
   output reg [3:0] ALUOp                              

);



    
endmodule