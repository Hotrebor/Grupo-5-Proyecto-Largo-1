`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:13:15 10/07/2015 
// Design Name: 
// Module Name:    Filtro 
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
module Filtro #(parameter N = 25 /* Valor de N*/)(
 input wire [N-1:0] Uk,
 
input wire Clk,Bandera_ADC,
 
output wire [N-1:0] Yk,
 
output wire Bandera_Listo
    );

	wire [2:0] SelectorConst;
	wire [1:0] SelectorFk,sel_acum;
	wire [N-1:0] Fk, Fk_1, Fk_2, outc, outf, outa,trunc;
	wire [2*N-1:0] outari;
	

	
	Control_filtro instance_Control (
    .Bandera(Bandera_ADC), 
    .clk(Clk), 
    .sel_const(SelectorConst), 
    .sel_fun( SelectorFk), 
    .sel_acum(sel_acum), 
    .Band_Listo(Bandera_Listo), 
    .SH_R(SH_R)
    );
	 
	 Mux_Ac instance_Mux_Acumulador (
    .uk(Uk), 
    .acum(Yk), 
    .sel(sel_acum), 
    .out(outa)
    );
	 
	 Mux_Constantes instance_Mux_Constantes(
    .selector(SelectorConst), 
    .Constantes(outc)
    );
	 
	 Mux_Fk instance_Mux_Fk (
    .fk(Fk), 
    .fk_1(Fk_1), 
    .fk_2(Fk_2), 
    .sel(SelectorFk), 
    .out(outf)
    );

	Aritmetica instance_Aritmetica (
    .Constantes_G(outc), 
    .Multip_G(outf), 
    .Entrada_G(outa), 
    .Valores(outari)
    );
	 
	 Truncamiento instance_Truncamiento(
    .in(outari), 
    .out(trunc)
    );

	 
	 acumulador instance_Acumulador (
    .In(trunc), 
    .clk(Clk), 
    .Acumulado(Yk)
    );
	 
	 Desplazamiento_fk instance_Desplazamiento (
    .In(trunc), 
    .shift(SH_R), 
    .clk(Clk), 
    .fk(Fk), 
    .fk_1(Fk_1), 
    .fk_2(Fk_2)
    );


endmodule
