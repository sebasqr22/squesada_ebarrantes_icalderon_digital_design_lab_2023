// TODO: hacer este contador con un input que seleccione si contar en el rango 0-9999 o 10000-19999

module contadorDireccion (
    input wire clk,
    output reg [13:0] count
);

always @(posedge clk) begin
    if (count == 14'd9999) begin
        count <= 14'd0;
    end else begin
        count <= count + 1;
    end
end

endmodule
