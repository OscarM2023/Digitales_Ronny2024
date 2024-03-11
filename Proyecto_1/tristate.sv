module tristate #(parameter width=8)(
 input [width-1:0] INS_tri,
 input SEL,
 output  [width-1:0] OUTS_tri
 
    );
    
assign OUTS_tri=SEL ? INS_tri : 'bz;
    
endmodule
