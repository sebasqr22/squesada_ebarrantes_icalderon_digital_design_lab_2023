module contadorDireccion (
    input wire switch,
    input wire clk,
    input wire rst,
    input logic [9:0] x, y,
    output logic [31:0] count
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        // Resetear el contador a 0 cuando rst es activado
        count <= 32'd0;
    end else begin
        if (switch == 1'b0) begin
            // Contar de 0 a 9999
            if (count >= 32'd9999) begin
                count <= 32'd0;
            end else begin
                if (x < 100 && y < 100) begin
                    count <= count + 1;
                end
            end
        end else begin
            if (switch == 1'b1) begin
                // Contar de 10000 a 19999
                if (count >= 32'd19999) begin
                    count <= 32'd10000;
                end else begin
                    if (x < 100 && y < 100) begin
                        count <= count + 1;
                    end
                end
            end
        end
    end
end

endmodule
