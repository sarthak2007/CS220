`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:51:03 02/04/2019 
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
module top(clk,LCD_RS,LCD_W,LCD_E,data
    );
input clk;
output LCD_RS,LCD_W,LCD_E;
output [3:0] data;
wire LCD_RS,LCD_W,LCD_E;
wire [3:0] data;
reg [127:0] first;
reg [127:0] second;
initial begin
first="WELCOME TO CSE, ";
second="IIT KANPUR      ";
end

driver d(first,second,clk,LCD_RS,LCD_W,LCD_E,data);

endmodule
