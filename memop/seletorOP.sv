module seletorOP (input logic okOP, input q, input op, output d);

always @(*)
	
	if(okOP == 1) begin
		d = op;
	end
	else begin
		d = q;
	end

endmodule