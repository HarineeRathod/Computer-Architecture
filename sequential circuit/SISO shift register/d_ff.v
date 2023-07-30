module d_ff(
  input clk,reset,preset,d,
  output reg q
  );
  
always @(posedge clk)
begin
  if(reset)
	q<=0;
  else
	q<=d;
end
endmodule

