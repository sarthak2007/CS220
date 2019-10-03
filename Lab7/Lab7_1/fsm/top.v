`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:51:46 03/04/2019 
// Design Name: 
// Module Name:    top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module top(clk,rot_a,rot_b,y,led
    );
input clk,rot_a,rot_b;
input [1:0] y;

output [3:0] led;

wire [3:0] led;
wire rot_event;

first u1(clk,rot_a,rot_b,rot_event);
second u2(clk,rot_event,y,led);


endmodule
