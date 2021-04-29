`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:20:49 03/26/2021
// Design Name:   PC
// Module Name:   C:/Verilog_projects/COA-Assignment-2-5/PC_TEST.v
// Project Name:  COA-Assignment-2-5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PC
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PC_TEST;

	// Inputs
	reg [63:0] pc_in;
	reg clk;
	reg rst;

	// Outputs
	wire [63:0] pc_out;

	// Instantiate the Unit Under Test (UUT)
	PC uut (
		.pc_out(pc_out), 
		.pc_in(pc_in), 
		.clk(clk), 
		.rst(rst)
	);
	
	always #5 clk = ~clk;
	
	initial begin
		// Initialize Inputs
		pc_in = 0;
		clk = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#10;
        
		$monitor($time, "		clk=%b	rst=%b	pc_in=%d		pc_out=%d", clk, rst, pc_in, pc_out);  
		// Add stimulus here
		#2 pc_in = 4;
		#2 pc_in = 8;
		#2 pc_in = 12;
		#2 pc_in = 16;
		#2 rst = 1;
		#2 pc_in = 20;
		#1 rst = 0;
		#1 pc_in = 24;
		
		#10 $finish;
	end
      
endmodule

