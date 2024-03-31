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
localparam [6:0] lw_op = 7'b0000011;

reg [2:0] func3;

assign func3 = {instruction[9], instruction[8], instruction[7]};

always @(*) begin
    case (instruction[6:0])
        beq_op: begin
            if(!zero) begin
                {Branch, MemtoReg, MemWrite, ALUSrc, RegWrite} = 5'b00010;
                 ALUOp = 4'b0110;
            end
            else begin
                {Branch, MemtoReg, MemWrite, ALUSrc, RegWrite} = 5'b10010;
                 ALUOp = 4'b0110;
            end
        end
        sw_op: begin
            {Branch, MemtoReg, MemWrite, ALUSrc, RegWrite} = 5'b00110;
             ALUOp = 4'b0010;
        end
        lw_op: begin
            {Branch, MemtoReg, MemWrite, ALUSrc, RegWrite} = 5'b01011;
             ALUOp = 4'b0010;
        end
        arit_op: begin
            case (func3)
                3'b000: begin
                    if(instruction[10]) begin
                        {Branch, MemtoReg, MemWrite, ALUSrc, RegWrite} = 5'b01001;
                         ALUOp = 4'b0110;
                    end
                    else begin
                        {Branch, MemtoReg, MemWrite, ALUSrc, RegWrite} = 5'b01001;
                         ALUOp = 4'b0010;
                    end
                end

                3'b111: begin
                    {Branch, MemtoReg, MemWrite, ALUSrc, RegWrite} = 5'b01001;
                     ALUOp = 4'b0000;
                end

                3'b110: begin
                    {Branch, MemtoReg, MemWrite, ALUSrc, RegWrite} = 5'b01001;
                     ALUOp = 4'b0001;
                end

                default: begin
                    {Branch, MemtoReg, MemWrite, ALUSrc, RegWrite} = 5'b00000;
                    ALUOp = 4'b0010;
                end
            endcase
        end
        default: begin
            {Branch, MemtoReg, MemWrite, ALUSrc, RegWrite} = 5'b00010;
             ALUOp = 4'b0010;
        end
    endcase
end


endmodule