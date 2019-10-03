`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:17:28 03/11/2019 
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
module top(clk,rot_a,rot_b,y,LCD_RS,LCD_W,LCD_E,data
    );
input clk,rot_a,rot_b;
input [3:0] y;
output LCD_RS,LCD_W,LCD_E;
output [3:0] data;
wire LCD_RS,LCD_W,LCD_E;
wire [3:0] data;
wire rot_event;
wire [127:0] first;
wire [127:0] second;
wire [10:0] cnti;
rot_event u1(clk,rot_a,rot_b,rot_event);
regist u2(clk,y,rot_event,first,second,cnti);
driver de(cnti,first,second,clk,LCD_RS,LCD_W,LCD_E,data);

endmodule