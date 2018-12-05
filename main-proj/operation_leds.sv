module operation_leds(
	input op,
	input [1:0] estate,
	output led1,
	output led0
);

always @(*) begin
	if(estate == 2'b00) begin
		led1 = 0;
		led0 = 0;
	end
	else if(estate >= 2'b01) begin
		if(op == 0)
			led1 = 0;
		else
			led1 = 1;
			
		led0 = ~led1;
	end
end

endmodule