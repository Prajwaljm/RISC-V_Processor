`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:27:25 03/25/2021 
// Design Name: 
// Module Name:    REGISTER_FILE 
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
module REGISTER_FILE(
    output wire signed [63:0] read1,
    output wire signed [63:0] read2,
    input [4:0] rs1,
    input [4:0] rs2,
    input [4:0] rd,
    input signed [63:0] write,
    input RegWrite
    );
	 
	 reg signed [63:0] regFile[0:31];
	 
	 integer i;
	 
	 initial begin
		for(i=0; i<32; i=i+1)
		begin
			regFile[i] = i;	
		end
	 end
	 
	 assign read1 = regFile[rs1];
	 assign read2 = regFile[rs2];
	 
	 always @(*) //(posedge RegWrite)
	 begin
		if(RegWrite == 1)
			regFile[rd] <= write;
		else 
			regFile[rd] <= regFile[rd];
	 end
	 
endmodule
