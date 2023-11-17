// TODO: revisar si es necesario el output de address

module topRam(input logic clk, rst,
				  input logic [2:0] btn,
				  output [7:0] q,
				  output [14:0] address);
				  
logic wren;
logic [7:0] data;

ram mem(address, clk, data, wren, q);

write_mem escribir(btn, wren, address, data);


endmodule

