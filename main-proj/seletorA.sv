module seletorA(input logic okA, input[7:0] q, input[7:0]num, output [7:0]d);

always@(*)
	
	if(okA == 1) begin
		d = num;
	end
	else begin
		d = q;
	end

endmodule
