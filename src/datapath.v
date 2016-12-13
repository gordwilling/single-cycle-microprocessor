`timescale 1ns / 1ps

`include "adder.v"
`include "alu.v"
`include "branchLogic.v"
`include "mux2.v"
`include "mux8.v"
`include "regFile.v"

///////////////////////////////////////////////////////////////////////////////
// ENGI-0538-WB Computer Organization
// Lab Project: Single Cycle Processor
// Author: Gordon Wallace
// Create Date:    17:03:01 03/23/2013 
// Module Name:    datapath 
// Target Devices: Xilinx Spartan 3E Starter Board
///////////////////////////////////////////////////////////////////////////////
module datapath(
    input clk,
    input rst,
    input [2:0] rfSrc,    
    input [2:0] aluOp,
    input branch,
    input branchIf,
    input pcSrc,
    input rfWrite,
    input outWrite,
    input lrWrite,
    input zWrite,
    input nWrite,
    input [15:0] instr,
    input [7:0] fromInputPort,
    input [7:0] fromDataMemory,
    output [7:0] pc,
    output [7:0] toOutputPort,
    output [7:0] toDataMemoryAddress,
    output [7:0] toDataMemory
    );
    
    wire [7:0] pcNext;
    wire [7:0] pcPlus2;
    wire [7:0] pcBranch;
    wire [7:0] lr;
    wire branchPCMuxCtrl;
    
    wire [7:0] rfData1;
    wire [7:0] rfData2;
    wire [7:0] rfWriteData;
    wire [7:0] aluResult;
    wire aluZ;
    wire aluN;
    wire z;
    wire n;
    
    assign toDataMemory = rfData1;
    assign toDataMemoryAddress = instr[15:8];    
    
    regWithRst #(8) pcReg( 
        .clk(~clk), 
        .rst(rst), 
        .we(1'b1), 
        .d(pcNext), 
        .q(pc) 
        );
        
    regWithRst #(8) linkReg( 
        .clk(~clk), 
        .rst(rst), 
        .we(lrWrite), 
        .d(pcPlus2), 
        .q(lr) 
        ); 

    regWithRst #(1) zReg(
        .clk(clk),
        .rst(rst),
        .we(zWrite),
        .d(aluZ),
        .q(z)
        );  
        
    regWithRst #(1) nReg(
        .clk(clk),
        .rst(rst),
        .we(nWrite),
        .d(aluN),
        .q(n)
        );

    regWithRst #(8) outputPortReg( 
        .clk(clk), 
        .rst(rst), 
        .we(outWrite), 
        .d(rfData1), 
        .q(toOutputPort)
        );        
        
    adder pcAdder( 
        .a(pc), 
        .b(8'h02), 
        .result(pcPlus2) 
        ); 
        
    branchLogic branchLogic( 
        .branch(branch), 
        .branchIf(branchIf), 
        .brx(instr[3]), 
        .z(z), 
        .n(n), 
        .result(branchPCMuxCtrl) 
        );
        
    mux2 branchPCMux( 
        .in0(pcPlus2), 
        .in1(instr[15:8]), 
        .select(branchPCMuxCtrl), 
        .out(pcBranch) 
        );
        
    mux2 pcSrcMux( 
        .in0(pcBranch), 
        .in1(lr), 
        .select(pcSrc), 
        .out(pcNext) );
        
    alu alu(   
        .op(aluOp), 
        .a(rfData1), 
        .b(rfData2), 
        .result(aluResult), 
        .z(aluZ), 
        .n(aluN)
        );
        
    regFile rf( 
        .clk(clk), 
        .we(rfWrite), 
        .rr1(instr[3:2]), 
        .rr2(instr[1:0]), 
        .wr(instr[3:2]), 
        .wd(rfWriteData), 
        .rd1(rfData1), 
        .rd2(rfData2)
        );
        
     mux8 rfSrcMux( 
        .in0(8'h00/* not used */), 
        .in1(rfData2),
        .in2(aluResult), 
        .in3(fromDataMemory), 
        .in4(fromInputPort), 
        .in5(instr[15:8]), 
        .in6(8'h00/* not used */), 
        .in7(8'h00/* not used */),         
        .select(rfSrc), 
        .out(rfWriteData) 
        ); 
endmodule
