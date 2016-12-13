`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Verilog Test Fixture created by ISE for module: counter
////////////////////////////////////////////////////////////////////////////////

module tb_freqDivider;

	// Inputs
	reg clk;
    reg rst;
    wire d;

	// Instantiate the Unit Under Test (UUT)
	freqDivider #(21) uut (    
		.clk(clk), 
        .rst(rst),
        .d(d)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
        rst = 0;       

		// Wait 100 ns for global reset to finish
		#10;
        
        rst = 1;
        #5;
        rst = 0;
        
		// Add stimulus here

	end
    
    always begin
        #5 clk = ~clk;
    end
      
endmodule

