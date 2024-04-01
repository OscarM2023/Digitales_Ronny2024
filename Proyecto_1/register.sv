module register (
    input wire rst, //senales de control.
    input wire clk,
    input wire regwrite,

    input wire [4:0] adr_reg1, //direcciones de registros .
    input wire [4:0] adr_reg2,
    input wire [4:0] adr_wr_reg,
    
    input wire [63:0] wr_data, //dato para escritura.

    output wire [63:0] reg_data1, //salidas de registros.
    output wire [63:0] reg_data2
);
reg [7:0] registers [63:0];
integer i;
always_ff @(posedge clk) begin
    
    if(regwrite) begin
        {registers[adr_wr_reg+7],
         registers[adr_wr_reg+6],
         registers[adr_wr_reg+5],
         registers[adr_wr_reg+4],
         registers[adr_wr_reg+3],
         registers[adr_wr_reg+2],
         registers[adr_wr_reg+1],
         registers[adr_wr_reg]
         } <=wr_data;
     end

    if(!rst) begin  
    for(i=24;i<64;i=i+1) begin
        registers[i]<=8'h00;
    end
    {registers[7],registers[6],registers[5],registers[4],registers[3],registers[2],registers[1],registers[0]}<=64'd33;
    {registers[15],registers[14],registers[13],registers[12],registers[11],registers[10],registers[9],registers[8]}<=64'd22;
    {registers[23],registers[22],registers[21],registers[20],registers[19],registers[18],registers[17],registers[16]}<=64'd11;
    end
end

assign reg_data1= {
         registers[adr_reg1+7],
         registers[adr_reg1+6],
         registers[adr_reg1+5],
         registers[adr_reg1+4],
         registers[adr_reg1+3],
         registers[adr_reg1+2],
         registers[adr_reg1+1],
         registers[adr_reg1]
         };
assign reg_data2={
         registers[adr_reg2+7],
         registers[adr_reg2+6],
         registers[adr_reg2+5],
         registers[adr_reg2+4],
         registers[adr_reg2+3],
         registers[adr_reg2+2],
         registers[adr_reg2+1],
         registers[adr_reg2]
         };
    
endmodule