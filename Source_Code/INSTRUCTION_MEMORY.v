`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:58:48 03/26/2021 
// Design Name: 
// Module Name:    INSTRUCTION_MEMORY 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module INSTRUCTION_MEMORY(
    output reg	[31:0] I,
    input [63:0] address
    );
	 
	 reg [31:0] instruction_memory [0:31];
	 
	 //filling instruction_memory with the instructions from instr.txt
	 initial
	 begin
		$readmemb("instr.mem", instruction_memory);
	 end
	 
	 //whenever address changes
	 always @(address)
	 begin
		I <= instruction_memory[address/4];	
	 end
	 
endmodule
