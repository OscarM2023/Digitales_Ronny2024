
module mux_pam #(parameter Width=8,Depth=8)(

    input wire [Width-1:0] INPUTS [Depth-1:0],
    input wire  [$clog2(Depth)-1:0] SEL,
    
    output wire [Width-1:0] OUT 

    );
    
reg [Depth-1:0] buffers_sel;
mux_deco_sub #(Depth) deco (.INS_deco(SEL),.OUTS_deco(buffers_sel));
 
genvar i;
for(i=0;i<Depth;i=i+1) begin
tristate #(Width) buffer (.INS_tri(INPUTS[i]),.SEL(buffers_sel[i]),.OUTS_tri(OUT));
end
    
endmodule
