`timescale 1ns/1ps
`include "data_mem.sv"
module z_data_mem_tb;

reg clk,rst,wrt_en;
reg [63:0] address;
reg [63:0] write_data;
wire [63:0] read_data;

data_mem memory_test (.clk(clk),.rst(rst),.wrt_en(wrt_en),.address(address),.write_data(write_data),.read_data(read_data));

initial forever #5 clk=~clk;

initial begin
$dumpfile("prueba_data_mem.vcd");
$dumpvars(0,z_data_mem_tb);
clk<=1'b0;
wrt_en<=1'b0;
rst<=1'b0;
address<={64{1'b0}};
write_data<={64{1'b0}};

#5
rst<=1'b1;
#10
address<=64'd22;
#5
address<=64'd44;
wrt_en<=1'b1;
write_data<=64'hAAAAFFFF;
#5
address<=64'd0;
write_data<=64'd0;
#10
wrt_en<=1'b0;
#5
address<=64'd44;
#10
address<=64'd22;
#10
address<=64'd0;
#10
address<={{63{1'b1}},1'b0};
#10
address<={64{1'b1}};
#10
    $finish;
end

endmodule