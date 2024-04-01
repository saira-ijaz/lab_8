module lab8_new (input logic reset, clk, direction,
        output logic an0, an1, an2, an3, an4, an5, an6, an7,
        output logic segA, segB, segC, segD, segE, segF, segG
        );
logic clk_out100hz, clk_out1hz;
logic [3:0] q0, q1, q2, q3, q4, q5, q6, q7, q8;
logic [3:0] y;
logic [2:0] x;

//100 HZ CLOCK
clk100hz DUT1 (
    .clk(clk),
    .reset(reset),
    .clk_out100hz(clk_out100hz)
);

//1 HZ CLOCK
clk1hz DUT2 (
    .clk(clk),
    .reset(reset),
    .clk_out1hz(clk_out1hz)
);

//D_FFs
d_ff_new ff0 (
    .q (q0),
    .clk (clk_out100hz),
    .reset (reset),
    .d (4'b0010) //2
);
d_ff_new ff1 (
    .q (q1),
    .clk (clk_out100hz),
    .reset (reset),
    .d (4'b0000) //0
);
d_ff_new ff2 (
    .q (q2),
    .clk (clk_out100hz),
    .reset (reset),
    .d (4'b0010) //2
);
d_ff_new ff3 (
    .q (q3),
    .clk (clk_out100hz),
    .reset (reset),
    .d (4'b0010) //2
);
d_ff_new ff4 (
    .q (q4),
    .clk (clk_out100hz),
    .reset (reset),
    .d (4'b1110) //E
);
d_ff_new ff5 (
    .q (q5),
    .clk (clk_out100hz),
    .reset (reset),
    .d (4'b1110) //E
);
d_ff_new ff6 (
    .q (q6),
    .clk (clk_out100hz),
    .reset (reset),
    .d (4'b0001) //1
);
d_ff_new ff7 (
    .q (q7),
    .clk (clk_out100hz),
    .reset (reset),
    .d (4'b0101) //5
);
d_ff_new ff8 (
    .q (q8),
    .clk (clk_out100hz),
    .reset (reset),
    .d (4'b0010) //2
);

//ALPHA SHIFT
alpha_shift CAT (
    .clk(clk),
    .reset(reset),
    .direction(direction),
    .y(y),
    .x(x),
    .q0(q0),
    .q1(q1),
    .q2(q2),
    .q3(q3),
    .q4(q4),
    .q5(q5),
    .q6(q6),
    .q7(q7),
    .q8(q8)
);

//DECODER FOR CATHODE
logic [6:0] sara;
always_comb
begin
    segA = sara[6];
    segB = sara[5];
    segC = sara[4];
    segD = sara[3];
    segE = sara[2];
    segF = sara[1];
    segG = sara[0];
end

always_comb begin
    case (y)
        4'b0000: sara = 7'b0000001;
        4'b0001: sara = 7'b1001111;
        4'b0010: sara = 7'b0010010;
        4'b0011: sara = 7'b0000110;
        4'b0100: sara = 7'b1001100;
        4'b0101: sara = 7'b0100100;
        4'b0110: sara = 7'b0100000;
        4'b0111: sara = 7'b0001111;
        4'b1000: sara = 7'b0000000;
        4'b1001: sara = 7'b0000100;
        4'b1010: sara = 7'b0001000;
        4'b1011: sara = 7'b1100000;
        4'b1100: sara = 7'b0110001;
        4'b1101: sara = 7'b1000010;
        4'b1110: sara = 7'b0110000;
        4'b1111: sara = 7'b0111000;
    endcase
end

//DECODER FOR ANODE
logic [7:0] zulfi;
always_comb
begin
    an0 = zulfi[7];
    an1 = zulfi[6];
    an2 = zulfi[5];
    an3 = zulfi[4];
    an4 = zulfi[3];
    an5 = zulfi[2];
    an6 = zulfi[1];
    an7 = zulfi[0];
end

always_comb begin
    case (x)
        3'b000: zulfi = 8'b01111111;
        3'b001: zulfi = 8'b10111111;
        3'b010: zulfi = 8'b11011111;
        3'b011: zulfi = 8'b11101111;
        3'b100: zulfi = 8'b11110111;
        3'b101: zulfi = 8'b11111011;
        3'b110: zulfi = 8'b11111101;
        3'b111: zulfi = 8'b11111110;
        default: zulfi = 8'bxxxxxxxx;
    endcase
end

endmodule