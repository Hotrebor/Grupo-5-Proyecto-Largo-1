`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Roberto Chaves García
//
// Create Date:   19:46:37 09/24/2015
// Design Name:   Concatenador
// Module Name:   TB_SingExt.v
// Project Name:  TercerProyecto
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Concatenador
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TB_SingExt#(parameter N = 25);

	// Inputs
	reg [23:0] ValorSuma;

	// Outputs
	wire [47:0] Suma_ext;
	integer j,Ext;
	reg [2*N-1:0] Array_IN1 [4999:0];
	// Instantiate the Unit Under Test (UUT)
	Concatenador uut (
		.ValorSuma(ValorSuma), 
		.Suma_ext(Suma_ext)
	);

	initial begin
	
	$readmemb("ValoresSinExt.txt", Array_IN1,0,4999);
	
	Ext= $fopen("Extendidos.txt","w"); //Crea el archivo suma donde se guarda el resultado
	
	
		for(j=0; j<5000; j=j+1) 
			begin
				ValorSuma = Array_IN1[j]; 
				#10;
				$fwrite(Ext,"%b \n",Suma_ext);
				
			end
			
	$fclose(Ext);	
	end
	
endmodule

