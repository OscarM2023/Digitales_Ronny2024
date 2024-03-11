module  signextend(
    input wire [15:0] IN,
    output wire [31:0] OUT
);

assign OUT=IN[15] ? {16'hFFFF,IN[15:0]} : {16'h0000,IN[15:0]};
    
endmodule