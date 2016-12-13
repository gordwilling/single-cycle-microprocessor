`timescale 1ns / 1ps
///////////////////////////////////////////////////////////////////////////////
// ENGI-0538-WB Computer Organization
// Lab Project: Single Cycle Processor
// Author: Gordon Wallace
// Create Date:    16:32:59 03/23/2013 
// Module Name:    adder 
// Target Devices: Xilinx Spartan 3E Starter Board
///////////////////////////////////////////////////////////////////////////////
module adder(
    input [7:0] a,
    input [7:0] b,
    output [7:0] result
    );
    
    assign result = a + b;    
endmodule
