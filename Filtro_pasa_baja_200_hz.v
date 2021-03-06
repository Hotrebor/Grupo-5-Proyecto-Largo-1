`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:05:50 10/01/2015 
// Design Name: 
// Module Name:    Filtro_pasa_baja_200_hz 
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
module Filtro_pasa_baja_200_hz #(parameter N = 25 /* Valor de N*/)(
 input wire [N-1:0] Uk,
 input wire Clk,Bandera_ADC,
 output wire [N-1:0] Yk,
 output wire Bandera_Listo
    );

wire [2:0] SelectorConst;
wire [1:0] SelectorFk;
wire [N-1:0] Const,InAcum,InMul,Trunacum,Trunfk,Trunfk_1,Trunfk_2;
wire [2*N-1:0] ResultArim,Racum,Rfk,Rfk_1,Rfk_2;

Control_filtro instance_Control (
    .Bandera(Bandera_ADC), 
    .clk(Clk), 
	 .se(signal),
    .sel_const(SelectorConst), 
    .sel_fun(SelectorFk), 
    .sel_acum(sel_acum), 
    .Band_Listo(Bandera_Listo)
    );


Mux_Constantes instance_MuxConstantes(
    .sel(SelectorConst), 
    .out(Const)
    );
  
Mux_Ac instance_Mux_ac (
    .uk(Uk), 
    .acum(Trunacum), 
    .sel(sel_acum), 
    .out(InAcum)
    );

 Mux_Fk instance_Mux_Fk (
    .fk(Trunfk), 
    .fk_1(Trunfk_1), 
    .fk_2(Trunfk_2), 
    .sel(SelectorFk), 
    .out(InMul)
    );

  
Aritmetica instance_Aritmetica (
    .Constantes_G(Const), 
    .Multip_G(InMul), 
    .Entrada_G(InAcum), 
    .Valores(ResultArim)   
    );
	 
Desplazamiento_fk instance_Shift_Reg (
    .In(ResultArim), 
    .shift(~sel_acum), 
	 .clk(Clk),
    .fk(Rfk), 
    .fk_1(Rfk_1), 
    .fk_2(Rfk_2)
    );
  
acumulador instance_Acumulador (
    .In(ResultArim), 
    .clk(Clk), 
    .Acumulado(Racum),
    .signal(signal)
    );


  
Truncamiento instance_TruncamientoFk (
    .Datos_Sum(Rfk), 
    .Datos_Trunc(Trunfk)
    );

Truncamiento instance_TruncamientoFk_1 (
    .Datos_Sum(Rfk_1), 
    .Datos_Trunc(Trunfk_1)
    );

Truncamiento instance_TruncamientoFk_2 (
    .Datos_Sum(Rfk_2), 
    .Datos_Trunc(Trunfk_2)
    );

Truncamiento instance_TruncamientoAcum (
    .Datos_Sum(Racum), 
    .Datos_Trunc(Trunacum)
    );

assign Yk = Trunacum; 
endmodule
