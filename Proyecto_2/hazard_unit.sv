module hazard_unit (
    
    input wire MEMREAD_ID_EX, BEQ_WRONG_PRED,
    input wire [4:0] ARS1_IF_ID, ARS2_IF_ID, ARD_ID_EX,
    input wire [6:0] OP_CODE,
    output reg STALL, MUX_SEL
);

//logica

localparam [6:0] beq_op = 7'b1100011;
localparam [6:0] arit_op = 7'b0110011;
localparam [6:0] sw_op = 7'b0100011;
localparam [6:0] lw_op = 7'b0000011;

always_comb begin
    {STALL, MUX_SEL} = 2'b0;
    if (MEMREAD_ID_EX && ((ARD_ID_EX == ARS1_IF_ID) || (ARD_ID_EX == ARS2_IF_ID))){STALL, MUX_SEL} = 2'b11;
    else {STALL, MUX_SEL} = 2'b00;

end

endmodule
