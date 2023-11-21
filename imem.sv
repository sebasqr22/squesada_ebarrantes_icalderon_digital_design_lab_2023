module imem(input logic [31:0] a,
	output logic [31:0] rd);
	logic [31:0] RAM[63:0];
	initial
	$readmemh("C:/Users/erick/Documents/TEC/2023-IISemestre/TallerDigitales/Proyecto/squesada_ebarrantes_icalderon_digital_design_lab_2023/memfile.dat",RAM);
	assign rd = RAM[a[31:2]]; // word aligned
endmodule