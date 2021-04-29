`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:43:29 03/05/2021 
// Design Name: 
// Module Name:    ALU_64bit 
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
module ALU_64bit(
    output [63:0] R,
    output zero,
    output Overflow,
	 output CarryOut,
    input [63:0] A,
    input [63:0] B,
    input [3:0]  ALU_Op
    );
	 
	 //local wires
	 wire [63:0] Set, ov, carries;
	 wire Ainv, Binv;
	 wire [1:0] Op;
	 wire [63:0] or_gate;
	 wire log_z;
	 assign log_z = 1'b0;
	 
		  assign Ainv = ALU_Op[3];
		  assign Binv = ALU_Op[2];
		  assign Op[1] = ALU_Op[1];
		  assign Op[0] = ALU_Op[0];
		  
	 
		  
		  
		  ALU_1bit alu(
							.R(R[0]),
							.Cout(carries[0]), 
							.Set(Set[0]), 
							.Overflow(ov[0]), 
							.A(A[0]), 
							.B(B[0]), 
							.Ainv(Ainv), 
							.Binv(Binv), 
							.Cin(Binv), 
							.less(Set[63]), 
							.Op(Op)
							);
			assign or_gate[0] = R[0];
		
		generate
        genvar i;
			
			for(i=1; i<64; i=i+1)
			begin
				ALU_1bit alu_i(
								.R(R[i]),
								.Cout(carries[i]), 
								.Set(Set[i]), 
								.Overflow(ov[i]), 
								.A(A[i]), 
								.B(B[i]), 
								.Ainv(Ainv), 
								.Binv(Binv), 
								.Cin(carries[i-1]), 
								.less(log_z),
								.Op(Op)
								);
				or(or_gate[i], R[i], or_gate[i-1]);
			end
			
			
			
		endgenerate
			
			assign zero = ~or_gate[63];
			assign Overflow = ov[63];
			assign CarryOut = carries[63];

endmodule
