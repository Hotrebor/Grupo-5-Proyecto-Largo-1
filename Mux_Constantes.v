`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:01:16 09/30/2015 
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
module Mux_Constantes #(parameter N = 25 /* Valor de N*/)(sel,out
    );
input [2:0] sel;
output reg [N-1:0] out; 
/*200hz
a1=25'b1111000001010001111010111; //-1.96
a2=25'b0000011110101111000110101; //0.9605
b0=25'b0000000000000000011010001; //0.000199
b1=25'b0000000000000000110100001; //0.0003979
b2=25'b0000000000000000011010001; //0.000199 */
always @*
	case (sel)
		3'b000: out=25'b1111000001010001111010111 ;
		3'b001: out=25'b0000011110101111000110101;
		3'b010: out=25'b0000000000000000011010001 ;
		3'b011: out=25'b0000000000000000110100001 ;
		3'b100: out=25'b0000000000000000011010001 ;
		default: out=25'b0 ;
	endcase

endmodule
