module register (
    input wire rst, //senales de control
    input wire clk,
    input wire regwrite,

    input wire [4:0] adr_reg1, //direcciones de registros 
    input wire [4:0] adr_reg2,
    input wire [4:0] adr_wr_reg,
    
    input wire [31:0] wr_data, //

    output reg [31:0] reg_data1,
    output reg [31:0] reg_data2,
);

reg [31:0] registers [31:0];

always_ff @(posedge clk) begin

    if(rst!) registers='b0;
    else begin
        reg_data1<=register[adr_reg1];
        reg_data2<=register[adr_reg2];
        if(regwrite) register[adr_wr_reg]=wr_data;

    end
    
end


    
endmodule