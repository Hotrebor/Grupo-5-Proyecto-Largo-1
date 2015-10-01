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
module Mux_Ac(uk,acum,sel,out);
	input [24:0] uk,acum;
	input sel;
	output reg [24:0] out;
	always @(uk or acum or sel)
		case (sel)
			0: out=uk;
			1: out=acum;
			default: out=0;
		endcase

endmodule
