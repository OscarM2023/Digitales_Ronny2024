module data_mem (
    input wire clk,rst,wrt_en,
    input wire [31:0] address,
    input wire [31:0] write_data,
    output reg [31:0] read_data
);

reg [31:0] memory [31:0]; //el primer valor es width, el segundo depth
integer i;
always @(posedge clk) begin

    if(!rst) begin  
    for(i=0;i<32;i=i+1) begin
        memory[i]<=32'h0;
    end
    end
    
    if (wrt_en) begin
        memory[address]<=write_data;
    end
    
end


always @(*) read_data=memory[address];


endmodule