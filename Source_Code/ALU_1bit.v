`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:29:14 03/05/2021 
// Design Name: 
// Module Name:    ALU_1bit 
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
module ALU_1bit(
    output R,
	 output Cout,
    output Set,
    output Overflow,
    input A,
    input B,
    input Ainv,
    input Binv,
    input Cin,
    input less,
    input [1:0] Op    
    );
	 //input/output registers
	 //reg A, B, Ainv, Binv, Cin, l;
	 //reg [1:0] Op;
	 //reg R, Cout, Set, Overflow; 
	 
	 //local wires 
	 wire Ar, Br, Co;
	 wire [3:0] r;
	 
	 //
	 xor(Ar, A, Ainv);
	 xor(Br, B, Binv);
	 
	 and(r[0], Ar, Br);
	 or(r[1], Ar, Br);
	 FULL_ADDER FA(
	 .S(r[2]),
	 .Cout(Co),
	 .A(Ar),
	 .B(Br),
	 .Cin(Cin)
	 );
	 assign r[3] = less;
	 
	 assign R = (r[0]&~Op[1]&~Op[0]) | (r[1]&~Op[1]&Op[0]) | (r[2]&Op[1]&~Op[0]) | (r[3]&Op[1]&Op[0]);
	 assign Cout = Co;
	 assign Set = r[2];
	 xor( Overflow, Cin, Co);
	 
endmodule
