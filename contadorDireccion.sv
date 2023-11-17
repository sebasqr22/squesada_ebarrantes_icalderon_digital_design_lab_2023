module contadorDireccion (
    input wire switch,
    input wire clk,
    output reg [13:0] count
);

always @(posedge clk) begin
    if (switch == 1'b0) begin
        // Contar de 0 a 9999
        if (count == 14'd9999) begin
            count <= 14'd0;
        end else begin
            count <= count + 1;
        end
    end else begin
        // Contar de 10000 a 19999
        if (count == 14'd19999) begin
            count <= 14'd10000;
        end else begin
            count <= count + 1;
        end
    end
end

endmodule
