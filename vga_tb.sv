module vga_tb();

  logic vgaclk, hsync, vsync, sync_b, blank_b, clk;
  logic [7:0] r, g, b;
  logic [9:0] x, y;

  vga pintar(
    clk,
	 32'd50,
    vgaclk, hsync, vsync, sync_b, blank_b, r, g, b, x, y
  );
  
  initial begin
    clk = 0;
    // Repite el bucle 250 veces
    repeat (250) begin
      #20 clk = ~clk;
    end
    $stop; // Termina la simulación después del bucle
  end

endmodule
