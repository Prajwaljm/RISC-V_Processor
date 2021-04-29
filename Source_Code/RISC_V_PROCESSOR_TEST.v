`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:12:07 03/28/2021
// Design Name:   RISC_V_PROCESSOR
// Module Name:   C:/Verilog_projects/COA-Assignment-2-5/RISC_V_PROCESSOR_TEST.v
// Project Name:  COA-Assignment-2-5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RISC_V_PROCESSOR
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RISC_V_PROCESSOR_TEST;

	// Inputs
	reg clk;
	reg rst;

	// Instantiate the Unit Under Test (UUT)
	RISC_V_PROCESSOR uut (
		.clk(clk), 
		.rst(rst)
	);


	always #5 clk = ~clk;
	
	initial begin
		// Initialize Inputs 
		clk = 0; rst = 1;
		
		$monitor($time, "    pc_out=%d    I=%b    reg_file[rs1]=%d    reg_file[rs2]=%d    imm=%d    ALU[A]=%d    ALU[b]=%d ALU[Result]=%d    \n data_memory[address]=%d reg_file[rd]=%d\n", uut.pc_out, uut.I, uut.read1, uut.read2, uut.imm, uut.A, uut.B, uut.Result, uut.data_memory_read, uut.reg_file.regFile[uut.reg_file.rd]);
		//$monitor($time, "I=%b rs1=%d reg_file_read1=%d	rs2=%d  reg_file_read2=%d  rd=%d reg_file[rd]=%d  ALUOp=%b  ALU_ctrl.F=%b  O=%b  A=%d	B=%d Result=%d address=%d data_mem[address]=%d pc_out=%d", uut.I, uut.reg_file.rs1, uut.reg_file.read1, uut.reg_file.rs2, uut.reg_file.read2, uut.reg_file.rd, uut.reg_file.regFile[uut.reg_file.rd], uut.ALUOp, uut.alu_ctrl.F, uut.O, uut.A, uut.B, uut.Result, uut.dt_mem_inst.address, uut.dt_mem_inst.read, uut.pc_out);
		// Wait 100 ns for global reset to finish
		#1 rst=0;
		#104 $finish;
		// Add stimulus here
		
	end
      
endmodule

