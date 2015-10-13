`timescale 1ns / 1ps
`include "constantes.h"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:55:19 09/22/2015 
// Design Name: 
// Module Name:    Truncamiento 
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
module Truncamiento/*( 
 input wire signed [2*`n-1:0] entrada,
 output wire signed [`n-1:0] resultado
);
 
 //FORMATO DEL LA PALABRA A TRUNCAR = S1 S2 P1 P2 F1 F2
parameter para0 = {(`n-`f){1'b0}};
parameter para1 = {(`n-`f){1'b1}};
parameter para2 = {(2*`n-`f-1){1'b1}};
parameter suma = {1'b1,{(`f){1'b0}}};
parameter f1 = 2*`f-1; // MSB de f1
parameter s1 = 2*`n-1; // Bit de s1
parameter s2 = 2*`n-2; // Bit de s2
parameter p = `n-`f-1; // Parte Entera
parameter p1 = `n+`f-1; // LSB de p1
parameter p2 = `n+`f-2; // MSB de p2

wire [2*`n-1:0] numero;

assign numero = (entrada[`f-1]==1 && entrada[s2:`f] != para2)
					? {entrada + suma}:
					   entrada;
assign resultado = (numero[s1]==1 && numero[s2:p1] != para1)   // si el signo es negativo y NO todos los bits de s2 y p1 son 1 entonces 
						? {numero[s1],{(p+`f){1'b0}}}:                // hay overflow y se asigna el valor más negativo
						(numero[s1]==0 && numero[s2:p1] != para0)	   //si el signo es positivo y NO todos los bits de s2 y p1 son 0 entonces 	
						? {numero[s1],{(p+`f){1'b1}}}:                //hay overflow y se asigna el valor más positivo
						{numero[s1],numero[p2:`f]}; // si no se dan esas condiciones, entonces el truncamiento si se puede realizar sin
																				   //sin necesidad de limitarlo porque no hay overflow
endmodule */


#(parameter cant_bits = 25, ent = 10, frac = 14)(
 input wire signed [2*ent+2*frac:0] in,
 output reg signed [cant_bits-1:0] out
 );

initial out = 0;

localparam [cant_bits-2:0] ceros = 0,
 unos = ~ceros;
 
wire [2*ent+2*frac:0] aux;
assign aux = in;
 
always @ *
 begin
 if(aux[2*ent+2*frac]==0 & aux[2*cant_bits-3:2*frac+ent]>0) //overflow
 out = {1'b0,unos};
 else if(aux[2*ent+2*frac]==1 & (&aux[2*ent+2*frac-1:(2*frac+ent)])==0) //overflow negativo 
 out = {1'b1,ceros}; 
 else
 out = {aux[2*ent+2*frac],aux[2*frac+ent-1:frac]};
 end
endmodule 