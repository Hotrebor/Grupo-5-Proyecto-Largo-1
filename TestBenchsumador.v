`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Roberto Chaves García
//
// Create Date:   15:50:23 09/27/2015
// Design Name:   Sumador
// Module Name:   TestBenchsumador.v
// Project Name:  Proyecto_3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Sumador
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TestBenchsumador#(parameter N = 24);

	// Inputs
	reg [2*N-1:0] Sum_ext;
	reg [2*N-1:0] Multiplica;

	// Outputs
	wire [2*N-1:0] Suma_G;

	reg [2*N-1:0] Array_IN1 [4999:0];
	reg [2*N-1:0] Array_IN2 [4999:0];

	integer j,Suma;
	
	// Instantiate the Unit Under Test (UUT)
	Sumador uut (
		.Sum_ext(Sum_ext), 
		.Multiplica(Multiplica), 
		.Suma_G(Suma_G)
	);

	initial begin
	
	$readmemb("Bin1.txt", Array_IN1,0,4999);
	$readmemb("Bin2.txt", Array_IN2,0,4999);
	Suma= $fopen("suma.txt","w"); //Crea el archivo suma donde se guarda el resultado
	
	
		for(j=0; j<4999; j=j+1) 
			begin
				Multiplica = Array_IN1[j]; 
				Sum_ext = Array_IN2[j];
				#10
				$fwrite(Suma,"%b \n",Sum_G);
				
			end
			
	$fclose(Suma);	
	end
	
	
endmodule

