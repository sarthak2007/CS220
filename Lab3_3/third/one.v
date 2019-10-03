`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:00:53 01/28/2019 
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
module one(a,b,cin,sum,cout
    );
input a,b,cin;
output sum,cout;
wire cout,sum;
assign sum= a^b^cin;
assign cout= (a&b)|(b&cin)|(cin&a);

endmodule
