module inst_mem (
    input wire clk,rst,
    input wire [63:0] read_adr,
    output reg [31:0] instruction
);
 reg [7:0] memory [63:0]; //el primer valor es width, el segundo depth
integer i;
always_ff @(posedge clk) begin
    if(!rst) begin  
    for(i=16;i<64;i=i+1) begin
        memory[i]<=8'h00;
    end
        {memory[3],memory[2],memory[1],memory[0]}<=32'b00000000000001000000010000110011;
        {memory[7],memory[6],memory[5],memory[4]}<=32'b00000000100000000111010000110011;
        {memory[11],memory[10],memory[9],memory[8]}<=32'b00000000100010000110100000110011;
         {memory[15],memory[14],memory[13],memory[12]}<=32'b00000000000000000000000001100011;
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