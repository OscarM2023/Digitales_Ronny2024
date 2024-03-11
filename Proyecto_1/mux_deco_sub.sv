module mux_deco_sub #(parameter depth=8)(

    input wire [$clog2(depth)-1:0] INS_deco,
    output wire [depth-1:0] OUTS_deco
    
     );
     
genvar i;


generate

for(i=0;i<depth;i=i+1) begin

assign OUTS_deco[i] = (INS_deco==i) ? 1'b1 : 1'b0; 

end

endgenerate
    
    
    
    
endmodule
