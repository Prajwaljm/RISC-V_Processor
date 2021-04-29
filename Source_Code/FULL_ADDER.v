`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:53:50 03/02/2021 
// Design Name: 
// Module Name:    FULL_ADDER 
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

module FULL_ADDER(
    output S,
    output Cout,
    input A,
    input B,
    input Cin
    );
	 //3 local wires
	 wire w_xor, w_and_1, w_and_2;
	 
	 // Structural code
	 xor(w_xor, A, B);
	 xor(S, w_xor, Cin);
	 and(w_and_1, w_xor, Cin);
	 and(w_and_2, A, B);
	 or(Cout, w_and_1, w_and_2);
	 
	 //Behavorial code
	 //always @(A or B or C)
	 //begin
	 //S = A ^ B ^ C; 
	 //Cout = A&B | (A^B) & C;
	 //end
	 
endmodule
