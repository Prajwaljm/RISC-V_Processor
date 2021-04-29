`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:47:53 03/26/2021 
// Design Name: 
// Module Name:    PC 
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
module PC(
    output reg [63:0] pc_out,
    input [63:0] pc_in,
    input clk,
    input rst
    );
	 
	 always @(posedge clk or posedge rst)
	 begin
		if(rst == 1)
			pc_out <= 32'b00;
		else
			pc_out <= pc_in;
	 end

endmodule
