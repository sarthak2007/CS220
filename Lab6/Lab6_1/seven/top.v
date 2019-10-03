`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:42:20 02/25/2019 
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
input [3:0] y;

output [7:0] led;
wire [7:0] led;
wire rot_event;

rot_event u1(clk,rot_a,rot_b,rot_event);
rising u2(clk,rot_event,y,led);

endmodule