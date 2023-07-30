module shift_reg #(parameter N=4)(
input d,clk,reset,
output sout );
wire [N-2:0] tempout;

d_ff(.d(d),.clk(clk),.reset(reset),.q(tempout[0]));

genvar i;

generate
for(i=1;i<N-1;i=i+1)
begin :sisoReg
	d_ff temp(.d(tempout[i-1]),.clk(clk),.reset(reset),.q(tempout[i]));
end
endgenerate
d_ff out(.d(tempout[2]),.q(sout),.clk(clk),.reset(reset));
endmodule
