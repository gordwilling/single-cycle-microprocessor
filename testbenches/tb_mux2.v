`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Verilog Test Fixture created by ISE for module: mux2
////////////////////////////////////////////////////////////////////////////////

module tb_mux2;

	// Inputs
	reg [7:0] in0;
	reg [7:0] in1;
	reg select;

	// Outputs
	wire [7:0] out;

	// Instantiate the Unit Under Test (UUT)
	mux2 uut (
		.in0(in0), 
		.in1(in1), 
		.select(select), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in0 = 0;
		in1 = 0;
		select = 0;
        in0 = 8'hAA;
        in1 = 8'h55;

		// Wait 100 ns for global reset to finish
		#100;
        select = 1;
        #100;
        select = 0;
        #100;
        select = 1;
        #100;
        select = 0;
        
		// Add stimulus here

	end
      
endmodule

