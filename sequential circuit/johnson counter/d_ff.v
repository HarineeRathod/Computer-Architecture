module d_ff(clk,reset,d,q,q_not);
input clk,reset,d;
output reg q,q_not;

always @(posedge clk or posedge reset)
begin
	if(reset)
		q=0;
	else
		q=d;
	q_not=~q;
end
endmodule
