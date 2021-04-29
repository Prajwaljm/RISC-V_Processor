`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:06:22 03/05/2021
// Design Name:   ALU_1bit
// Module Name:   C:/Verilog_projects/COA-Assignment-2-5/ALU_1bit_TEST.v
// Project Name:  COA-Assignment-2-5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU_1bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_1bit_TEST;

	// Inputs
	reg A;
	reg B;
	reg Ainv;
	reg Binv;
	reg Cin;
	reg less;
	reg [1:0] Op;

	// Outputs
	wire R;
	wire Cout;
	wire Set;
	wire Overflow;

	// Instantiate the Unit Under Test (UUT)
	ALU_1bit uut (
		.R(R), 
		.Cout(Cout), 
		.Set(Set), 
		.Overflow(Overflow), 
		.A(A), 
		.B(B), 
		.Ainv(Ainv), 
		.Binv(Binv), 
		.Cin(Cin), 
		.less(less), 
		.Op(Op)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		Ainv = 0;
		Binv = 0;
		Cin = 0;
		less = 0;
		Op = 0;

		// Wait 100 ns for global reset to finish
		#95;
       
		 $monitor($time,"		A=%b B=%b		Ainv=%b Binv=%b Cin=%b less=%b Op=%b		R=%b Cout=%b Set=%b Overflow=%b\n", A, B, Ainv, Binv, Cin, less, Op, R, Cout, Set, Overflow);
		// Add stimulus here
		
		//A=0 B=0
		#5 A=1'b0; B=1'b0; 	Ainv=1'b0; Binv=1'b0; Cin=1'bx; less=1'b0; 	Op=2'b00;
		#5 A=1'b0; B=1'b0; 	Ainv=1'b1; Binv=1'b1; Cin=1'bx; less=1'b0; 	Op=2'b00;
		#5 A=1'b0; B=1'b0; 	Ainv=1'b0; Binv=1'b0; Cin=1'bx; less=1'b0; 	Op=2'b01;
		#5 A=1'b0; B=1'b0; 	Ainv=1'b1; Binv=1'b1; Cin=1'bx; less=1'b0; 	Op=2'b01;
		#5 A=1'b0; B=1'b0; 	Ainv=1'b0; Binv=1'b0; Cin=1'b0; less=1'b0; 	Op=2'b10;
		#5 A=1'b0; B=1'b0;	Ainv=1'b0; Binv=1'b0; Cin=1'b1; less=1'b0; 	Op=2'b10;
		#5 A=1'b0; B=1'b0; 	Ainv=1'b0; Binv=1'b1; Cin=1'b0; less=1'b0; 	Op=2'b10;
		#5 A=1'b0; B=1'b0; 	Ainv=1'b0; Binv=1'b1; Cin=1'b1; less=1'b0; 	Op=2'b10;
		#5 A=1'b0; B=1'b0; 	Ainv=1'bx; Binv=1'bx; Cin=1'bx; less=1'b0; 	Op=2'b11;
		#5 A=1'b0; B=1'b0; 	Ainv=1'bx; Binv=1'bx; Cin=1'bx; less=1'b1; 	Op=2'b11;
		
		//A=0 B=1
		#5 A=1'b0; B=1'b1; 	Ainv=1'b0; Binv=1'b0; Cin=1'bx; less=1'b0; 	Op=2'b00;
		#5 A=1'b0; B=1'b1; 	Ainv=1'b1; Binv=1'b1; Cin=1'bx; less=1'b0; 	Op=2'b00;
		#5 A=1'b0; B=1'b1; 	Ainv=1'b0; Binv=1'b0; Cin=1'bx; less=1'b0; 	Op=2'b01;
		#5 A=1'b0; B=1'b1; 	Ainv=1'b1; Binv=1'b1; Cin=1'bx; less=1'b0; 	Op=2'b01;
		#5 A=1'b0; B=1'b1; 	Ainv=1'b0; Binv=1'b0; Cin=1'b0; less=1'b0; 	Op=2'b10;
		#5 A=1'b0; B=1'b1;	Ainv=1'b0; Binv=1'b0; Cin=1'b1; less=1'b0; 	Op=2'b10;
		#5 A=1'b0; B=1'b1; 	Ainv=1'b0; Binv=1'b1; Cin=1'b0; less=1'b0; 	Op=2'b10;
		#5 A=1'b0; B=1'b1; 	Ainv=1'b0; Binv=1'b1; Cin=1'b1; less=1'b0; 	Op=2'b10;
		#5 A=1'b0; B=1'b1; 	Ainv=1'bx; Binv=1'bx; Cin=1'bx; less=1'b0; 	Op=2'b11;
		#5 A=1'b0; B=1'b1; 	Ainv=1'bx; Binv=1'bx; Cin=1'bx; less=1'b1; 	Op=2'b11;
		
		//A=1 B=0
		#5 A=1'b1; B=1'b0; 	Ainv=1'b0; Binv=1'b0; Cin=1'bx; less=1'b0; 	Op=2'b00;
		#5 A=1'b1; B=1'b0; 	Ainv=1'b1; Binv=1'b1; Cin=1'bx; less=1'b0; 	Op=2'b00;
		#5 A=1'b1; B=1'b0; 	Ainv=1'b0; Binv=1'b0; Cin=1'bx; less=1'b0; 	Op=2'b01;
		#5 A=1'b1; B=1'b0; 	Ainv=1'b1; Binv=1'b1; Cin=1'bx; less=1'b0; 	Op=2'b01;
		#5 A=1'b1; B=1'b0; 	Ainv=1'b0; Binv=1'b0; Cin=1'b0; less=1'b0; 	Op=2'b10;
		#5 A=1'b1; B=1'b0;	Ainv=1'b0; Binv=1'b0; Cin=1'b1; less=1'b0; 	Op=2'b10;
		#5 A=1'b1; B=1'b0; 	Ainv=1'b0; Binv=1'b1; Cin=1'b0; less=1'b0; 	Op=2'b10;
		#5 A=1'b1; B=1'b0; 	Ainv=1'b0; Binv=1'b1; Cin=1'b1; less=1'b0; 	Op=2'b10;
		#5 A=1'b1; B=1'b0; 	Ainv=1'bx; Binv=1'bx; Cin=1'bx; less=1'b0; 	Op=2'b11;
		#5 A=1'b1; B=1'b0; 	Ainv=1'bx; Binv=1'bx; Cin=1'bx; less=1'b1; 	Op=2'b11;
		
		//A=1 B=1
		#5 A=1'b1; B=1'b1; 	Ainv=1'b0; Binv=1'b0; Cin=1'bx; less=1'b0; 	Op=2'b00;
		#5 A=1'b1; B=1'b1; 	Ainv=1'b1; Binv=1'b1; Cin=1'bx; less=1'b0; 	Op=2'b00;
		#5 A=1'b1; B=1'b1; 	Ainv=1'b0; Binv=1'b0; Cin=1'bx; less=1'b0; 	Op=2'b01;
		#5 A=1'b1; B=1'b1; 	Ainv=1'b1; Binv=1'b1; Cin=1'bx; less=1'b0; 	Op=2'b01;
		#5 A=1'b1; B=1'b1; 	Ainv=1'b0; Binv=1'b0; Cin=1'b0; less=1'b0; 	Op=2'b10;
		#5 A=1'b1; B=1'b1;	Ainv=1'b0; Binv=1'b0; Cin=1'b1; less=1'b0; 	Op=2'b10;
		#5 A=1'b1; B=1'b1; 	Ainv=1'b0; Binv=1'b1; Cin=1'b0; less=1'b0; 	Op=2'b10;
		#5 A=1'b1; B=1'b1; 	Ainv=1'b0; Binv=1'b1; Cin=1'b1; less=1'b0; 	Op=2'b10;
		#5 A=1'b1; B=1'b1; 	Ainv=1'bx; Binv=1'bx; Cin=1'bx; less=1'b0; 	Op=2'b11;
		#5 A=1'b1; B=1'b1; 	Ainv=1'bx; Binv=1'bx; Cin=1'bx; less=1'b1; 	Op=2'b11;
		
		#10 $finish;
	end
      
endmodule

