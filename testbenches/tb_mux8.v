`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Verilog Test Fixture created by ISE for module: mux5
////////////////////////////////////////////////////////////////////////////////

module tb_mux8;

	// Inputs
	reg [7:0] in0;
	reg [7:0] in1;
	reg [7:0] in2;
	reg [7:0] in3;
	reg [7:0] in4;
	reg [3:0] select;

	// Outputs
	wire [7:0] out;

	// Instantiate the Unit Under Test (UUT)
	mux8 uut (
		.in0(in0), 
		.in1(in1), 
		.in2(in2), 
		.in3(in3), 
		.in4(in4),
        .in5(),
        .in6(),
        .in7(),
		.select(select), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in0 = 8'h00;
		in1 = 8'h11;
		in2 = 8'h22;
		in3 = 8'h33;
		in4 = 8'h44;
		select = 0;

		// Wait 100 ns for global reset to finish
		#100;
        select = 1;
        #100;
        select = 2;
        #100;
        select = 3;
        #100;
        select = 4;
        #100;
        select = 5;
        #100;
        select = 6;
        #100;
        select = 7;
        #100;
        select = 6;
        #100;
        select = 5;
        #100;
        select = 4;
        #100;
        select = 3;
        #100;
        select = 2;
        #100;
        select = 1;
        #100;
        select = 0;
        
        
		// Add stimulus here

	end
      
endmodule

