`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:39:24 01/21/2019 
// Design Name: 
// Module Name:    eight 
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
module eight(pb1,pb2,pb3,pb4,y,l,g,e
    );
input pb1,pb2,pb3,pb4;
input [3:0] y;
output l,g,e;

wire l,g,e;
reg [7:0] a;
reg [7:0] b;
wire [6:0] carry;
reg [7:0] l1;
reg [7:0] g1;
reg [7:0] e1;
always @(posedge pb1) begin
		a[3:0] <= y;
	end
always @(posedge pb2) begin
	a[7:4] <= y[3:0];
end
always @(posedge pb3) begin
	b[3:0] <= y;
end
always @(posedge pb4) begin
	b[7:4] <= y[3:0];
end
onebit fa0(a[0],b[0],1'b0,1'b0,1'b1,l1[0],g1[0],e1[0]);
onebit fa1(a[1],b[1],l1[0],g1[0],e1[0],l1[1],g1[1],e1[1]);
onebit fa2(a[2],b[2],l1[1],g1[1],e1[1],l1[2],g1[2],e1[2]);
onebit fa3(a[3],b[3],l1[2],g1[2],e1[2],l1[3],g1[3],e1[3]);
onebit fa4(a[4],b[4],l1[3],g1[3],e1[3],l1[4],g1[4],e1[4]);
onebit fa5(a[5],b[5],l1[4],g1[4],e1[4],l1[5],g1[5],e1[5]);
onebit fa6(a[6],b[6],l1[5],g1[5],e1[5],l1[6],g1[6],e1[6]);
onebit fa7(a[7],b[7],l1[6],g1[6],e1[6],l,g,e);
endmodule
