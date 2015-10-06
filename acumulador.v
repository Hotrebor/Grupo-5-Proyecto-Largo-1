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
 output wire [2*N-1:0] Acumulado,
 output wire signal
    );

reg [2*N-1:0] Acum;
reg senal;
initial
begin
Acum=0;
end
always@(posedge clk)
 begin 
  if(In == Acum)
  begin
   Acum <= Acum;
	senal<=0;
	end
  else
	begin
   Acum <= In;
	senal<=1;
	end
 end

assign Acumulado = Acum;
assign signal=senal;

endmodule
