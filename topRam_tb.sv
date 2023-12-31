`timescale 1 ps / 1 ps
module topRam_tb;

  logic clk, rst;
  logic [2:0] btn;
  logic [31:0] q;
  //logic [14:0] address;

  // Instancia del módulo bajo prueba
  topRam uut (
    .clk(clk),
    .rst(rst),
	 .switch(1'b0),
    .btn(btn),
    .q(q)
    //.address(address)
  );

  // Generación de clock
  initial begin
    clk = 0;
    repeat (500) #10 clk = ~clk;
  end

  // Inicialización de señales
  initial begin
    rst = 0;
    //btn = 3'b110;
    #5 rst = 1; // Aplicar un pulso de reset después de 5 unidades de tiempo
	 #5 rst = 0; // Aplicar un pulso de reset después de 5 unidades de tiempo
  end

  // Estímulos del botón
  initial begin
    #20 
	 rst = 1;
	 btn = 3'b101; // Cambiar el valor de btn después de 20 unidades de tiempo
    #100 
	 rst = 0;
	 btn = 3'b000; // Cambiar nuevamente el valor de btn después de 20 unidades de tiempo
    #500 $finish; // Finalizar la simulación después de 100 unidades de tiempo
  end

endmodule
