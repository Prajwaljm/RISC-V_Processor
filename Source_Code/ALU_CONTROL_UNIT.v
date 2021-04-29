`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:58:13 03/03/2021 
// Design Name: 
// Module Name:    ALU_ONTROL_UNIT 
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
module ALU_CONTROL_UNIT(
    output wire [3:0] O,
    input [1:0] ALUOp,
    input [5:0] F
    );
	 //wire [3:0] O;
	 
	 //local net or connections
	 wire w_and, w_or, w_and2;
	 
	 //structural
	 
	 //internal gates
	 and(w_and2, ~F[2], F[1], ~F[0]);
	 or(w_or, F[3], w_and2);
	 and(w_and, ALUOp[1], w_or);
	 
	 //output gates
	 and(O[3], 1'b1, 1'b0);
	 or(O[2], ALUOp[0], w_and);
	 or(O[1], ~F[2], ~F[1]);
	 and(O[0], F[1], ~F[0]);
	 //assign O[3] = 0;
	 //assign O[2] = ( ALUOp[0] | (ALUOp[1] & ~F[2] & F[1] & ~F[0]) ) & ~(ALUOp[1] & ~F[3] & ((~F[2] & ~F[0]) | (F[2] & ~F[1] & F[0])) );
	 //assign O[1] = (ALUOp[0]) & ~(ALUOp[1] & (~F[3] & F[2] & ~F[1] ));
	 //assign O[0] = ALUOp[1] & ((F[3] & ~F[2] & F[1] & ~F[0]) | (~F[3] & F[2] & ~F[1] & F[0])) & ~ALUOp[0];
	 /*always @(*)
	 begin
		if( ALUOp[1]==0 && ALUOp[0] == 0 )
			assign O = 4'b0010;
		else if( ALUOp[0]==1)
			assign O = 4'b0110;
		else if(ALUOp[1]==1 && F[3]==0 && F[2]==0 && F[1]==0 && F[0]==0 )
			assign O = 4'b0010;
		else if(ALUOp[1]==1 && F[3]==0 && F[2]==0 && F[1]==1 && F[0]==0)
			assign O = 4'b0110;
		else if(ALUOp[1]==1 && F[3]==0 && F[2]==1 && F[1]==0 && F[0]==0 )
			assign O = 4'b0000;
		else if(ALUOp[1]==1 && F[3]==0 && F[2]==1 && F[1]==0 && F[0]==1 )
			assign O = 4'b0001;
		else if(ALUOp[1]==1 && F[3]==1 && F[2]==0 && F[1]==1 && F[0]==0 )
			assign O = 4'b0111;
	 end*/
	 
	 
endmodule
