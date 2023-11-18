module mux_1(input [14:0] A, B,
			  input sel,
			  output [14:0] C);
			  
assign C = sel ? A : B;

endmodule