// seletor de qual saida vai ser mostrada na tela
module mult_mux2(
	input [7:0] positivo,
	input [7:0] negativo,
	input seletor,
	output [7:0] saida
);

	always @(*)
		case(seletor)
			1'b0: saida = positivo;
			1'b1: saida = negativo;
		endcase

endmodule