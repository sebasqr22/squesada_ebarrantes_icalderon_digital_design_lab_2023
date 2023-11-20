// TODO: conectar con VGA

module topRam(input logic clk, rst, switch,
				  input logic [2:0] btn,
				  input logic [9:0] x, y,
				  output [7:0] q,
				  output [14:0] address);
				  
logic wren;
logic [7:0] data;
logic [14:0] addr_write, addr_read ;

ram mem(address, clk, data, wren, q);
contadorDireccion cont(switch, clk, rst, x, y, addr_read);
write_mem escribir(btn, wren, addr_write, data);
mux_1 mux1(addr_write, addr_read, rst, address);


endmodule

