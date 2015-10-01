`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:09:24 10/01/2015 
// Design Name: 
// Module Name:    acumulador 
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
module acumulador#(parameter N = 25 /* Valor de N*/)(
 input wire [2*N-1:0] In,
 input wire clk,
 output wire [2*N-1:0] Acumulado
    );

reg [2*N-1:0] Acum;

always@(posedge clk)
 begin 
  if(In == Acum)
   Acum <= Acum;
  else
   Acum <= In;
 end

assign Acumulado = Acum;

endmodule