`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:37:26 03/25/2021
// Design Name:   REGISTER_FILE
// Module Name:   C:/Verilog_projects/COA-Assignment-2-5/REGISTER_FILE_TEST.v
// Project Name:  COA-Assignment-2-5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: REGISTER_FILE
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module REGISTER_FILE_TEST;

	// Inputs
	reg [4:0] rs1;
	reg [4:0] rs2;
	reg [4:0] rd;
	reg [63:0] write;
	reg RegWrite;

	// Outputs
	wire [63:0] read1;
	wire [63:0] read2;

	// Instantiate the Unit Under Test (UUT)
	REGISTER_FILE uut (
		.read1(read1), 
		.read2(read2), 
		.rs1(rs1), 
		.rs2(rs2), 
		.rd(rd), 
		.write(write), 
		.RegWrite(RegWrite)
	);

	initial begin
		// Initialize Inputs
		rs1 = 0;
		rs2 = 0;
		rd = 0;
		write = 0;
		RegWrite = 0;

		// Wait 100 ns for global reset to finish
		#10;
      
		$monitor($time, "    rs1=%d    read1=%d    rs2=%d    read2=%d    write=%d    RegWrite=%b", rs1, read1, rs2, read2, write, RegWrite);
		// Add stimulus here
		#5 rs1 = 1;  rs2 = 2;
		#5 rs1 = 1;  rs2 = 2; rd = 2; write = 5; RegWrite = 1;
		#5 write = 7;
		#5 write = 4; RegWrite = 0; rs1 = 7;
		
		#10 $finish;
		
	end
      
endmodule

