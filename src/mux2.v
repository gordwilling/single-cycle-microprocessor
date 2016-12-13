`timescale 1ns / 1ps
///////////////////////////////////////////////////////////////////////////////
// ENGI-0538-WB Computer Organization
// Lab Project: Single Cycle Processor
// Author: Gordon Wallace
// Create Date:    16:37:21 03/23/2013 
// Module Name:    mux2 
// Target Devices: Xilinx Spartan 3E Starter Board
///////////////////////////////////////////////////////////////////////////////
module mux2(
    input [7:0] in0,
    input [7:0] in1,
    input select,
    output [7:0] out
    );

    assign out = select ? in1 : in0;
endmodule
