module inst_mem (
    input wire clk,rst,
    input wire [63:0] read_adr,
    output reg [31:0] instruction
);
 reg [7:0] memory [63:0]; //el primer valor es width, el segundo depth
integer i;
always_ff @(posedge clk) begin
    if(!rst) begin  
    for(i=0;i<64;i=i+1) begin
        memory[i]<=8'h00;
    end
    end
end

always @(*) begin instruction=
        {
         memory[read_adr+64'd3],
         memory[read_adr+64'd2],
         memory[read_adr+64'd1],
         memory[read_adr]};
end

endmodule