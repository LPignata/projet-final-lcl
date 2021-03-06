module ula(
	input [7:0] A,
	input [7:0] B,
	input op, // Cin (operacao)
	output S[7:0]
);

wire btemp[7:0]; // b temporario, para somar
wire cout[7:0]; // cout, temporario

// executa as somas bit a bit
mux2 m0(B[0], ~B[0], op, btemp[0]); // seleciona se B ou not B vao pra soma (depende do sinal, cin)
fadder f0(A[0], btemp[0], op, S[0], cout[0]); // realiza a soma de acordo com o B selecionado

mux2 m1(B[1], ~B[1], op, btemp[1]);
fadder f1(A[1], btemp[1], cout[0], S[1], cout[1]);

mux2 m2(B[2], ~B[2], op, btemp[2]);
fadder f2(A[2], btemp[2], cout[1], S[2], cout[2]);

mux2 m3(B[3], ~B[3], op, btemp[3]);
fadder f3(A[3], btemp[3], cout[2], S[3], cout[3]);

mux2 m4(B[4], ~B[4], op, btemp[4]);
fadder f4(A[4], btemp[4], cout[3], S[4], cout[4]);

mux2 m5(B[5], ~B[5], op, btemp[5]);
fadder f5(A[5], btemp[5], cout[4], S[5], cout[5]);

mux2 m6(B[6], ~B[6], op, btemp[6]);
fadder f6(A[6], btemp[6], cout[5], S[6], cout[6]);

mux2 m7(B[7], ~B[7], op, btemp[7]);
fadder f7(A[7], btemp[7], cout[6], S[7], cout[7]);

endmodule

// multiplexador de 2 entradas
module mux2(
	input in0, // b
	input in1, // not B
	input seletor,
	output saida
);
wire in[1:0];
assign in[0] = in0;
assign in[1] = in1;

// se seletor for 1, seleciona o NOT B 
assign saida = in[seletor];

endmodule

// somador completo
module fadder(
	input A,
	input B,
	input Cin,
	output S,
	output Cout
);

assign {Cout, S} = A+B+Cin;

endmodule