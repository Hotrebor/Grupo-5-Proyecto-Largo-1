`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:35:12 09/30/2015 
// Design Name: 
// Module Name:    desplazamiento 
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
module desplazamiento#(parameter N = 25 /* Valor de N*/)( in,shift,fk,fk_1,fk_2
    );
	input [2*N-1:0] in;
	input shift;
	
	output wire [2*N-1:0]  fk,fk_1,fk_2;
	
	reg [2*N-1:0] fkold,fkold_1,fknew;
	
	always @ (posedge shift)
		begin
			fknew=in;
			fkold=fk;
			fkold_1=fk_1;
			
		end
	assign fk=fknew;
	assign fk_1=fkold;
	assign fk_2=fkold_1;
	
endmodule
