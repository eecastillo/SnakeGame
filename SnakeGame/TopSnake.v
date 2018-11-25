`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:19:55 11/23/2018 
// Design Name: 
// Module Name:    TopSnake 
// Project Name: 
// Target Devices: 
// Tool versions: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module TopSnake(
	output reg [15:0] led,
	input clk,
	input derecha,
	input izquierda,
	input start,
	input reset
    );
	
	wire clkSlw;
	ClkRedu redu (.clk(clk), .reset(reset), .clkSlow(clkSlw));
	reg [3:0] estado;
	reg [3:0] tamSnake;
	reg sentido; //sentido en 0 significa que movemos las columnas, sentido en 1 significa que movemos las filas
	always @(posedge clkSlw,posedge reset)
	begin
		if(reset)
			begin
				estado<=8;
				tamSnake <= 3;
				sentido <= 0;
				led<=16'b1101111111100000;
			end
		else
			begin
			case(estado)
				0: begin
					if(derecha || izquierda) 
					begin
						sentido <= sentido +1;
					end 
					if(!sentido)
					begin
						if(led[0] == 1)
						begin
							led[7:0] <=	 led[7:0]>>1;
							led[7] <= 1;
						end
					else
						begin
							led[7:0] <= led[7:0]>>1;
						end
						led[15:8] <= 8'b11011111;//estas son las tierras/filas
					end
					else if(sentido)
					begin
						estado <= 9;
					end
					estado <= estado + 1;
				end
				1: begin
					if(derecha || izquierda) 
						begin
							sentido <= sentido +1;
						end 
					if(!sentido)
					begin
						if(led[0] == 1)
							begin
								led[7:0] <=	 led[7:0]>>1;
								led[7] <= 1;
							end
						else
							begin
								led[7:0] <= led[7:0]>>1;
							end
						led[15:8] <= 8'b11011111;//estas son las tierras/filas
						estado <= estado + 1;
					end
					else if(sentido)
					begin
						estado <= estado+9;
					end
						
				end
				2: begin
					if(derecha || izquierda) 
						begin
							sentido <= sentido +1;
						end 
					if(!sentido)
					begin
							
						if(led[0] == 1)
							begin
								led[7:0] <=	 led[7:0]>>1;
								led[7] <= 1;
							end
						else
							begin
								led[7:0] <= led[7:0]>>1;
							end
						led[15:8] <= 8'b11011111;//estas son las tierras/filas
						
							estado <= estado + 1;
					end
					else if(sentido)
					begin
						estado <= estado+9;
					end
				end
				3: begin
					if(derecha || izquierda) 
					begin
						sentido <= sentido +1;
					end 
					if(!sentido)
					begin
						if(led[0] == 1)
						begin
							led[7:0] <=	 led[7:0]>>1;
							led[7] <= 1;
						end
					else
						begin
							led[7:0] <= led[7:0]>>1;
						end
					led[15:8] <= 8'b11011111;//estas son las tierras/filas
					
						estado <= estado + 1;
					end 
					else if(sentido)
					begin
						estado <= estado+9;
					end
					
				end
				4: begin
					if(derecha || izquierda) 
					begin
						sentido <= sentido +1;
					end 
					if(!sentido)
					begin
						if(led[0] == 1)
							begin
								led[7:0] <=	 led[7:0]>>1;
								led[7] <= 1;
							end
						else
							begin
								led[7:0] <= led[7:0]>>1;
							end
						led[15:8] <= 8'b11011111;//estas son las tierras/filas
						
							estado <= estado + 1;
					end 
					else if(sentido)
					begin
						estado <= estado + 1; 
					end
				end
				5: begin
					if(derecha || izquierda) 
					begin
						sentido <= sentido +1;
					end 
					if(!sentido)
					begin
						if(led[0] == 1)
							begin
								led[7:0] <=	 led[7:0]>>1;
								led[7] <= 1;
							end
						else
							begin
								led[7:0] <= led[7:0]>>1;
							end
						led[15:8] <= 8'b11011111;//estas son las tierras/filas
						
							estado <= estado + 1;
					end
					else if(sentido)
					begin
						estado <= estado + 1;
					end
				end
				6: begin
					if(derecha || izquierda) 
					begin
						sentido <= sentido +1;
					end 
					if(!sentido)
					begin
						if(led[0] == 1)
							begin
								led[7:0] <=	 led[7:0]>>1;
								led[7] <= 1;
							end
						else
							begin
								led[7:0] <= led[7:0]>>1;
							end
						led[15:8] <= 8'b11011111;//estas son las tierras/filas
					
							estado <= estado + 1;
					end
					else if(sentido)
					begin
						estado <= estado + 9;
					end
				end
				7: begin
					if(derecha || izquierda) 
					begin
						sentido <= sentido +1;
					end 
					if(!sentido)
					begin
						if(led[0] == 1)
							begin
								led[7:0] <=	 led[7:0]>>1;
								led[7] <= 1;
							end
						else
							begin
								led[7:0] <= led[7:0]>>1;
							end					
							led[15:8] <= 8'b11011111;//estas son las tierras/filas
					
							estado <= 0;
					end
					if(sentido)
					begin
						estado <= estado +9;
					end
				end
				8: begin
					if(start) estado <= 0;
					else estado <= 8;
				end
				9: begin //Comienza el recorrido de bits para la conexión de tierras
					if(derecha || izquierda) 
					begin
						sentido <= sentido +1;
					end 
					if(sentido)
					begin
						led[15:8] <= 8'b11011111;
						estado <= estado + 1;
					end
				end
				10: begin
					if(derecha || izquierda) 
					begin
						sentido <= sentido +1;
					end 
					if(sentido)
					begin
						led[15:8] <= 8'b11011111;
						estado <= estado + 1;
					end
				end
				11: begin
					if(derecha || izquierda) 
					begin
						led[15:8] <= 8'b11011111;
						sentido <= sentido +1;
					end
					if(sentido)
					begin
						led[15:8] <= 8'b11011111;
						estado <= estado + 1;
					end
					
				end
				12: begin
					if(derecha || izquierda) 
					begin
						sentido <= sentido +1;
					end
					if(sentido)
					begin
						led[15:8] <= 8'b11011111;
						estado <= estado + 1;
					end
				end
				13: begin
					if(derecha || izquierda) 
					begin
						sentido <= sentido +1;
					end 
					if(sentido)
					begin
						led[15:8] <= 8'b11011111;
						estado <= estado + 1;
					end
				end
				14: begin
					if(derecha || izquierda) 
					begin
						sentido <= sentido +1;
					end
					if(sentido)
					begin
						led[15:8] <= 8'b11011111;
						estado <= estado + 1;
					end
				end
				15: begin
					if(derecha || izquierda) 
					begin
						sentido <= sentido +1;
					end
					if(sentido)
					begin
						led[15:8] <= 8'b11011111;
						estado <= estado + 1;
					end
				end
				16: begin
					if(derecha || izquierda) 
					begin
						sentido <= sentido +1;
					end
					if(sentido)
					begin
						led[15:8] <= 8'b11011111;
						estado <= estado + 1;
					end					
				end
				17: begin
					if(derecha || izquierda) 
					begin
						sentido <= sentido +1;
					end 
					if(sentido)
					begin
						led[15:8] <= 8'b11011111;
						estado <= 9;
					end
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
