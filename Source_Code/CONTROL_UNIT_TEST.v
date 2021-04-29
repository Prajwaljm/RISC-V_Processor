`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:54:32 03/26/2021
// Design Name:   CONTROL_UNIT
// Module Name:   C:/Verilog_projects/COA-Assignment-2-5/CONTROL_UNIT_TEST.v
// Project Name:  COA-Assignment-2-5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CONTROL_UNIT
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CONTROL_UNIT_TEST;

	// Inputs
	reg [6:0] I;

	// Outputs
	wire ALUSrc;
	wire MemtoReg;
	wire RegWrite;
	wire MemRead;
	wire MemWrite;
	wire Branch;
	wire [1:0] ALUOp;

	// Instantiate the Unit Under Test (UUT)
	CONTROL_UNIT uut (
		.ALUSrc(ALUSrc), 
		.MemtoReg(MemtoReg), 
		.RegWrite(RegWrite), 
		.MemRead(MemRead), 
		.MemWrite(MemWrite), 
		.Branch(Branch), 
		.ALUOp(ALUOp), 
		.I(I)
	);

	initial begin
		// Initialize Inputs
		I = 0;

		// Wait 100 ns for global reset to finish
		#10;
        
		$monitor($time,"		I[6:0]=%b 	ALUSrc=%d	MemtoReg=%d		RegWrite=%d 	MemRead=%d    MemWrite=%d    Branch=%d    ALUOp[1:0]=%b;\n", I, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp);
		// Add stimulus here
		#5 I=7'b0110011;
		#5 I=7'b0010011;
		#5 I=7'b0000011;
		#5 I=7'b0100011;
		#5 I=7'b1100011;
		
		#10 $finish;
	end
      
endmodule

