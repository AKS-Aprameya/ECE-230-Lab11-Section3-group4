module top (
    input btnC, btnU,
    output [6:0] led
);

wire [2:0] modulocount;
wire moduloout;

ripplecounter ripplecounterinst (
    .clk(btnC),
    .reset(btnU),
    .enable(1'b1),
    .stage1(led[0]),
    .stage2(led[1]),
    .stage3(led[2])
);

modulocounter modulocounterinst (
    .clk(btnC),
    .reset(btnU),
    .count(modulocount),
    .out(moduloout)
);

assign led[5:3] = modulocount;
assign led[6] = moduloout;

endmodule