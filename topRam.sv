module topRam(input logic clk, rst,
				  input logic [2:0] btn,
				  output [7:0] q,
				  output [13:0] address);
				  
logic wren, seconds;

ram mem(addr_wr, clk, data, wren, q);
//counter cont(seconds, rst, 1'b1, addr_cont);
//hhclock div(seconds, clk); // seconds es el clk
write_mem escribir(btn, wren, addr_wr, data);
//mux_21 mux_addr(addr_wr, addr_cont, rst, address); // este lo puedo quitar

endmodule

