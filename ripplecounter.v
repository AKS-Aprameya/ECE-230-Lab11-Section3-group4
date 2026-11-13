module ripplecounter (
    input enable, clk, reset,
    output reg Q,
    output stage1, stage2, stage3
);

initial begin
    Q <= 0;
end

wire A;
wire B;
wire C;

tff tffinst0 (
    .T(enable),
    .clk(clk),
    .Q(A)
);

tff tffinst1 (
    .T(enable),
    .clk(A),
    .Q(B)
);

tff tffinst2 (
    .T(enable),
    .clk(B),
    .Q(C)
);

assign stage1 = A;
assign stage2 = B;
assign stage3 = C;


endmodule