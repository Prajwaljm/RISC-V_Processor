`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:28:41 03/26/2021 
// Design Name: 
// Module Name:    CONTROL_UNIT 
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
module CONTROL_UNIT(
    output ALUSrc,
    output MemtoReg,
    output RegWrite,
    output MemRead,
    output MemWrite,
    output Branch,
    output [1:0] ALUOp,
    input [6:0] I
    );
		//local nets
		wire and_output;
		
		//internal gate
		and(and_output1, I[5], I[4]);
		and(and_output2, I[5], ~I[4]);
		
		//structural code
		and(ALUSrc, ~I[6], ~and_output1);
		and(MemtoReg, ~I[6], ~I[5], ~I[4]);
		and(RegWrite, ~I[6], ~and_output2);
		and(MemRead, ~I[6], ~I[5], ~I[4]);
		and(MemWrite, ~I[6], I[5], ~I[4]);
		and(Branch, I[6], I[5], ~I[4]);
		and(ALUOp[1], ~I[6], I[5], I[4]);
		and(ALUOp[0], I[6], I[5], ~I[4]);

endmodule
