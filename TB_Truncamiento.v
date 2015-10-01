`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Roberto Chaves García
//
// Create Date:   19:47:41 09/24/2015
// Design Name:   Truncamiento
// Module Name: TB_Truncamiento.v
// Project Name:  TercerProyecto
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Truncamiento
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TB_Truncamiento #(parameter N = 25);

	// Inputs
	reg [47:0] Datos_Sum;

	// Outputs
	wire [23:0] Datos_Trunc;

	// Instantiate the Unit Under Test (UUT)
	Truncamiento uut (
		.Datos_Sum(Datos_Sum), 
		.Datos_Trunc(Datos_Trunc)
	);

	reg [2*N-1:0] Array_IN1 [4999:0];

	integer j,Trunc;
	
	initial begin
	
	$readmemb("Bin1.txt", Array_IN1,0,4999);
	Trunc= $fopen("Truncados.txt","w"); //Crea el archivo suma donde se guarda el resultado
	
	
		for(j=0; j<5000; j=j+1) 
			begin
				Datos_Sum = Array_IN1[j]; 
				
				#10;
				$fwrite(Trunc,"%b \n",Datos_Trunc);	
			end
			
	$fclose(Trunc);	
	end
	

	
      
endmodule

