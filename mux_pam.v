module (#parameter  word=8,entries=8) mux_pam (
   [entries-1:0] input wire [word-1:0] INPUTS,
   input reg [word-1:0] O,
   input wire  [word-1:0] SEL
);


endmodule

module  (#parameter  OUTS=8) deco_onehot (
input wire [OUTS-1:0] Q
output reg [$clog(OUTS)-1:0] SELS
);

always @(*) begin
    
end

endmodule 
    
