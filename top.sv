module top(input logic clk, reset, switch, sw2,
			  input logic [2:0] btn, 
			  output logic [31:0] WriteData, DataAdr,
			  output logic MemWrite,
			  output logic vgaclk,
			  output logic hsync, vsync,
			  output logic sync_b, blank_b,
			  output logic [7:0] r, g, b
			 );
			 
	logic [31:0] PC, Instr, ReadData;
	logic [14:0] shortRamDataAdr;
	logic [4:0] shortRomDataAdr;
	
	
	// instantiate processor and memories
	arm arm(clk, reset, PC, Instr, MemWrite, DataAdr, WriteData, ReadData);
	
	// Memoria de instrucciones 
	//assign shortRomDataAdr = PC[4:0];
	//romF2 rom1(shortRomDataAdr, clk, Instr);
	
	imem room(PC, Instr);
	
	// Memoria de datos
	//assign shortRamDataAdr = DataAdr[14:0];
	
	//ram ram1(shortRamDataAdr, clk, WriteData, MemWrite, ReadData);
	
	// vga 

	topRamVga vgaa(	
		 clk, reset, switch, sw2,
		 //btn, 
		 WriteData, DataAdr,
		 vgaclk,
		 hsync, vsync,
		 sync_b, blank_b,
		 r, g, b,
		 ReadData
	);
	
endmodule