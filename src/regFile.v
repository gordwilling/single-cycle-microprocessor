`timescale 1ns / 1ps
///////////////////////////////////////////////////////////////////////////////
// ENGI-0538-WB Computer Organization
// Lab Project: Single Cycle Processor
// Author: Gordon Wallace
// Create Date:    17:10:04 03/18/2013 
// Module Name:    regFile 
// Target Devices: Xilinx Spartan 3E Starter Board
///////////////////////////////////////////////////////////////////////////////
module regFile(
    input clk,
    input we,
    input [1:0] rr1,
    input [1:0] rr2,
    input [1:0] wr,
    input [7:0] wd,
    output [7:0] rd1,
    output [7:0] rd2
    );
    
    reg [7:0] r[3:0];
    
    always @ ( posedge clk )
    begin
        if ( we )
        begin
            r[wr] <= wd;
        end
    end

    assign rd1 = r[rr1];                 
    assign rd2 = r[rr2];
    
endmodule
