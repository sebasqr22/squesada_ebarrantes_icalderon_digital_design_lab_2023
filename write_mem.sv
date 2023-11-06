module write_mem(input [2:0] btn,
					  output enable,
					  output [13:0] addr,
					  output [7:0] data);

always @(btn) begin
	case(btn)
		3'b110: begin // caso para filtro 1
			enable = 1'b1;
			addr = 13'b0010011100000;
			data = 7'b1;
		end
		3'b101: begin // caso para filtro 2
			enable = 1'b1;
			addr = 13'b0010011100000;
			data = 7'b2;
		end
		default: begin 
			enable = 1'b0;
			addr = 13'b0010011100000;
			data = 7'b0;
		end
	endcase
end

endmodule
