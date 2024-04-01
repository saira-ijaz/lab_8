module clk100hz (input logic clk, reset,
                output logic clk_out100hz);

logic q0,q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12;
t_ff ff0(
    .reset(reset),
    .clk(clk),
    .clk_out(q0)
);
t_ff ff1(
    .reset(reset),
    .clk(q0),
    .clk_out(q1)
);
t_ff ff2(
    .reset(reset),
    .clk(q1),
    .clk_out(q2)
);
t_ff ff3(
    .reset(reset),
    .clk(q2),
    .clk_out(q3)
);
t_ff ff4(
    .reset(reset),
    .clk(q3),
    .clk_out(q4)
);
t_ff ff5(
    .reset(reset),
    .clk(q4),
    .clk_out(q5)
);
t_ff ff6(
    .reset(reset),
    .clk(q5),
    .clk_out(q6)
);
t_ff ff7(
    .reset(reset),
    .clk(q6),
    .clk_out(q7)
);
t_ff ff8(
    .reset(reset),
    .clk(q7),
    .clk_out(q8)
);
t_ff ff9(
    .reset(reset),
    .clk(q8),
    .clk_out(q9)
);
t_ff ff10(
    .reset(reset),
    .clk(q9),
    .clk_out(q10)
);
t_ff ff11(
    .reset(reset),
    .clk(q10),
    .clk_out(q11)
);
t_ff ff12(
    .reset(reset),
    .clk(q11),
    .clk_out(q12)
);
t_ff ff13(
    .reset(reset),
    .clk(q12),
    .clk_out(clk_out100hz)
);

endmodule