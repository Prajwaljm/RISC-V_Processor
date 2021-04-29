`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:40:05 03/27/2021
// Design Name:   INSTRUCTION_MEMORY
// Module Name:   C:/Verilog_projects/COA-Assignment-2-5/INSTRUCTION_MEMORY_TEST.v
// Project Name:  COA-Assignment-2-5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: INSTRUCTION_MEMORY
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module INSTRUCTION_MEMORY_TEST;

	// Inputs
	reg [63:0] address;

	// Outputs
	wire [31:0] I;

	// Instantiate the Unit Under Test (UUT)
	INSTRUCTION_MEMORY uut (
		.I(I), 
		.address(address)
	);

	initial begin
		// Initialize Inputs
		address = 0;
		
		$monitor($time, "		address=%b		I=%b", address, I);
		// Wait 100 ns for global reset to finish
		#10 address = 64'b00;
        
		// Add stimulus here
		#5 address = address + 4;
		#5 address = address + 4;
		#5 address = address + 4;
		#5 address = address + 4;
		#5 address = address + 4;
		#5 address = address + 4;
		#5 address = address + 4;
		#5 address = address + 4;
		#5 address = address + 4;
		#5 address = address + 4;
		
		#10 $finish;
	end
      
endmodule

