`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:07:31 03/27/2021 
// Design Name: 
// Module Name:    RISC_V_PROCESSOR 
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
module RISC_V_PROCESSOR(
    input clk,
    input rst
    );
	 
	 wire signed [63:0] pc_in;
	 wire signed [63:0] pc_out;
	 PC pc_inst(
					.pc_in(pc_in),
	 				.pc_out(pc_out),
					.clk(clk),
					.rst(rst)
	 				);
	 				
	 wire [31:0] I;
	 INSTRUCTION_MEMORY instr_mem(
											.I(I),
											.address(pc_out)
											);
	 
	 wire Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
	 wire [1:0] ALUOp;
	 CONTROL_UNIT ctrl_unit(
	 								.Branch(Branch),
	 								.MemRead(MemRead),
	 								.MemtoReg(MemtoReg),
	 								.ALUOp(ALUOp),
	 								.MemWrite(MemWrite),
	 								.ALUSrc(ALUSrc),
	 								.RegWrite(RegWrite),
									.I(I[6:0])
	 								);
	 
	 wire signed [63:0] read1, read2;
	 wire signed [63:0] reg_write_data;
	 REGISTER_FILE reg_file(
	 								.read1(read1),
	 								.read2(read2),
	 								.rs1(I[19:15]),
	 								.rs2(I[24:20]),
	 								.rd(I[11:7]),
	 								.write(reg_write_data),
	 								.RegWrite(RegWrite)
	 								);
	 
	 wire signed [63:0] imm;
    Imm_Gen immgen_inst(
								.imm(imm),
								.I(I)
								);
	 	 
	 wire [3:0] O;
	 ALU_CONTROL_UNIT alu_ctrl(
							         .O(O),
							         .ALUOp(ALUOp),
				    		         .F({2'b00,I[30],I[14:12]})
							         );
	 
	 
	 wire signed [63:0] A, B;
	 //reg [63:0] B;
	 assign A = read1;
	 assign B = ALUSrc ? imm : read2;
	 /*always @(*)
	 begin
		if(ALUSrc==1)
			B <= imm;
		else
			B <= read2;
	 end*/
	 
	 wire signed [63:0] Result;
	 wire zero, Overflow, CarryOut;
	 ALU_64bit ALU(
	 					.R(Result),
	 					.zero(zero),
	 					.Overflow(Overflow),
	 					.CarryOut(CarryOut),
	 					.A(A),
	 					.B(B),
	 					.ALU_Op(O)
	 					);
	 
	 wire pc_select;
	 and(pc_select, Branch, zero);
	 
	 wire signed [63:0] data_memory_read; 
	 DATA_MEMORY dt_mem_inst(
	 								 .read(data_memory_read),
	 								 .address(Result),
	 								 .write(read2),
	 								 .MemRead(MemRead),
	 								 .MemWrite(MemWrite)
	 								 );
	 
	 assign reg_write_data = MemtoReg ? (data_memory_read) : (Result);
	 
	 //assign pc_in = pc_out + 64'b0100;
	 assign pc_in = pc_select ? (pc_out + {imm[62:0],1'b0}) : (pc_out+64'b00100);
	 
endmodule
