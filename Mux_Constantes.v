`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:01:43 09/30/2015 
// Design Name: 
// Module Name:    Mux_Constantes 
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
module Mux_Constantes(
	input wire[2:0] selector,
	output reg[24:0] Constantes
    );

always@*
	begin
		Constantes = 0;
			case (selector)
				/*3'd0:
					Constantes= 25'b0000000000000000000000000; //0*/
				3'd0:
					Constantes = 25'sb0000000000111110101110001; //-(-1.96)
				3'd1:
					Constantes = 25'sb1111111111100001010000111; //-(0.9605)
				3'd2:	
					Constantes = 25'sb0000000000000000000000011; //0.000199
				3'd3:
					Constantes = 25'sb0000000000000000000000111; //0.0003979
				3'd4:
					Constantes = 25'sb0000000000000000000000011; //0.000199
				default:
					Constantes = 0;
				endcase
	end
endmodule
