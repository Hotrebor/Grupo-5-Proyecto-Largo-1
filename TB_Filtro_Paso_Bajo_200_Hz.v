`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:43:52 10/07/2015
// Design Name:   Filtro
// Module Name:   C:/Users/ROBERTO/Dropbox/Universidad/II semestre 2015/Lab de digitales/Proyectos/Proyecto_3_nuevo/TB_Filtro_Paso_Bajo_200_Hz.v
// Project Name:  Proyecto_3_nuevo
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Filtro
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TB_Filtro_Paso_Bajo_200_Hz#(parameter N = 25);

 // Inputs
 reg [N-1:0] Uk;
 reg Clk;
 reg Bandera_ADC;

 // Outputs
 wire [N-1:0] Yk;
 wire Bandera_Listo;

 // Instantiate the Unit Under Test (UUT)
 Filtro uut (
    .Uk(Uk), 
    .Clk(Clk), 
    .Bandera_ADC(Bandera_ADC), 
    .Yk(Yk), 
    .Bandera_Listo(Bandera_Listo)
    );
 
reg [N-1:0] Array_IN1 [999:0];
integer j,Filtro;

localparam T = 23;
 always
 begin
 Clk = 1'b1;
 #(T/2) ;
 Clk = 1'b0;
 #(T/2) ;
 end

/*localparam H = 22655;
 always
 begin
 Bandera_ADC = 1'b1;
 #(H/100) ;
 Bandera_ADC = 1'b0;
 #(H/1.01) ;
 end*/


 initial 
	 begin
	 
		 $readmemb("rampa.txt", Array_IN1,0,999);
		 Filtro= $fopen("ResFiltro200Bajas.txt","w"); //Crea el archivo de la rampa donde se guarda el resultado
		 for(j=0; j<1000; j=j+1) 
			 begin
				 Bandera_ADC = 1;
				 Uk = Array_IN1[j]; 
				 repeat(5) @ (negedge Clk)
				 Bandera_ADC = 0;
				 // @ (posedge Bandera_Listo );
				 $fwrite(Filtro,"%b \n",Yk); 
			 end
		 
		 $fclose(Filtro); 
	 end
 
endmodule 

