module vga(
	input clk,
	input logic [31:0] ram_data,
	output logic vgaclk,
	output logic hsync, vsync,
	output logic sync_b, blank_b,
	output logic [7:0] r, g, b,
	output logic [9:0] x, y
);
	//logic [9:0] x, y;
	pll vgapll(
		.inclk0(clk),
		.c0(vgaclk)
	);
	
	vgaController vgaCont(
		.vgaclk(vgaclk),
		.hsync(hsync),
		.vsync(vsync),
		.sync_b(sync_b),
		.blank_b(blank_b),
		.x(x),
		.y(y)
	);
	
	videoGen vgaVideoGen(
		.x(x),
		.y(y),
		.ram_data(ram_data),
		.r(r),
		.g(g),
		.b(b)
	);

endmodule