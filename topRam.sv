module topRam(input logic clk, rst,
				  input logic [2:0] btn,
				  output [7:0] q,
				  output [13:0] address);
				  
logic wren, seconds;

ram mem(addr_wr, clk, data, wren, q);

write_mem escribir(btn, wren, addr_wr, data);


endmodule

