`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Verilog Test Fixture created by ISE for module: computer
////////////////////////////////////////////////////////////////////////////////

module tb_computer;

	// Inputs
	reg clk;
	reg rst;
	reg [7:0] inputPort;

	// Outputs
	wire [7:0] outputPort;

	// Instantiate the Unit Under Test (UUT)
	computer uut (
		.clk(clk), 
		.rst(rst), 
		.inputPort(inputPort), 
		.outputPort(outputPort)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		inputPort = 4'hF;
        

		// Wait 100 ns for global reset to finish
		#100;
        rst = 1;
        #50;
        rst = 0;
        
		// Add stimulus here

	end
    
    always begin
        #25 clk = ~clk;
    end
      
endmodule

