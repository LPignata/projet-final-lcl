<<<<<<< HEAD
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
=======
>>>>>>> d00b66f51affabbb7ed1a24ef214f000a1e06133
module seletorSAVE (input logic okSAVE, input[7:0]q, input[7:0]num, output[7:0]d);

always @(*)
	
	if(okSAVE == 1) begin
		d = num;
	end
	else begin
		d = q;
	end

endmodule
<<<<<<< HEAD
>>>>>>> masterv2
=======
>>>>>>> d00b66f51affabbb7ed1a24ef214f000a1e06133
		