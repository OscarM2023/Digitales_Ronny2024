module PC (
    input wire clk,rst,
    input wire [31:0]  IN,
    output reg [31:0] OUT
);

always_ff @(posedge clk) begin
if(!rst) begin
    OUT='b0;
end
else begin
    OUT=IN;
end
end
    
endmodule