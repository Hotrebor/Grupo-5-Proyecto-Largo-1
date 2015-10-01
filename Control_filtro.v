`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:01:27 09/30/2015 
// Design Name: 
// Module Name:    Control_filtro 
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
module Control_filtro(clk,bandera,Sel_cons,Sel_fk,Sel_ac,listo
    );
	 //entradas
	 input clk,bandera;
	 //salidas
	 output wire [2:0] Sel_cons;
	 output wire [1:0] Sel_fk;
	 output wire Sel_ac,listo;
	 // variables
	 reg [2:0] Sel_c,est_sig,est_act;;
	 reg [1:0] Sel_f;
	 reg Sel_a,ready;	
	 
/////////////////////////////////////////////
	 //parte secuencial
	 always @ (posedge clk )
	 begin
		est_act<=est_sig;
	 end
	 //parte combinacional
	 always @(posedge bandera)
	 begin
		case(est_act)
				3'b000:
					begin
						Sel_c=3'b0;
						Sel_f=2'b0;
						Sel_a=0;
						est_sig=3'b001;
						ready=0;
					end
				3'b001:
					begin
						Sel_c=3'b0;
						Sel_f=2'b01;
						Sel_a=1;
						est_sig=3'b010;
						ready=0;
					end
				3'b010:
					begin
						Sel_c=3'b001;
						Sel_f=2'b10;
						Sel_a=1;
						est_sig=3'b011;
						ready=0;
					end
				3'b011:
					begin
						Sel_c=3'b010;
						Sel_f=2'b0;
						Sel_a=1;
						est_sig=3'b100;
						ready=0;
					end
				3'b100:
					begin
						Sel_c=3'b011;
						Sel_f=2'b01;
						Sel_a=1;
						est_sig=3'b101;
						ready=0;
					end
				3'b101:
					begin
						Sel_c=3'b100;
						Sel_f=2'b10;
						Sel_a=1;
						est_sig=3'b000;
						ready=1;
					end
			endcase
	 end
	 assign Sel_cons=Sel_c;
	 assign Sel_fk=Sel_f;
	 assign Sel_ac= Sel_a;
	 assign listo=ready;
	 


endmodule
