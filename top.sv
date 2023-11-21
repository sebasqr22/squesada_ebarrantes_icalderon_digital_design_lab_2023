module top(input logic clk, reset, 
			  //input logic [2:0] btn, 
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
	//imem imem(PC, clk, Instr);
	
	// cambiar PC a 32 bits 
	assign shortRomDataAdr = PC[4:0];
	romF2 rom1(shortRomDataAdr, clk, Instr);
	
	// Memoria de datos
	// dmem dmem(clk, MemWrite, DataAdr, WriteData, ReadData);
	//dmem dmem(clk, reset, MemWrite, btn, x, y, ReadData);
	
	
	// cambiar DataAdr a 32 bits 
	assign shortRamDataAdr = DataAdr[14:0];
	
	ram ram1(shortRamDataAdr, clk, WriteData, MemWrite, ReadData);
	
	// vga 

	vga imagenDis(
        .clk(clk),
        .ram_data(ReadData),
        .vgaclk(vgaclk),
        .hsync(hsync),
       .vsync(vsync),
        .sync_b(sync_b),
        .blank_b(blank_b),
        .r(r),
        .g(g),
        .b(b)
		  //.x(x),
		  //.y(y)
    );
endmodule