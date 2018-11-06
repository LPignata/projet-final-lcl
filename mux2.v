module mux2(
	input [1:0] I, // input
	input S, // seletor
	output O // output
);
	assign O = I[S];
endmodule