module  signextend(
    input wire [31:0] IN,
    output reg [31:0] OUT
);

always @(*) begin  
    case (IN[6:0])
        7'b0000011: begin //lw
            if (IN[31]) 
            OUT={20'b11111111111111111111,IN[31:20]};
            else
            OUT={20'b00000000000000000000,IN[31:20]};
        end    
        7'b0100011: begin //sw
            if (IN[31]) 
            OUT={20'b11111111111111111111,IN[31:25],IN[11:7]};
            else
            OUT={20'b00000000000000000000,IN[31:25],IN[11:7]};
        end
        7'b1100011: //beq
        begin
            if (IN[31]) 
            OUT={20'b11111111111111111111,IN[31],IN[7],IN[30:25],IN[11:8]};
            else
            OUT={20'b00000000000000000000,IN[31],IN[7],IN[30:25],IN[11:8]};
        end
        default: 
        OUT={32'b0}; //En caso de que no sea una operacion que requiera inmediatos el modulo retorna
                 //una palabra de 0s.
    endcase
end
    
endmodule