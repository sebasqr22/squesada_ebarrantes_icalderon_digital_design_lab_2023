module topRamVga (	
    input logic clk, rst, switch, sw2,
    //input logic [2:0] btn,
	 input [31:0] data, topAddrs,
    output logic vgaclk,
    output logic hsync, vsync,
    output logic sync_b, blank_b,
    output logic [7:0] r, g, b,
	 output logic [31:0] ram_data
);
   // logic [31:0] ram_data;
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
		  .sw2(sw2),
        //.btn(btn),
		  .x(x),
		  .y(y),
		  .data(data), .topAddrs(topAddrs),
        .q(ram_data)
        //.address(address)
    );
endmodule
