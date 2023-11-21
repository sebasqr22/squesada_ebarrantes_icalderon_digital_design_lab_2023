module write_mem(
  input [2:0] btn,
  output logic enable,
  output logic [31:0] addr,
  output logic [31:0] data
);

always @(btn) begin
  case(btn)
    3'b110: begin // caso para filtro 1
      enable <= 1'b1;
      addr <= 32'd20000;
      data <= 32'd1;
    end
    3'b101: begin // caso para filtro 2
      enable <= 1'b1;
      addr <= 32'd20000;
      data <= 32'd2;
    end
    default: begin 
      enable <= 1'b0;
      addr <= 32'd0;
      data <= 32'd0;
    end
  endcase
end

endmodule
