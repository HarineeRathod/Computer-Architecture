module ALU_16bit(a,b,opcode,r,flag_c,flag_z);
input[15:0] a,b;
input[3:0] opcode;
output reg [15:0] r;
output reg flag_c,flag_z;
	always @(a,b,opcode)
	begin
		case(opcode)
			4'b0000:r=a+b;
			4'b0001:r=a-b;
			4'b0010:r=a/b;
			4'b0011:r=a+1;
			4'b0100:r=a-1;
			4'b0101:r=a<<b;
			4'b0110:r=a>>b;
			4'b0111:r=a&b;
			4'b1000:r=a|b;
			4'b1001:r=a^b;
			4'b1010:r=~a;
			4'b1011:r=~b;
			4'b1100:r=~(a&b);
			4'b1101:r=~(a|b);
			4'b1110:r=~(a^b);
			4'b1111:begin
				if(a<b)
				flag_c=1;
				else if (a==b)
				flag_z=1;
				else
				flag_c=0;
			end
		endcase
	end
endmodule
