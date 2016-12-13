`timescale 1ns / 1ps
///////////////////////////////////////////////////////////////////////////////
// ENGI-0538-WB Computer Organization
// Lab Project: Single Cycle Processor
// Author: Gordon Wallace
// Create Date:    19:43:27 03/23/2013  
// Module Name:    controller 
// Target Devices: Xilinx Spartan 3E Starter Board
//
// Description:
//
// Each control signal is embedded in a 15 bit control word as follows: 
//
// OpCode Mnemonic Rf   Rf     Out     ALU  Branch  Branch Mem    PC   LR    Z      N
//                 Src  Write  Write   Op   If             Write  Src  Write Write  Write  
//   0    NOP      000    0      0     000    0       0     0      0    0     0      0 
//   1    ADD      010    1      0     001    0       0     0      0    0     1      1
//   2    SUB      010    1      0     010    0       0     0      0    0     1      1
//   3    NAND     010    1      0     011    0       0     0      0    0     1      1
//   4    SHL      010    1      0     100    0       0     0      0    0     1      0
//   5    SHR      010    1      0     101    0       0     0      0    0     1      0
//   6    OUT      000    0      1     000    0       0     0      0    0     0      0
//   7    IN       100    1      0     000    0       0     0      0    0     0      0
//   8    MOV      001    1      0     000    0       0     0      0    0     0      0
//   9    BR       000    0      0     000    0       1     0      0    0     0      0
//   A    BR.Z     000    0      0     000    1       0     0      0    0     0      0
//   A    BR.N     000    0      0     000    1       0     0      0    0     0      0
//   B    BR.SUB   000    0      0     000    0       1     0      0    1     0      0
//   C    RETURN   000    0      0     000    0       0     0      1    0     0      0
//   D    LOAD     011    1      0     000    0       0     0      0    0     0      0 
//   E    STORE    000    0      0     000    0       0     1      0    0     0      0
//   F    LOADIMM  101    1      0     000    0       0     0      0    0     0      0
////////////////////////////////////////////////////////////////////////////////////////
module controller(
    input [3:0] opCode,
    output [2:0]rfSrc,
    output [2:0] aluOp,
    output branchIf,
    output branch,    
    output rfWrite,    
    output outWrite,
    output memWrite,
    output pcSrc,
    output lrWrite,
    output zWrite,
    output nWrite        
    );
    
    wire[14:0] controlWord;
    
    assign controlWord = opCode == 4'h0 ? 15'b000000000000000 :
                         opCode == 4'h1 ? 15'b010100010000011 :
                         opCode == 4'h2 ? 15'b010100100000011 :
                         opCode == 4'h3 ? 15'b010100110000011 :
                         opCode == 4'h4 ? 15'b010101000000010 :
                         opCode == 4'h5 ? 15'b010101010000010 :
                         opCode == 4'h6 ? 15'b000010000000000 :
                         opCode == 4'h7 ? 15'b100100000000000 :
                         opCode == 4'h8 ? 15'b001100000000000 :
                         opCode == 4'h9 ? 15'b000000000100000 :
                         opCode == 4'hA ? 15'b000000001000000 :
                         opCode == 4'hB ? 15'b000000000100100 :
                         opCode == 4'hC ? 15'b000000000001000 :
                         opCode == 4'hD ? 15'b011100000000000 :
                         opCode == 4'hE ? 15'b000000000010000 : 15'b101100000000000;
                         
    assign rfSrc = controlWord[14:12];
    assign rfWrite = controlWord[11];
    assign outWrite = controlWord[10];
    assign aluOp = controlWord[9:7];
    assign branchIf = controlWord[6];
    assign branch = controlWord[5];
    assign memWrite = controlWord[4];
    assign pcSrc = controlWord[3];
    assign lrWrite = controlWord[2];
    assign zWrite = controlWord[1];
    assign nWrite = controlWord[0];
endmodule
