`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:03:54 09/30/2015 
// Design Name: 
// Module Name:    Desplazamiento_fk 
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
module Desplazamiento_fk #(parameter N = 25)(
 input wire[N-1:0] In,
 input wire shift,clk,
 output wire[N-1:0] fk,fk_1,fk_2
    );  

//Variables
reg [N-1:0] fk_old1,fk_old2,fk_ac;


initial
begin
fk_old1=0;
fk_old2=0;
fk_ac=0;
end

always@(posedge shift)
begin
fk_old1 <= fk;
fk_old2 <= fk_1;
fk_ac <= In; 
end


assign fk = fk_ac;
assign fk_1 = fk_old1;
assign fk_2 = fk_old2;

endmodule
