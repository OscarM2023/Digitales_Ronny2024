module signextend_tb;

reg [15:0] IN;
wire [31:0] OUT;

signextend signo (.IN(IN),.OUT(OUT));

initial begin

$dumpfile("prueba_extend.vcd");
$dumpvars(0,signextend_tb);

    IN=16'h0F0F;
    #3
    IN=16'hF0F0;
    #3

    $finish;
end

endmodule