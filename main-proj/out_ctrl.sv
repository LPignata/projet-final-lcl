module out_ctrl(
	input [1:0] estate,
	input [7:0] mem1,
	input [7:0] mem2,
	input [7:0] result,
	input clk,
	output [7:0] numA,
	output [7:0] numB,
	output [7:0] numRes,
	output [2:0] apaga_d
);

// controle das saidas
always @(negedge clk)
	begin
		if(estate == 2'b00) begin
			// acende apenas o display do numero A
			numA = mem1;
			numB = 4'b0000;
			numRes = 4'b0000;
			apaga_d = 3'b011;
		end
		else if(estate == 2'b01) begin
			// acende os displays do numero A e B
			numA = mem1;
			numB = mem2;
			numRes = 4'b0000;
			apaga_d = 3'b001;
		end
		else if(estate == 2'b10) begin
			// acende os displays dos numeros A, B e result
			numA = mem1;
			numB = mem2;
			numRes = result;
			apaga_d = 3'b000;
		end
		else if(estate == 2'b11) begin
			numA = 4'b0000;
			numB = 4'b0000;
			numRes = 4'b0000;
			apaga_d = 3'b111;
		end
	end

endmodule