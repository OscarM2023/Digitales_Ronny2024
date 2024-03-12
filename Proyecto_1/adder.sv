module adder(
    input wire [31:0]  A,B,
    output wire [31:0]  Q
);

    assign Q = A + B;

endmodule
