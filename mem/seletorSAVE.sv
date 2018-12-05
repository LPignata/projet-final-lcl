<<<<<<< HEAD
module seletorSAVE (input logic okSAVE, input[7:0]q, input[7:0]num, output[7:0]d);

always @(*)
	
	if(okSAVE == 1) begin
		d = num;
	end
	else begin
		d = q;
	end

endmodule
=======
module seletorSAVE (input logic okSAVE, input[7:0]q, input[7:0]num, output[7:0]d);

always @(*)
	
	if(okSAVE == 1) begin
		d = num;
	end
	else begin
		d = q;
	end

endmodule
>>>>>>> masterv2
		