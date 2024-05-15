module mux41 #(parameter WIDTH=32) (
  input wire [1:0] SEL,
  input wire [WIDTH-1:0] IN0, IN1, IN2, IN3,
  output reg [WIDTH-1:0] OUT
);

always_comb begin
case (SEL)
    00: OUT=IN0;
    01: OUT=IN1;
    10: OUT=IN2;
    11: OUT=IN3;
endcase
end

endmodule