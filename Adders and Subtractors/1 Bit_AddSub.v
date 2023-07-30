module oneBit_AddSub(res,cout,sbit,a,b,c);

output reg res,cout;
input sbit,a,b,c;

always@(a,b,c,sbit)begin
case(sbit)
	1'b0:begin
		 res = a^b^c;
		 cout = (a&b)|(c&b)|(a&c);
	end
	
	1'b1:begin
		 res = a^b^c;
		 cout = (~a & b) | (b & c) | (~& a);
	end

endcase
end

endmodule
