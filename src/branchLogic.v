`timescale 1ns / 1ps
///////////////////////////////////////////////////////////////////////////////
// ENGI-0538-WB Computer Organization
// Lab Project: Single Cycle Processor
// Author: Gordon Wallace
// Create Date:    18:25:00 03/23/2013 
// Module Name:    branchLogic 
// Target Devices: Xilinx Spartan 3E Starter Board
///////////////////////////////////////////////////////////////////////////////
module branchLogic(
    input branch,
    input branchIf,
    input brx,
    input z,
    input n,
    output result
    );
    
    assign result = (brx & branchIf & n) | (~brx & branchIf & z) | branch;
endmodule
