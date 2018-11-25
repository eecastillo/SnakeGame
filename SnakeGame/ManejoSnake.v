`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:07:55 11/24/2018 
// Design Name: 
// Module Name:    ManejoSnake 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ManejoSnake(
	input [7:0] tierras,
	input [7:0] voltajes,
	input reset,
	input clk,
	input start,
	output reg [15:0] led
    );
	reg [3:0] estado;
	
	always @(posedge clk,posedge reset)
	begin
		if(reset)
			begin
				estado<=8;
				led<=16'b1101111111000000;
			end
		else
			begin
			case(estado)
				0: begin
					led[7:0] <=	 8'b11000000;
					
					led[15:8] <= 8'b11011111;//estas son las tierras/filas
					
					
						estado <= estado + 1;
				end
				1: begin
					led[7:0] <=	 8'b01100000;
					led[15:8] <= 8'b11011111;//estas son las tierras/filas
					
						estado <= estado + 1;
				end
				2: begin
					led[7:0] <=	 8'b00110000;
					led[15:8] <= 8'b11011111;//estas son las tierras/filas
					
						estado <= estado + 1;
				end
				3: begin
					led[7:0] <=	 8'b00011000;
					led[15:8] <= 8'b11011111;//estas son las tierras/filas
					
						estado <= estado + 1;
				end
				4: begin
					led[7:0] <=	 8'b00001100;
					led[15:8] <= 8'b11011111;//estas son las tierras/filas
					
						estado <= estado + 1;
				end
				5: begin
					led[7:0] <=	 8'b00000110;
					led[15:8] <= 8'b11011111;//estas son las tierras/filas
					
						estado <= estado + 1;
					
				end
				6: begin
					led[7:0] <=	 8'b00000011;
					led[15:8] <= 8'b11011111;//estas son las tierras/filas
				
						estado <= estado + 1;
				end
				7: begin
					led[7:0] <=	 8'b10000001;
					led[15:8] <= 8'b11011111;//estas son las tierras/filas
				
						estado <= 0;
				end
				8: begin
					if(start) estado <= 0;
					else estado <= 8;
				end
				default: begin
					estado<=0;
					led[7:0] <=	 8'b11000000;
					led[15:8] <= 8'b11011111;//estas son las tierras/filas
					end
			endcase
		end
	end

endmodule
