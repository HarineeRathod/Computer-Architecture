module PROM (data_in,clk,address,read,program,cs,data_out);
input [7:0] data_in;
input clk,read,program,cs;
input [1:0] address;
output reg [7:0] data_out;
reg [7:0] PROM [3:0];

initial
begin
PROM[0]=8'b11111111;
PROM[1]=8'b00000000;
PROM[2]=8'b11110000;
PROM[3]=8'b10101010;
end


always @(posedge clk)
begin
if(cs==1)
	begin
		if(program==1)
			begin
				 PROM[address]=data_in;
			end
		else if(read==1)
			begin
				data_out=PROM[address];
			end
end
end
endmodule
