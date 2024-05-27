module hazard_unit (
    input wire MEMREAD_ID_EX, BEQ_WRONG_PRED,
    input wire [4:0] ARS1_IF_ID, ARS2_IF_ID, ARD_ID_EX,
    input wire [6:0] OP_CODE,

    output wire STALL, MUX_SEL, PCWRITE
);

//logica

localparam [6:0] beq_op = 7'b1100011;

always_comb begin

    if (MEMREAD_ID_EX && ((ARD_ID_EX == ARS1_IF_ID) || (ARD_ID_EX == ARS2_IF_ID))){STALL, MUX_SEL} = 2'b11;
    else {STALL, MUX_SEL} = 2'b00;

    if(OP_CODE == beq_op) begin
        if(BEQ_WRONG_PRED) PCWRITE = 1'b1;
        else PCWRITE = 1'b0;
    end 

end

endmodule
