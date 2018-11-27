module comp2bin(
	input [7:0] in,
	output [7:0] out
);

// usar somente se o numero for negativo
// subtrair 1 e inverter todos os bits
// multiplexar > se sinal for negativo, entra nesse circuito
// se nao for negativo, continua
// no proximo circuito, transformar binario pra BCD, 
// e saida de sinal deste circuito vai direto pra funcao de imprimir o numero

wire temp_in[7:0];

// subtrai 1 de in
ula u1 (in, 8'b00000001, 1'b1, temp_in);

// inverte todos os bits
assign out[0] = ~temp_in[0];
assign out[1] = ~temp_in[1];
assign out[2] = ~temp_in[2];
assign out[3] = ~temp_in[3];
assign out[4] = ~temp_in[4];
assign out[5] = ~temp_in[5];
assign out[6] = ~temp_in[6];
assign out[7] = ~temp_in[7];

endmodule