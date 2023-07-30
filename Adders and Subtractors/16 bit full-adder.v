module fulladder #(parameter N = 16)(
  input wire [N-1:0] a,
  input wire [N-1:0] b,
  input wire c_in,
  output wire [N-1:0] sum,
  output wire c_out
);
	
	wire [N:0]temp;
	wire [N-1:0]c_next;
	
	assign temp[0] = c_in;
  
  genvar i;
  generate
    for (i = 0; i < 16; i = i+1) begin : bit_adder
      full_adder fa (
        .a(a[i]),
        .b(b[i]),
        .c_in(temp[i]),
        .sum(sum[i]),
        .c_out(c_next[i])
      );
      assign temp[i+1] = c_next[i];
    end
  endgenerate
  assign c_out = c_next[N-1];
endmodule

module full_adder (
  input wire a,
  input wire b,
  input wire c_in,
  output wire sum,
  output wire c_out
);
  assign sum = a ^ b ^ c_in;
  assign c_out = (a & b) | (c_in & (a ^ b));
endmodule
