`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:16:44 03/27/2021 
// Design Name: 
// Module Name:    INSTRUCTION_FETCH 
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
module INSTRUCTION_FETCH(
    output [63:0] I,
    input wire clk,
    input wire rst
    );
	 
	 wire [63:0] pc_in;
	 wire [63:0] pc_out;
	 
	 wire [31:0] I;
	 
	 assign pc_in = pc_out + 64'b0100;
	 PC pc_inst(
	 				.pc_out(pc_out),
	 				.pc_in(pc_in), 
	 				.clk(clk),
	 				.rst(rst)
	 				);
	 				
	 INSTRUCTION_MEMORY instr_inst(
											 .I(I),
								          .address(pc_out)
	 					                );
	 
endmodule
