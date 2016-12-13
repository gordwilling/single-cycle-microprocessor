`timescale 1ns / 1ps
///////////////////////////////////////////////////////////////////////////////
// ENGI-0538-WB Computer Organization
// Lab Project: Single Cycle Processor
// Author: Gordon Wallace
// Create Date:    15:46:15 03/23/2013 
// Module Name:    freqDivider 
// Target Devices: Xilinx Spartan 3E Starter Board
///////////////////////////////////////////////////////////////////////////////
module freqDivider #(parameter N = 20)(
     input clk,
     input rst,
     output d
    );
    
    reg [N:0] q;
    
    always @ ( posedge clk, posedge rst )
    begin
        if ( rst ) begin
            q <= 0;
        end else begin
            q <= q + 1;
        end
    end
    
    assign d = q[N];    
endmodule
