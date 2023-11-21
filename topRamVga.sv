module topRamVga (	
    input logic clk, rst, switch,
    input logic [2:0] btn,
    output logic vgaclk,
    output logic hsync, vsync,
    output logic sync_b, blank_b,
    output logic [7:0] r, g, b
);
    logic [31:0] ram_data;
	 logic [9:0] x, y;

    vga imagenDis(
        .clk(clk),
        .ram_data(ram_data),
        .vgaclk(vgaclk),
        .hsync(hsync),
        .vsync(vsync),
        .sync_b(sync_b),
        .blank_b(blank_b),
        .r(r),
        .g(g),
        .b(b),
		  .x(x),
		  .y(y)
    );

    topRam ramInfo (
        .clk(vgaclk),
        .rst(rst),
        .switch(switch),
        .btn(btn),
		  .x(x),
		  .y(y),
        .q(ram_data)
        //.address(address)
    );
endmodule
