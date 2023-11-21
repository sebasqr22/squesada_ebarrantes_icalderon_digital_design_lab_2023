module imem(input logic [31:0] a,
				input logic clk,
				output logic [31:0] rd);
				
	romF2 rom(a, clk, rd);
endmodule