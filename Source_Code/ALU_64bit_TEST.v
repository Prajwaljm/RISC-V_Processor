`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:07:01 03/06/2021
// Design Name:   ALU_64bit
// Module Name:   C:/Verilog_projects/COA-Assignment-2-5/ALU_64bit_TEST.v
// Project Name:  COA-Assignment-2-5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU_64bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_64bit_TEST;

	// Inputs
	reg signed [63:0] A;
	reg signed [63:0] B;
	reg [3:0] ALU_Op;
   
	// Outputs
	wire signed [63:0] R;
	wire zero;
	wire Overflow;
	wire CarryOut;
	
	//local wires
	wire Ainv, Binv;
	wire [1:0] Op;
	
	//assigning local variables.
	assign Ainv = ALU_Op[3];
	assign Binv = ALU_Op[2];
	assign Op[1] = ALU_Op[1];
	assign Op[0] = ALU_Op[0];
	
	
	// Instantiate the Unit Under Test (UUT)
	ALU_64bit uut (
		.R(R), 
		.zero(zero), 
		.Overflow(Overflow), 
		.CarryOut(CarryOut), 
		.A(A), 
		.B(B), 
		.ALU_Op(ALU_Op)
	);
	
	
	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		ALU_Op = 0;
		

		// Wait 100 ns for global reset to finish
		#10
        
		$monitor($time,"		A=%d B=%d		Ainv=%b Binv=%b Op=%b		R=%d Cout=%b zero=%b Overflow=%b\n", A, B, Ainv, Binv, Op, R, CarryOut, zero, Overflow);
		
		// Add stimulus here
		#5  A=20; B=120; ALU_Op=4'b0000; //A&B
		#5  A=20; B=120; ALU_Op=4'b1100; //A'&B' = (A|B)'
		#5  A=20; B=120; ALU_Op=4'b0001; //A|B
		#5  A=20; B=120; ALU_Op=4'b1101; //A'|B' = (A&B)' 
		#5  A=20; B=120; ALU_Op=4'b0010; //A+B
		#5  A=20; B=120; ALU_Op=4'b0110; //A-B
		#5  A=120; B=20; ALU_Op=4'b0110; //A-B
		#5  A=20; B=120; ALU_Op=4'b0111; //A<B
		#5  A=120; B=20; ALU_Op=4'b0111; //A<B
		#5  A=20; B=20; ALU_Op=4'b0110; //A-B
		
		//#5  A=5; B=3; ALU_Op=4'b0010;
		
		//to show one overflow condition
		#5  A=64'b0100000000000000000000000000000000000000000000000000000000000000; /*2^62*/ B=64'b0100000000000000000000000000000000000000000000000000000000000000; /*2^62*/ ALU_Op=4'b0010;
		
		//#5  A=7; B=9; ALU_Op=4'b0010;
		//#5  A=7; B=9; ALU_Op=4'b0110;
		//#5  A=9; B=9; ALU_Op=4'b0110;
		//#5  A=4; B=6; ALU_Op=4'b0111;
		//#5  A=10; B=9; ALU_Op=4'b0111;
		//#5  A=-5; B=2; ALU_Op=4'b0010;
		
		
		#10 $finish;
	end
      
endmodule

