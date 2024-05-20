module hazard_unit (
    input wire MEMREAD_ID_EX, BEQ_WRONG_PRED,
    input wire [4:0] ARS1_IF_ID, ARS2_IF_ID, ARD_ID_EX,

    output wire STALL, MUX_SEL, PCWRITE
);

//logica

always_comb begin

    if (
        MEMREAD_ID_EX
        && ((ARD_ID_EX == ARS1_IF_ID) || (ARD_ID_EX == ARS2_IF_ID))
    ) {STALL, MUX_SEL} = 2'b11;
    else
        {STALL, MUX_SEL} = 2'b00;

    if(BEQ_WRONG_PRED) PCWRITE = 1'b1;
    else PCWRITE = 1'b0;

end

endmodule
