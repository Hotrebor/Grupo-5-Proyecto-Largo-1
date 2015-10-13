`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:08:03 09/30/2015 
// Design Name: 
// Module Name:    Mux_Ac 
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
module Mux_Ac #(parameter N = 25 /* Valor de N*/)(uk,acum,sel,out);
	input [N-1:0] uk,acum;
	input [1:0] sel;
	output reg [N-1:0] out;
	always @(uk or acum or sel)
		case (sel)
			2'd0: out=0;
			2'd1: out=uk;
			2'd2: out=acum;
			default: out=0;
		endcase

endmodule
