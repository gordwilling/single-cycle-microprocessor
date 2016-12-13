`timescale 1ns / 1ps

`include "datapath.v"
`include "controller.v"

///////////////////////////////////////////////////////////////////////////////
// ENGI-0538-WB Computer Organization
// Lab Project: Single Cycle Processor
// Author: Gordon Wallace
// Create Date:    21:40:24 03/23/2013 
// Module Name:    scp 
// Target Devices: Xilinx Spartan 3E Starter Board
//
// Description: The single cycle processing unit
///////////////////////////////////////////////////////////////////////////////
module scp(
    input clk,
    input rst,
    input [15:0] instr,
    input [7:0] inputPort,
    input [7:0] fromDataMemory,
    output [7:0] pc,
    output [7:0] outputPort,
    output [7:0] toDataMemoryAddress,
    output [7:0] toDataMemory,
    output memWrite
   );

    wire[2:0] rfSrc;
    wire[2:0] aluOp;    
    wire branchIf;
    wire branch;
    wire pcSrc;
    wire rfWrite;
    wire lrWrite;
    wire nWrite;
    wire zWrite;
    wire outWrite;

    controller c(
        .opCode(instr[7:4]), 
        .rfSrc(rfSrc),         
        .aluOp(aluOp), 
        .branchIf(branchIf), 
        .branch(branch), 
        .rfWrite(rfWrite), 
        .outWrite(outWrite), 
        .memWrite(memWrite), 
        .pcSrc(pcSrc), 
        .lrWrite(lrWrite ),
        .zWrite(zWrite),
        .nWrite(nWrite)        
       );

    datapath dp(
        .clk(clk), 
        .rst(rst),
        .rfSrc(rfSrc),          
        .aluOp(aluOp), 
        .branchIf(branchIf), 
        .branch(branch),  
        .pcSrc(pcSrc),
        .rfWrite(rfWrite),         
        .lrWrite(lrWrite),
        .zWrite(zWrite),
        .nWrite(nWrite),     
        .outWrite(outWrite),                      
        .instr(instr),
        .fromInputPort(inputPort),
        .fromDataMemory(fromDataMemory),
        .pc(pc),
        .toOutputPort(outputPort),
        .toDataMemoryAddress(toDataMemoryAddress),
        .toDataMemory(toDataMemory)
       ); 
endmodule
