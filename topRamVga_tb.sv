`timescale 1ns / 1ps

module topRamVga_tb;

  // Inputs
  logic clk, rst, switch, sw2;
  //logic [2:0] btn;

  // Outputs
  logic vgaclk, hsync, vsync, sync_b, blank_b;
  logic [7:0] r, g, b;
  logic [31:0] data, topAddrs, ram_data;
  //logic [14:0] address;

  // Instancia del módulo bajo prueba
  topRamVga uut (
    .clk(clk),
    .rst(rst),
    .switch(switch),
	 .sw2(sw2),
    //.btn(btn),
	 .data(data), .topAddrs(topAddrs),
    .vgaclk(vgaclk),
    .hsync(hsync),
    .vsync(vsync),
    .sync_b(sync_b),
    .blank_b(blank_b),
    .r(r),
    .g(g),
    .b(b),
	 .ram_data(ram_data)
  );

  // Generación de clock
  initial begin
    clk = 0;
    repeat (500) #10 clk = ~clk;
  end

  // Inicialización de señales
  initial begin
    rst = 1'b0;
    switch = 1'b0;
	 sw2 = 0;
	 #20
	 sw2 = 1;
	 data = 32'd50;
	 topAddrs = 32'd10000;
	 #50
	 data = 32'd100;
	 topAddrs = 32'd10001;
    //btn = 3'b000;
    //#5 rst = 1; // Aplicar un pulso de reset después de 5 unidades de tiempo
    //#5 rst = 1'b0; // Desactivar el reset después de 5 unidades de tiempo
	 #500 $finish;
  end


endmodule
