`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITESO
// Engineer: Eduardo Castillo
// 
// Create Date:    11:55:24 10/17/2018 
// Design Name: 
// Module Name:    ClkRedu 
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
module ClkRedu(
    input clk,
    input reset,
    output reg clkSlow //flip-flop de salida
    );
	 
	 reg [24:0] contador; //se especifica 25 bits para un conteo de 25 millones
	 always @ (posedge clk, posedge reset)
		begin
			if(reset)
				begin
					contador <=0;
					clkSlow <=0;
				end
			else
				begin
					contador <= contador + 1; //incrementamos la cuenta del clk
					
						if(contador == (25000000 / 2))
							begin
								clkSlow <= clkSlow + 1; // cambiamos clkSlow
								contador <= 0; //reiniciamos el conteo de ciclos
							end
				end
		end

endmodule
