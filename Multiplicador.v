`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Roberto Chaves García
// 
// Create Date:    15:42:19 09/22/2015 
// Design Name: 
// Module Name:    Multiplicador 
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
module Multiplicador #(parameter N = 25 /* Valor de N*/)(
	input wire [N-1:0] Multiplicandos,
	input wire [N-1:0] Constantes,
	output reg [2*N-1:0] Multip
    );
	 
always@*
begin
Multip = (Multiplicandos*Constantes);
end

endmodule
