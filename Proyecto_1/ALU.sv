module ALU (
    input wire [31:0] A,B,
    input wire [3:0] ALU_operation,

    output reg [31:0] ALU_result,
    output reg  zero
);
    
always @(*) begin 

    case (ALU_operation)
        4'b0000:   ALU_result=A&B;
        4'b0001:   ALU_result=A|B;
        4'b0010:   ALU_result=A+B;
        4'b0110:   ALU_result=A-B;
        default: ALU_result='b0; 
    endcase

    if(ALU_result=='b0) zero='b1;
    else zero='b0;
    
end



endmodule