`timescale 1ns / 1ps
///////////////////////////////////////////////////////////////////////////////
// ENGI-0538-WB Computer Organization
// Lab Project: Single Cycle Processor
// Author: Gordon Wallace
// Create Date:    16:42:25 03/23/2013 
// Module Name:    mux8
// Target Devices: Xilinx Spartan 3E Starter Board
///////////////////////////////////////////////////////////////////////////////
module mux8(
    input [7:0] in0,
    input [7:0] in1,
    input [7:0] in2,
    input [7:0] in3,
    input [7:0] in4,
    input [7:0] in5,
    input [7:0] in6,
    input [7:0] in7,
    input [2:0] select,
    output [7:0] out
    );

    assign out = select == 3'b000 ? in0 :
                 select == 3'b001 ? in1 :
                 select == 3'b010 ? in2 :
                 select == 3'b011 ? in3 :
                 select == 3'b100 ? in4 :
                 select == 3'b101 ? in5 :
                 select == 3'b110 ? in6 : in7;
endmodule
