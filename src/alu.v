`timescale 1ns / 1ps
///////////////////////////////////////////////////////////////////////////////
// ENGI-0538-WB Computer Organization
// Lab Project: Single Cycle Processor
// Author: Gordon Wallace
// Create Date:    15:22:44 03/11/2013 
// Module Name:    alu 
// Target Devices: Xilinx Spartan 3E Starter Board
///////////////////////////////////////////////////////////////////////////////
module alu(
    input [2:0] op,
    input signed [7:0] a,
    input signed [7:0] b,
    output signed [7:0] result,
    output z,
    output n
    );
    
    localparam ADD  = 3'b001;
    localparam SUB  = 3'b010;
    localparam NAND = 3'b011;
    localparam SHL  = 3'b100;
    localparam SHR  = 3'b101;
    
    assign result = op == ADD ? a + b :
                    op == SUB ? a - b :
                    op == NAND ? ~(a & b) :
                    op == SHL ? {a[6:0], 1'b0} :
                    op == SHR ? {1'b0, a[7:1]} : 8'bzzzzzzzz;
                    
    assign z = op == ADD || op == SUB || op == NAND ? result == 0 :
               op == SHL ? a[7] :
               op == SHR ? a[0] : 1'bz; 

    assign n = op == ADD || op == SUB || op == NAND ? result < 0 : 1'bz; 
    
endmodule
