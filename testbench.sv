`timescale 1ns / 1ps


module testbench();
	logic clk;
	logic reset;
	logic [31:0] WriteData, DataAdr;
	logic MemWrite;
	
  //logic [2:0] btn;

  // Outputs
  logic vgaclk, hsync, vsync, sync_b, blank_b;
  logic [7:0] r, g, b;
	
	// instantiate device to be tested
	top dut(clk, reset, WriteData, DataAdr, MemWrite,
	vgaclk, hsync, vsync, sync_b, blank_b, r,g,b
	);
	// initialize test
	initial
	begin
	reset <= 1; # 22; reset <= 0;
	end
	// generate clock to sequence tests
	always
	begin
	clk <= 1; # 5; clk <= 0; # 5;
	end
	
	always @(negedge clk)
	begin
		if(MemWrite) begin
		$display("Simulation succeeded");
			//if(DataAdr === 100 & WriteData === 7) begin
			//$display("Simulation succeeded");
			//$stop;
			//end else if (DataAdr !== 96) begin
			//$display("Simulation failed");
			//$stop;
			//end
		end
	end
	
endmodule