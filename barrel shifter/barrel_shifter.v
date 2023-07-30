module barrel_shifter #(
	parameter N = 32,
	parameter B = $clog2(N)		
) (
	input [N-1:0]num,
	input [B-1:0]shift_num,
	input LbarR,
	input ASR,
	output [N-1:0] out
);

wire [N-1:0] inbtw [B:0];
wire [1:0] sbit [B-1:0];

genvar k;
generate
	for (k = 0; k < B; k = k+1) begin: select_logic
		assign sbit[k][1] = LbarR & shift_num[k];
		assign sbit[k][0] = (ASR == 1'b1) ? 1'b0 : shift_num[k];
	end
endgenerate

assign inbtw[B] = num;

genvar i,j;
generate
	for(i = B-1; i >= 0; i = i-1) begin: stage
		for(j = N-1; j >= 0; j = j-1) begin: mux
			if((j >= N-(2**i)) && (j >= (2**i))) begin
				mux4x1 mz(.sel(sbit[i]), .in({1'b0, inbtw[i+1][N-1], inbtw[i+1][j-(2**i)], inbtw[i+1][j]}), .out(inbtw[i][j]));
			end
			else if(j >= (2**i)) begin
				mux4x1 ml(.sel(sbit[i]), .in({inbtw[i+1][j+(2**i)], inbtw[i+1][j+(2**i)], inbtw[i+1][j-(2**i)], inbtw[i+1][j]}), .out(inbtw[i][j]));
			end
			else begin
				mux4x1 ms(.sel(sbit[i]), .in({inbtw[i+1][j+(2**i)], inbtw[i+1][j+(2**i)], 1'b0, inbtw[i+1][j]}), .out(inbtw[i][j]));
			end
		end
	end
endgenerate

assign out = inbtw[0];

endmodule
