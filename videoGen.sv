module videoGen(
	input logic [9:0] x, y,
	input logic [31:0] ram_data,
	output logic [7:0] r, g, b
);
	logic [7:0] actualRamData;

	assign actualRamData = ram_data[7:0];
	always @* begin
		if(x < 100 && y < 100) begin
			{r, g, b} = {actualRamData, actualRamData, actualRamData};
		end else begin
			{r, g, b} = {8'hFF, 8'h00, 8'h00};
		end
	end
	
endmodule