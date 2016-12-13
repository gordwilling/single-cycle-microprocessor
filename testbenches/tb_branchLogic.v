`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Verilog Test Fixture created by ISE for module: branchLogic
////////////////////////////////////////////////////////////////////////////////

module tb_branchLogic;

	// Inputs
	reg branch;
	reg branchIf;
	reg brx;
	reg z;
	reg n;

	// Outputs
	wire result;

	// Instantiate the Unit Under Test (UUT)
	branchLogic uut (
		.branch(branch), 
		.branchIf(branchIf), 
		.brx(brx), 
		.z(z), 
		.n(n), 
		.result(result)
	);

	initial begin
		// Initialize Inputs
		branch = 0;
		branchIf = 0;
		brx = 0;
		z = 0;
		n = 0;

		// Wait 100 ns for global reset to finish
		#100;
        branch = 1;
        #100;
        branch = 0;
        #100;
        branchIf = 1;
        #100;
        z = 0;
        #100;
        z = 1;
        #100;
        z = 0;
        n = 1;
        #100;
        brx = 1;
        
		// Add stimulus here

	end
      
endmodule

