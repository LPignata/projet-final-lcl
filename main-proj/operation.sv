module operation (
	input ready,
	input [3:0] tecla,
	input clearIn,
	input Clock,
	input [7:0] memoryIn,
	input [7:0] result,
	output [7:0] memoryOut,
	output [7:0] numberA,
	output [7:0] numberB,
	output operation,
	output signedMemory,
	output signedNumberA,
	output signedNumberB,
	output clearOut,
	output readyOut,
	output [1:0] estate);

	parameter ADD = 4'b1100;
	parameter SUB = 4'b1011;
	parameter IGUAL = 4'b1101;
	parameter SAVE = 4'b1111;
	parameter RECOVERY = 4'b1110;
	parameter VALUE_A = 2'b00;
	parameter VALUE_B = 2'b01;
	parameter VALUE_IGUAL = 2'b10;
	parameter ZERO_4 = 4'b0000;
	reg [1:0] byEstate = VALUE_A;
	reg [3:0] byTecla = 4'b0000;
	
	function is_number;
		input [3:0] func_tecla;
		is_number = (func_tecla < 4'b1010)?1:0;
	endfunction
	
	function is_operator;
		input [3:0] func_tecla;
		case (func_tecla)
			ADD: is_operator = 1;
			SUB: is_operator = 1;
			default: is_operator = 0;
		endcase
	endfunction

	always @(negedge Clock)
	begin
		if (clearIn == 0) begin
			// Iniciando
			byEstate = VALUE_A;
			estate = byEstate;
			byTecla = 4'b0000;
			clearOut = 1;
		end
		else if (ready == 1) begin
			// Se uma tecla for pressionada
			clearOut = 0;
			byTecla = tecla;
			estate = byEstate;
			readyOut = ~ready;
			// Primeiro estado, leitura do primeiro valor e de operação
			if (byEstate == VALUE_A) begin
				if (byTecla == SAVE) begin
					/*memoryOut[7:4] = ZERO_4;
					memoryOut[3:0] = byTecla;*/
					memoryOut = numberA;
					signedMemory = 1;
				end
				else if (byTecla == RECOVERY) begin
					numberA = memoryIn;
					signedNumberA = 1;
				end
				else if (is_operator(byTecla) == 1) begin
					operation = (byTecla == SUB)?1:0;
					byEstate = VALUE_B;
				end
				else if (is_number(byTecla) == 1) begin
					numberA[7:4] = ZERO_4;
					numberA[3:0] = byTecla;
					signedNumberA = 1;
				end
			end
			// Segundo estado, leitura do segundo valor e igualdade
			else if (byEstate == VALUE_B) begin
				if (byTecla == SAVE) begin
					/*memoryOut[7:4] = ZERO_4;
					memoryOut[3:0] = byTecla;*/
					memoryOut = numberB;
					signedMemory = 1;
				end
				else if (byTecla == RECOVERY) begin
					numberB = memoryIn;
					signedNumberB = 1;
				end
				else if (byTecla == IGUAL) begin
					byEstate = VALUE_IGUAL;
				end
				else if (is_number(byTecla) == 1) begin
					numberB[7:4] = ZERO_4;
					numberB[3:0] = byTecla;
					signedNumberB = 1;
				end
			end
			else begin
			// Terceiro estado, salvar resultado ou reiniciar
				if (byTecla == SAVE) begin
					memoryOut = result;
					signedMemory = 1;
				end
				else if (is_number(byTecla) == 1 || byTecla == RECOVERY) begin
					byEstate = VALUE_A;
					numberA = 8'b00000000;
					signedNumberA = 1;
					numberB = 8'b00000000;
					signedNumberB = 1;
				end
			end
		end
		else begin
			clearOut = 0;
			signedMemory = 0;
			signedNumberA = 0;
			signedNumberB = 0;
			signedOperation = 0;
			readyOut = ~ready;
		end
	end
	
endmodule