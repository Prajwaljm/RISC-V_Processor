`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:52:31 03/26/2021 
// Design Name: 
// Module Name:    DATA_MEMORY 
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
module DATA_MEMORY(
    output wire [63:0] read,
    input [63:0] address,
    input [63:0] write,
    input MemRead,
    input MemWrite
    );
	 
	 reg signed [7:0] data_memory [0:127];
	 
	 
	 initial
	 begin
		$readmemb("data.mem", data_memory);
	 end
	 
	 always @(*) //(posedge MemWrite)
	 begin
		if(MemWrite == 1)
		begin
			data_memory[address+0] <= write[63:55];
			data_memory[address+1] <= write[55:47];
			data_memory[address+2] <= write[47:39];
			data_memory[address+3] <= write[39:31];
			data_memory[address+4] <= write[31:23];
			data_memory[address+5] <= write[23:15];
			data_memory[address+6] <= write[15:7];
			data_memory[address+7] <= write[7:0];
		end
	 end
	 
	 assign read  = {data_memory[address+0], data_memory[address+1], data_memory[address+2], data_memory[address+3], data_memory[address+4], data_memory[address+5], data_memory[address+6], data_memory[address+7]};

endmodule
