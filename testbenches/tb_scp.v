`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Verilog Test Fixture created by ISE for module: scp
////////////////////////////////////////////////////////////////////////////////

module tb_scp;

	// Inputs
	reg clk;
	reg rst;
	reg [15:0] instr;
	reg [7:0] fromInputPort;
	reg [7:0] fromDataMemory;

	// Outputs
	wire [7:0] pc;
	wire [7:0] toOutputPort;
	wire [7:0] toDataMemoryAddress;
	wire [7:0] toDataMemory;
	wire outWrite;
	wire memWrite;

	// Instantiate the Unit Under Test (UUT)
	scp uut (
		.clk(clk), 
		.rst(rst), 
		.instr(instr), 
		.fromInputPort(fromInputPort), 
		.fromDataMemory(fromDataMemory), 
		.pc(pc), 
		.toOutputPort(toOutputPort), 
		.toDataMemoryAddress(toDataMemoryAddress), 
		.toDataMemory(toDataMemory), 
		.outWrite(outWrite), 
		.memWrite(memWrite)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		instr = 0;
		fromInputPort = 0;
		fromDataMemory = 0;

		// Wait 100 ns for global reset to finish
		#100;
        rst = 1;
        #50;
        rst = 0;
        #100;
        
        // nop
        instr = 16'h0000;
        #50;
        
        // Load data into registers        
        
        // R0 <- 2
        instr = 16'h02F0;
        #50;
        
        // R1 <- 4
        instr = 16'h04F4;
        #50;
        
        // R2 <- 8
        instr = 16'h08F8;
        #50;
        
        // R3 <- A
        instr = 16'h0AFC;
        #50;
        
        // Store register data into memory
        // (no memory is attached but watch toDataMemory & toDataMemoryAddress)
        
        // Mem[0] <- R0
        instr = 16'h00E0;
        #50;
        
        // Mem[1] <- R1
        instr = 16'h01E4;
        #50;
        
        // Mem[2] <- R2
        instr = 16'h02E8;
        #50;
        
        // Mem[3] <- R3
        instr = 16'h03EC;
        #50;
        
        // ALU Operations
        
        // R0 <- R0 + R1 = 6
        instr = 16'h0011;
        #50;        
        // R0 <- R0 + R2 = 14
        instr = 16'h0012;
        #50;        
        // R0 <- R0 - R3 = 4
        instr = 16'h0023;
        #50;        
        // R0 <- R0 NAND R1 = FB
        instr = 16'h0031;
        #50;        
        // R0 <- R0 << 1 = F6
        instr = 16'h0040;
        #50;        
        // R0 <- R0 >> 1 = 7B
        instr = 16'h0050;
        #50;
        
        // Port Transfers 
        // (no output port connected but watch outWrite & toOutputPort)
        
        // OUT <- R0 
        instr = 16'h0060;
        #50;        
        // R0 <- IN
        fromInputPort = 8'hAA;        
        instr = 16'h0070;
        #50;
        
        // Move
        
        // R0 <- R2 = 8
        instr = 16'h0082;
        #50;
        
        // Branch Instructions
                   
        // should set pc to 02
        instr = 16'h0290;
        #50;
        
        // branch if zero
        // R0 <- 1
        instr = 16'h01F0;
        #50;
        // R1 <- 1
        instr = 16'h01F4;
        #50;
        // R0 <- R0 - R1 = 0
        instr = 16'h0021;
        #50;
        // brz: set pc to 0A
        instr = 16'h0AA0;
        #50;        
        // R0 <- R0 + R1 = 1
        instr = 16'h0011;
        #50;
         // brz: z != 0, should not set pc to 0F
        instr = 16'h0FA0;
        #50;
        
        // branch if negative
        // R0 <- 1
        instr = 16'h01F0;
        #50;
        // R1 <- 2
        instr = 16'h02F4;
        #50;
        // R0 <- R0 - R1 = -1
        instr = 16'h0021;
        #50;
        // brn: set pc to 88
        instr = 16'h88A8;
        #50;        
        // R0 <- R0 + R1 = 1
        instr = 16'h0011;
        #50;
         // brn: n != 0, should not set pc to EE
        instr = 16'hEEA8;
        #50;
        
        // branch to subroutine
        // LR <- pc + 2, PC = 55;
        instr = 16'h55B0; 
        #50;
        
        // pretend we're in a subroutine
        // watch the pc increment
        instr = 16'h0000;
        #200;
        
        // return
        // PC <- LR
        instr = 16'h00C0;
        
        
        
        
		// nop               
        #50;
        instr = 16'h0000;
        #50;

	end
    
    always begin
        #25 clk = ~clk;
    end;
      
endmodule

