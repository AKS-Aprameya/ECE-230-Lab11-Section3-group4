module modulocounter (
input clk, reset,
output [2:0] count,
output out
);

wire c1, c2;
wire [2:0] sum;
wire terminal;
wire [2:0] nextcount;

full_adder fulladd1 (
    .A(count[0]),
    .B(1'b1),
    .Cin(1'b0),
    .Y(sum[0]),
    .Cout(c1)
);

full_adder fulladd2 (
    .A(count[1]),
    .B(1'b0),
    .Cin(c1),
    .Y(sum[1]),
    .Cout(c2)
);

full_adder fulladd3 (
    .A(count[2]),
    .B(1'b0),
    .Cin(c2),
    .Y(sum[2]),
    .Cout()
);

assign terminal = (count == 3'b101);
assign nextcount = terminal ? 3'b000 : sum;

dff dff1 (
    .D(nextcount[0]),
    .clk(clk),
    .reset(reset),
    .Q(count[0])
);

dff dff2 (
    .D(nextcount[1]),
    .clk(clk),
    .reset(reset),
    .Q(count[1])
);

dff dff3 (
    .D(nextcount[2]),
    .clk(clk),
    .reset(reset),
    .Q(count[2])
);

dff dffout (
    .D(out ^ terminal),
    .clk(clk),
    .reset(reset),
    .Q(out)
);

endmodule