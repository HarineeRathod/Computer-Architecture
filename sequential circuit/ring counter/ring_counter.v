module ring_counter #(parameter N = 4)(
	input clk, ori,
	output [N-1:0] out
);



d_ff d0(.d(out[N-1]),.clk(clk),.preset(ori),.q(out[0]));

genvar i;
generate
	for(i = 1; i < N; i = i+1) begin : ringCounter
		d_ff dtemp(.d(out[i-1]),.clk(clk),.reset(ori),.q(out[i]));
	end
endgenerate


endmodule


