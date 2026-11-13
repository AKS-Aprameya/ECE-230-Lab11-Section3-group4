module tff (
    input T, clk, reset,
    output Q
);

wire d_in;
assign d_in = T ^ Q;

dffasync dffasyncinst (
    .D(d_in),
    .clk(clk),
    .reset(reset),
    .Q(Q)
);

endmodule