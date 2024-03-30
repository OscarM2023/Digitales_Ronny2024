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

reg [7:0] registers [4:0];
integer i;
always_ff @(posedge clk) begin
    
    if(regwrite) begin
        {memory[address+7],
         memory[adr_wr_reg+6],
         memory[adr_wr_reg+5],
         memory[adr_wr_reg+4],
         memory[adr_wr_regs+3],
         memory[adr_wr_reg+2],
         memory[adr_wr_reg+1],
         memory[adr_wr_reg]
         } <=wr_data;
     end

    if(!rst) begin  
    for(i=0;i<2**5;i=i+1) begin
        registers[i]<=8'h00;
    end
    end
end

assign reg_data1= {memory[adr_reg1+7],
         memory[adr_reg1+6],
         memory[adr_reg1+5],
         memory[adr_reg1+4],
         memory[adr_reg1+3],
         memory[adr_reg1+2],
         memory[adr_reg1+1],
         memory[adr_reg1]
         };
assign reg_data2={memory[adr_reg2+7],
         memory[adr_reg2+6],
         memory[adr_reg2+5],
         memory[adr_reg2+4],
         memory[adr_reg2+3],
         memory[adr_reg2+2],
         memory[adr_reg2+1],
         memory[adr_reg2]
         };
    
endmodule