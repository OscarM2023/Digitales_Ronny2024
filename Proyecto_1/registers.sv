module register (
    input wire rst, //senales de control.
    input wire clk,
    input wire regwrite,

    input wire [4:0] adr_reg1, //direcciones de registros .
    input wire [4:0] adr_reg2,
    input wire [4:0] adr_wr_reg,
    
    input wire [31:0] wr_data, //dato para escritura.

    output wire [31:0] reg_data1, //salidas de registros.
    output wire [31:0] reg_data2
);

reg [31:0] registers [31:0];
integer i;
always_ff @(posedge clk) begin
    
    if(regwrite) begin
        registers[adr_wr_reg]<=wr_data; end

    if(!rst) begin  
    for(i=0;i<32;i=i+1) begin
        registers[i]<='b0;
    end
    end
end

assign reg_data1=registers[adr_reg1];
assign reg_data2=registers[adr_reg2];
    
endmodule