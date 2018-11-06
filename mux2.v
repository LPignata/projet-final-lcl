module mux2(
	input [1:0] I,
	input S,
	output O
);
	assign O = I[S];
endmodule