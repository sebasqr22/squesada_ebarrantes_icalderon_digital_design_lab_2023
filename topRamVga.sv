module topRamVga (	
	input clk,
	input [2:0] btn,
	output logic vgaclk,
	output logic hsync, vsync,
	output logic sync_b, blank_b,
	output logic [7:0] r, g, b);
	
	vga imagenDis(
		clk,
		ram_data,
		vgaclk, hsync, vsync, sync_b, blank_b, r, g, b
	);
	
	read_mem imagenMemo(
		btn, address, clk, 
		ram_data
	);
	
	contadorDireccion dir(
		.clk(clk),
		.count(address)
	);
	
endmodule