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
module Control_filtro(
 input wire Bandera,clk,
 output wire [2:0] sel_const,
 output wire [1:0] sel_fun,sel_acum,
 output wire Band_Listo,SH_R
 );

//Varaibles
	reg [2:0] sel_c,est_sig,est_act;
	reg [1:0] sel_f,sel_a;
	reg Listo,shift;
	integer contador;
	initial
		begin
			sel_c=0;
			sel_f=0;
			sel_a=0;
			Listo=0;
		end

	//Parte Secuencial 

always@(posedge clk)
	begin
	 if(Bandera)
		 begin
			 est_act <= 3'b000;
			 contador=0;
		 end
	 else 
		 begin
			 est_act <= est_sig; 
			 contador=contador+1;
		 end
	end


	//Parte combinacional 

	always@*
		begin
			if (contador <= 5)
				begin
					case(est_act)
						3'b000:
							begin
								 sel_c = 0;
								 sel_f = 2'b01;
								 sel_a = 2'b01;
								 est_sig = 3'b001;
								 Listo = 0;
								 shift = 0;
							end
	 
						3'b001:
							begin 
								 sel_c = 3'b001;
								 sel_f = 2'b10;
								 sel_a = 2'b10;
								 est_sig = 3'b010;
								 Listo = 0;
								 shift = 1;
							end
	 
						3'b010:
							begin
								 sel_c = 3'b010;
								 sel_f = 2'b00;
								 sel_a = 2'b00;
								 est_sig = 3'b011;
								 Listo = 0;
								 shift = 0;
							end
	 
						3'b011:
							begin
								 sel_c = 3'b011;
								 sel_f = 2'b01;
								 sel_a = 2'b10;
								 est_sig = 3'b100;
								 Listo = 0;
								 shift = 0;
							end
			
						3'b100:
							begin
								 sel_c = 3'b100;
								 sel_f = 2'b10;
								 sel_a = 2'b10;
								 est_sig = 3'b000;
								 Listo = 1;
								 shift = 0;
							end
	 
						/*3'b101:
							begin
								sel_c = 3'b101;
								sel_f = 2'b10;
								sel_a =2'b10;
								est_sig = 3'b000;
								Listo = 1;
								shift = 0;
							end*/
						default:
							begin
							 sel_c = 0;
							 sel_f = 0;
							 sel_a = 2'b01;
							 est_sig = 3'b000;
							 Listo = 0;
							 shift = 0;
							end
					endcase 
				end
			else 
				begin
					est_sig = 3'b000;
				end
		end

	assign sel_const = sel_c;
	assign sel_fun = sel_f;
	assign sel_acum = sel_a;
	assign Band_Listo = Listo;
	assign SH_R=shift;
	endmodule
