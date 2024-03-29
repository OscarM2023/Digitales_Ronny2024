`timescale 1ns/1ps
`include "data_mem.sv"
module z_data_mem_tb;

reg clk=0,rst=0,wrt_en=0;
reg [31:0] address=0;
reg [31:0] write_data=0;
wire [31:0] read_data=0;

data_mem memory_test (.clk(clk),.rst(rst),.wrt_en(wrt_en),.address(address),.write_data(write_data),.read_data(read_data));

initial forever #5 clk=~clk;

initial begin
$dumpfile("prueba_data_mem.vcd");
$dumpvars(0,z_data_mem_tb);
#5
rst<=1'b1;
#10
address<=32'd22;
#5
address<=32'd44;
wrt_en<=1'b1;
write_data<=32'hAAAAFFFF;
#5
address<=32'd0;
write_data<=32'd0;
#10
wrt_en<=1'b0;
#5
address<=32'd44;
#10
address<=32'd22;
#10
address<=32'd0;
#10
    $finish;
end

endmodule