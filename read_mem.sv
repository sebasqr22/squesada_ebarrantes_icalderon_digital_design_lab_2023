//TODO: dependiendo de btn mostrar el contenido en los rangos de address 0-9999 y 10000 a 19999

module read_mem (
	 input [2:0] btn,
    input [13:0] address,
    input clock,
    output reg [7:0] data_out
);

reg [7:0] memory [0:20000]; // 

initial begin
    $readmemb("memoriaRam.mif", memory);
end

always @(posedge clock) begin
    data_out <= memory[address];
end

endmodule