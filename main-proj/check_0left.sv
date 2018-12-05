module check_0left(
	input [3:0] num,
	input sinal,
	input apaga,
	output zera
);

always @(*)
	begin
		if(apaga == 0) begin
			if(num == 4'b0000) begin
				if(sinal == 0)
					zera = 1;
				else
					zera = 0;
			end else
				zera = 0;
		end
		else if(apaga == 1) begin
			zera = 1;
		end
	end
	
endmodule