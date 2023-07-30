module j_counter #(parameter N=4)(
input clk,ori,
output [N-1:0] out);

d_ff d0(.d(~out[N-1]),.clk(clk),.reset(ori),.q(out[0]));

genvar i;

generate
for(i=1;i<N;i=i+1)
	begin:jCounter
	d_ff temp(.d(out[i-1]),.clk(clk),.reset(ori),.q(out[i]));
	end
endgenerate

endmodule

	
