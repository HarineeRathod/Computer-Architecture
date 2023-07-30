module shift_reg32(Sin,pi,clk,reset,con,po);
input Sin,clk,reset;
input [31:0]pi;
input [1:0]con;
output reg [31:0]po;

always @(posedge clk)
begin
	if(reset)
		begin
			po<=0;
		end
		
	else
	begin
		case(con)
			2'b00:po<=po;// no operation
			2'b01:po<={Sin,pi[31:1]};//right shift
			2'b10:po<={pi[30:0],Sin};// left shift
			2'b11:po<=pi; 
		endcase
	end
end

endmodule
