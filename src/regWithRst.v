`timescale 1ns / 1ps
///////////////////////////////////////////////////////////////////////////////
// ENGI-0538-WB Computer Organization
// Lab Project: Single Cycle Processor
// Author: Gordon Wallace
// Create Date:    16:02:39 03/18/2013 
// Module Name:    regWithRst
// Target Devices: Xilinx Spartan 3E Starter Board
//
// Description: N-bit wide D-FlipFlop with write enable and reset. 
///////////////////////////////////////////////////////////////////////////////
module regWithRst #(parameter N = 8)(
    input clk,
    input rst,
    input we,
    input [N-1:0] d,
    output reg [N-1:0] q
    );

    always @ ( posedge clk, posedge rst )
    begin
        if ( rst )
        begin
            q <= 0;
        end
        else if ( we )
        begin
            q <= d;
        end
    end
endmodule
