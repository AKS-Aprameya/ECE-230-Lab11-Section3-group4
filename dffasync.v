module dffasync (
    input D, clk, reset,
    output reg Q
);

initial begin
    Q <= 0;
end

always@(posedge clk or posedge reset) begin
    if (reset) 
        Q <= 0;
    else
        Q <= D;
end

endmodule