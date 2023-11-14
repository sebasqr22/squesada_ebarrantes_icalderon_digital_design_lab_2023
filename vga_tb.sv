module vga_tb();

	logic vgaclk, hsync, vsync, sync_b, blank_b, clk;
	logic [7:0] r, g, b;

	vga pintar(
		clk,
		vgaclk, hsync, vsync, sync_b, blank_b, r, g, b
	);
	
	
	initial begin
		
		clk = 0;
		forever #20 clk = ~clk;
	
	end

endmodule