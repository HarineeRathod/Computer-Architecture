module freq_divider(q,clk,reset);
input clk,reset;
output q;


t_ff t0(.clk(clk),.rst(reset),.t(1),.q(q),.q_not(q_not));

endmodule
