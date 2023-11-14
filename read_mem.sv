module read_mem (
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