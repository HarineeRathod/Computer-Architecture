module RAM_4bit(
input [7:0]write,
input [1:0]address,
input r_wbar,
input clk,
output reg [7:0] read
);

reg [7:0]ram[3:0];

always @(posedge clk)
begin	
	if(r_wbar==1)
		read<=ram[address];
	else
		ram[address]<=write;
end
endmodule
