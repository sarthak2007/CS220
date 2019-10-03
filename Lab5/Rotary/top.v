`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:19:24 02/11/2019 
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
module top(clk,rot_a,rot_b,led
    );
input clk,rot_a,rot_b;
output [7:0] led;
wire [7:0] led;
wire rot_event,rot_dir;
first u1(clk,rot_a,rot_b,rot_event,rot_dir);
second u2(clk,rot_event,rot_dir,led);

endmodule
