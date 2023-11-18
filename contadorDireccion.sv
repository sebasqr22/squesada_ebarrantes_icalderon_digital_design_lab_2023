module contadorDireccion (
    input wire switch,
    input wire clk,
    input wire rst,
    output reg [14:0] count
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        // Resetear el contador a 0 cuando rst es activado
        count <= 15'd0;
    end else begin
        if (switch == 1'b0) begin
            // Contar de 0 a 9999
            if (count == 15'd9999) begin
                count <= 15'd0;
            end else begin
                count <= count + 1;
            end
        end else begin
            // Contar de 10000 a 19999
            if (count == 15'd19999) begin
                count <= 15'd10000;
            end else begin
                count <= count + 1;
            end
        end
    end
end

endmodule
