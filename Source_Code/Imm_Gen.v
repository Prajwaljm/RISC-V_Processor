`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:34:17 03/26/2021 
// Design Name: 
// Module Name:    Imm_Gen 
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
module Imm_Gen(
    output reg [63:0] imm,
    input [31:0] I
    );
	 
	 always @(*)
	 begin
		if( I[6:4] == 3'b011 )
		begin
			imm[63:0] <= {64{1'b0}};
		end
		else if( I[6:4] == 3'b001 || I[6:4] == 3'b000)
		begin
			imm[11:0] <= I[31:20];
			imm[63:12] <= {52{I[31]}};
		end
		else if( I[6:4] == 3'b010 )
		begin
			imm[4:0] <= I[11:7];
			imm[11:5] <= I[31:25];
			imm[63:12] <= {52{I[31]}};
		end
		else if( I[6:4] == 3'b110 )
		begin
			imm[3:0] <= I[11:8];
			imm[9:4] <= I[30:25];
			imm[10] <= I[7];
			imm[63:11] <= {53{I[31]}};
		end
	 end


endmodule
