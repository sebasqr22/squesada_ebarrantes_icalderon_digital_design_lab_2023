module dmem(input logic clk, rst, switch,
				//input logic [31:0] a, wd,
				input logic [2:0] btn, 
				input logic [9:0] x, y,
				output logic [31:0] rd);
				// a = address
				// wd = lo que quiero escribir
				// rd = lo que quiero leer
				// we = enable
				
	//logic [31:0] RAM[63:0]; 
	//assign rd = RAM[a]; // word aligned
	//always_ff @(posedge clk)
	//if (we) RAM[a[31:2]] <= wd;
	
	
	// leer
	topRam ram(clk, rst, switch,
				  btn,
				  x, y,
				  rd);
	
endmodule