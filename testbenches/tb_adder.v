`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Verilog Test Fixture created by ISE for module: adder
////////////////////////////////////////////////////////////////////////////////

module tb_adder;

	// Inputs
	reg [7:0] a;
	reg [7:0] b;

	// Outputs
	wire [7:0] result;

	// Instantiate the Unit Under Test (UUT)
	adder uut (
		.a(a), 
		.b(b), 
		.result(result)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
    
    always begin
        #100 b = b + 2;
    end
      
endmodule

