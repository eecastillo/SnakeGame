`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITESO
// Engineer: Cuauht�moc Aguilera
// 
//////////////////////////////////////////////////////////////////////////////////
module ps2_key(
    input data,
    input clk,
    input reset,
    output reg [10:0] q
    );




always @(posedge reset, posedge clk)
	begin
		if (reset) 
			q<= 0;
		else 
			q[10:0]<= {data,q[10:1]};
			
	end
endmodule



	


