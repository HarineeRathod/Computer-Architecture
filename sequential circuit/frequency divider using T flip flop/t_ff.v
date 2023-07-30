module t_ff (
    output reg q,q_not,
    input t,clk,rst
);


always @(posedge clk, posedge rst)
 begin
		 if(rst)
			 begin
				  q = 1'b0;
			 end
		 else 
		 begin
			  if(t)
				  begin
						q =~q;
				  end
			  else 
				  begin
						q =q;
				  end
      end
    q_not = ~q;
end
    
endmodule

/*module t_ff(reset,clk,t,q,q_not);
input reset,clk,t;
output reg q,q_not;

always @(posedge clk,posedge reset)
	begin
	if(reset)
			q=0;

	 if(t==1)
		begin
			q=~t;
			q_not=~q;
		end
		
	else
		begin
			q=q;
			q_not=q_not;
		end
		
	end
	endmodule*/
	