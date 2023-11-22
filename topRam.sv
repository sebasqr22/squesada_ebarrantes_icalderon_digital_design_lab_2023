// TODO: conectar con VGA
module topRam(input logic clk, rst, switch, sw2,
				  //input logic [2:0] btn,
				  input logic [9:0] x, y,
				  input [31:0] data, topAddrs,
				  // input con el addres y data del procesador aka imagen filt
				  output [31:0] q
				  );
				  
logic wren;
//logic [31:0] data;
//logic [31:0] addr_write, addr_read, address;
logic [31:0] addr_read, address;
logic [14:0] actual_address;

ram mem(actual_address, clk, data, wren, q);
contadorDireccion cont(switch, clk, rst, x, y, addr_read);
//write_mem escribir(btn, wren, addr_write, data);
mux_1 mux1(addr_read, topAddrs,sw2, address);

assign actual_address = address[14:0];

endmodule
