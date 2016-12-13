`timescale 1ns / 1ps

`include "scp.v"
`include "freqDivider.v"
`include "regWithRst.v"

///////////////////////////////////////////////////////////////////////////////
// ENGI-0538-WB Computer Organization
// Lab Project: Single Cycle Processor
// Author: Gordon Wallace
// Create Date:    22:45:03 03/23/2013 
// Module Name:    computer 
// Target Devices: Xilinx Spartan 3E Starter Board
//
// Description:
//
// This is the top-level module of the project, consisting
// of the single cycle processor, memories, and i/o ports
// 
///////////////////////////////////////////////////////////////////////////////
module computer( 
        input clk, 
        input rst, 
        input[7:0] inputPort, 
        output[7:0] outputPort 
        );
    
    wire varClk;    
    wire memWrite;
    wire [7:0] pc;  
    wire [7:0] fromDataMemory;
    wire [7:0] toDataMemory;
    wire [7:0] toDataMemoryAddress;
    wire [15:0] instr;
    
    // for simulation, set parameter to 0
    // for board demo, set parameter to 20
    freqDivider #(20) fd(
        .clk(clk),
        .rst(rst),
        .d(varClk)
        ); 
    
    instrMem imem (
        .clka(varClk), 
        .addra(pc), 
        .douta(instr[7:0]), 
        .clkb(varClk), 
        .addrb(pc + 1'b1), 
        .doutb(instr[15:8]) 
        );  

    dataMem dmem (
        .clka(~varClk), 
        .wea(memWrite), 
        .addra(toDataMemoryAddress), 
        .dina(toDataMemory), 
        .douta(fromDataMemory) 
        );
       
    scp cpu(
        .clk(varClk),
        .rst(rst),
        .instr(instr),
        .inputPort(inputPort),
        .fromDataMemory(fromDataMemory),
        .pc(pc),
        .outputPort(outputPort),
        .toDataMemoryAddress(toDataMemoryAddress),
        .toDataMemory(toDataMemory),
        .memWrite(memWrite)
        );        
endmodule
