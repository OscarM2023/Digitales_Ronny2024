module inst_mem (
    input wire clk,rst,
    input wire [31:0] read_adr,
    output wire [31:0] instruction
);
 reg [31:0] memory [31:0]; //el primer valor es width, el segundo depth
integer i;
always_ff @(posedge clk) begin
    if(!rst) begin  
    for(i=0;i<32;i=i+1) begin
        memory[i]<='b0;
    end
    end
end

assign instruction=memory[read_adr];



endmodule