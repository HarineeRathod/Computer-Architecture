module subAdder #(parameter N = 16)(a,b,c_in,sum,c_out);

input [N-1:0]a,b;
input c_in;

output reg [N-1:0]sum;
output reg c_out;

reg [N-1:0] Btemp;

always@(*)begin
	if(c_in)begin
		Btemp = ~b;
	end
	else Btemp = b;
	{c_out,sum} = a + Btemp + c_in;
end

endmodule
