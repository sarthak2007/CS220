`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:39:17 02/25/2019 
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
module top(clk,rot_a,rot_b,y,a,b
    );
input clk,rot_a,rot_b;
input [3:0] y;

output [3:0] a;
output [3:0] b;
wire [3:0] a;
wire [3:0] b;
wire rot_event;

rot_event u1(clk,rot_a,rot_b,rot_event);
rising u2(clk,rot_event,y,a,b);

endmodule