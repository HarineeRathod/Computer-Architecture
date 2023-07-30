module dual_ram #(parameter N = 32,
parameter Add = $clog2(N),
parameter B = 8)(
input [B-1:0]dataIn,
input wr,clk,
input [Add-1:0] addrLine1,addrLine2,
output [B-1:0] dataOut1, dataOut2
);
reg [B-1:0] mem [N-1:0];integer i;
initial begin
for(i=0; i < N; i=i+1)begin
mem[i] <= i+1;
end
end
always @ (posedge clk)begin
if(wr)begin
mem[addrLine1] <= dataIn;
end
end
assign dataOut1 = mem[addrLine1];
assign dataOut2 = mem[addrLine2];
endmodule
