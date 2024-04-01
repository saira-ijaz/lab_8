module lab8 (input logic [3:0] num, 
        input [3:0] sel,
        input logic write, reset, clk, direction,
        output logic an0, an1, an2, an3, an4, an5, an6, an7,
        output logic segA, segB, segC, segD, segE, segF, segG);
logic clk_out100hz, clk_out1hz;
logic en0, en1, en2, en3, en4, en5, en6, en7, en8;
logic [3:0] q0, q1, q2, q3, q4, q5, q6, q7, q8;
logic [4:0] lion;
logic [8:0] cubs;
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

//DECODER FOR DFF SELECTION
always_comb
begin
    lion[4] = write;
    lion[3] = sel[3];
    lion[2] = sel[2];
    lion[1] = sel[1];
    lion[0] = sel[0];
end

always_comb
begin
    en0 = cubs[8];
    en1 = cubs[7];
    en2 = cubs[6];
    en3 = cubs[5];
    en4 = cubs[4];
    en5 = cubs[3];
    en6 = cubs[2];
    en7 = cubs[1];
    en8 = cubs[0];
end
always_comb begin
    case(lion)
        5'b0xxxx: cubs = 9'b000000000;
        5'b10000: cubs = 9'b100000000;
        5'b10001: cubs = 9'b010000000;
        5'b10010: cubs = 9'b001000000;
        5'b10011: cubs = 9'b000100000;
        5'b10100: cubs = 9'b000010000;
        5'b10101: cubs = 9'b000001000;
        5'b10110: cubs = 9'b000000100;
        5'b10111: cubs = 9'b000000010;
        5'b11000: cubs = 9'b000000001;

        default: cubs = 9'bxxxxxxxxx;
    endcase
end

//D_FFs
d_ff ff0 (
    .q (q0),
    .clk (clk_out100hz),
    .reset (reset),
    .enable (en0),
    .d (num)
);
d_ff ff1 (
    .q (q1),
    .clk (clk_out100hz),
    .reset (reset),
    .enable (en1),
    .d (num)
);
d_ff ff2 (
    .q (q2),
    .clk (clk_out100hz),
    .reset (reset),
    .enable (en2),
    .d (num)
);
d_ff ff3 (
    .q (q3),
    .clk (clk_out100hz),
    .reset (reset),
    .enable (en3),
    .d (num)
);
d_ff ff4 (
    .q (q4),
    .clk (clk_out100hz),
    .reset (reset),
    .enable (en4),
    .d (num)
);
d_ff ff5 (
    .q (q5),
    .clk (clk_out100hz),
    .reset (reset),
    .enable (en5),
    .d (num)
);
d_ff ff6 (
    .q (q6),
    .clk (clk_out100hz),
    .reset (reset),
    .enable (en6),
    .d (num)
);
d_ff ff7 (
    .q (q7),
    .clk (clk_out100hz),
    .reset (reset),
    .enable (en7),
    .d (num)
);
d_ff ff8 (
    .q (q8),
    .clk (clk_out100hz),
    .reset (reset),
    .enable (en8),
    .d (num)
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

//NUM MUX
logic [3:0] bb;
always_comb begin
    case (sel)
        4'b0000:bb = q0;
        4'b0001:bb = q1;
        4'b0010:bb = q2;
        4'b0011:bb = q3;
        4'b0100:bb = q4;
        4'b0101:bb = q5;
        4'b0110:bb = q6;
        4'b0111:bb = q7;
        4'b1000:bb = q8;
        default: bb = 4'bxxxx;
    endcase
end

//MUX FINAL
logic [3:0] h;
always_comb begin
    case(write)
        1'b0 : h = y;
        1'b1 : h = bb;
    endcase
end

//MUX1
logic [2:0] d;
logic [2:0] amma;
always_comb begin
    amma[2] = sel[2];
    amma[1] = sel[1];
    amma[0] = sel[0];
end

always_comb begin
    if (write) d = amma;
    else d = x;
end

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
    case (h)
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
    case (d)
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