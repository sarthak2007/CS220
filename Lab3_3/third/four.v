`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:03:10 01/28/2019 
// Design Name: 
// Module Name:    four 
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
module four(x,y,z,carry
    );
	input [3:0] x;
	input [3:0] y;
	output [3:0] z;
	wire [3:0] z;
	output carry;
	wire carry,carry0,carry1,carry2;
	
	one f0(x[0],y[0],1'b0,z[0],carry0);
	one f1(x[1],y[1],carry0,z[1],carry1);
	one f2(x[2],y[2],carry1,z[2],carry2);
	one f3(x[3],y[3],carry2,z[3],carry);

endmodule
