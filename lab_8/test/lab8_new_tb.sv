module lab8_new_tb();

logic clk_out1hz, clk_out100hz;
logic clk, reset, direction;
logic segA1;
logic segB1;
logic segC1;
logic segD1;
logic segE1;
logic segF1;
logic segG1;
logic an00;
logic an11;
logic an22;
logic an33;
logic an44;
logic an55;
logic an66;
logic an77;

lab8_new MHH(
    .clk(clk),
    .reset(reset),
    .direction(direction),
    .segA(segA1),
    .segB(segB1),
    .segC(segC1),
    .segD(segD1),
    .segE(segE1),
    .segF(segF1),
    .segG(segG1),
    .an0(an00),
    .an1(an11),
    .an2(an22),
    .an3(an33),
    .an4(an44),
    .an5(an55),
    .an6(an66),
    .an7(an77),
    .clk_out1hz(clk_out1hz),
    .clk_out100hz(clk_out100hz)
);

initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end

initial begin
    reset <= 1;
    direction <= 0;

    @(posedge clk); reset <= 0;
    @(posedge clk);
    $stop;
end
endmodule