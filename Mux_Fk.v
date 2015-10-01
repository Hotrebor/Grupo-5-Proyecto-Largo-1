`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:22:59 09/30/2015 
// Design Name: 
// Module Name:    Mux_Fk 
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
module Mux_Fk(fk,fk_1,fk_2,sel,out);
	input [24:0] fk, fk_1, fk_2;
	input [1:0] sel;
	output reg [24:0] out;
	always @(fk or fk_1 or fk_2 or sel)
		case (sel)
			2'b00: out=fk;
			2'b01: out=fk_1;
			2'b10: out=fk_2;
			default: out=0;
		endcase


endmodule


