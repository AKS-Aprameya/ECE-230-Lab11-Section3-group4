module dff (
    input D, clk, reset,
    output reg Q
);

initial begin
    Q <= 0;
end

always @(posedge clk)
    if (reset) begin
        Q <= 0;
    end
    else begin
        Q <= D;
    end

endmodule