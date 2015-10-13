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
 input wire [N-1:0] In,
 input wire clk,
 output wire [N-1:0] Acumulado
    );

reg [N-1:0] Acum;
initial
begin
Acum=0;
end
always@(posedge clk)
 begin 
  if(In == Acum)
  begin
   Acum <= Acum;
	end
  else
	begin
   Acum <= In;
	end
 end

assign Acumulado = Acum;

endmodule
