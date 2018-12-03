module seletorB(input logic okB, input[7:0] q, input[7:0]num, output [7:0]d);

always@(*)
	
	if(okB == 1) begin
		d = num;
	end
	else begin
		d = q;
	end

endmodule
