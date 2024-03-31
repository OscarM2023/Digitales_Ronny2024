module control (
    input wire [10:0] instruction,  // los primeros 7 bits son Instruction[6:0],
                                    //los siguientes tres son  Instruction[14:12],
                                    //el msb es Instruction[31]

    input wire zero, //bandera de zero de la ALU

   output reg Branch,MemtoReg,MemWrite,ALUSrc,RegWrite, //Branch va directo al mux21 de arriba
   output reg [3:0] ALUOp

);

localparam [6:0] beq_op = 7'b1100011;
localparam [6:0] arit_op = 7'b0110011;
localparam [6:0] sw_op = 7'b0100011;

reg [2:0] func3;

always_comb begin
    case ({instruction})
        beq_op: begin
            
        end 
        default:
    endcase
end

    
endmodule