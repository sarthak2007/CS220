`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:39:27 02/25/2019 
// Design Name: 
// Module Name:    one 
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
module one(a,b,cin,add,sum,cout
    );
input a,b,cin,add;
output sum,cout;
wire sum,cout;
wire i;

assign i=b^add;
assign sum=a^i^cin;
assign cout=(a&i)|(i&cin)|(cin&a);


endmodule
