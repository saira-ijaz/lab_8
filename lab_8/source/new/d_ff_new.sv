module d_ff_new(output logic [3:0] q,
            input logic clk, reset,
            input logic [3:0] d);

always_ff @ (posedge clk or posedge reset)
begin
    if (reset)
        q <= #1 4'b0000;
    else begin
        q <= #1 d;
    end
end
endmodule
