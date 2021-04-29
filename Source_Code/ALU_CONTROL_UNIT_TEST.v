`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:44:20 03/04/2021
// Design Name:   ALU_ONTROL_UNIT
// Module Name:   C:/Verilog_projects/COA-Assignment-2-5/ALU_CONTROL_UNIT_TEST.v
// Project Name:  COA-Assignment-2-5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU_ONTROL_UNIT
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_CONTROL_UNIT_TEST;

	// Inputs
	reg [1:0] ALUOp;
	reg [5:0] F;
	
	wire	[3:0] O;

	// Instantiate the Unit Under Test (UUT)
	ALU_ONTROL_UNIT uut (
		.O(O),
		.ALUOp(ALUOp), 
		.F(F)
	);

	initial 
	begin
		// Initialize Inputs
		ALUOp = 2'b00;
		F = 6'b000000;

		// Wait 100 ns for global reset to finish
		#100;
		
		$monitor($time,"		ALUOp=%b F=%b Operation=%b\n", ALUOp[1:0], F[5:0], O[3:0]);
		// Add stimulus here
		
		#50 F=6'bxxxxxx; ALUOp=2'b00;
		#50 F=6'bxxxxxx; ALUOp=2'b01;
		#50 F=6'bxx0000; ALUOp=2'b10;
		#50 F=6'bxx0010; ALUOp=2'b10;
		#50 F=6'bxx0100; ALUOp=2'b10;
		#50 F=6'bxx0101; ALUOp=2'b10;
		#50 F=6'bxx1010; ALUOp=2'b10;
		
		#100 $finish;
	end
      
endmodule

