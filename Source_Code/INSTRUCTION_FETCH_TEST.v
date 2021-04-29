`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:36:55 03/27/2021
// Design Name:   INSTRUCTION_FETCH
// Module Name:   C:/Verilog_projects/COA-Assignment-2-5/INSTRUCTION_FETCH_TEST.v
// Project Name:  COA-Assignment-2-5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: INSTRUCTION_FETCH
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module INSTRUCTION_FETCH_TEST;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [31:0] I;

	// Instantiate the Unit Under Test (UUT)
	INSTRUCTION_FETCH uut (
		.I(I), 
		.clk(clk), 
		.rst(rst)
	);

	always #5 clk = ~clk;
	
	initial begin
		// Initialize Inputs 
	   clk = 0; rst = 1;

		// Wait 100 ns for global reset to finish
		
      
		$monitor($time, "		I=%b		clk=%b rst=%b uut.pc_in=%b uut.pc_out=%b", I, clk, rst, uut.pc_in, uut.pc_out);
		// Add stimulus here
		
		#10 rst = 0;
		#10 rst = 0;
		#200 rst = 1;
		#1 rst = 0;
		#10 $finish;
	end
      
endmodule

