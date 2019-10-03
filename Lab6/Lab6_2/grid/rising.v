`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:42:03 02/25/2019 
// Design Name: 
// Module Name:    rising 
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
module rising(clk,rot_event,y,a,b
    );
input clk,rot_event;
input [3:0] y;
output [3:0] a;
output [3:0] b;
reg prev=1;
wire [3:0] a;
wire [3:0] b;
wire [4:0] a1;
wire [4:0] b1;
wire ca,cb;
reg [4:0] preva;
reg [4:0] prevb;
reg [1:0] stepa;
reg [1:0] stepb;
reg dir;
wire [10:0] c;

always @(posedge clk) begin
	if(prev==0 & rot_event==1) begin
		preva <= {0,a};
		prevb <= {0,b};		
		if( y[1:0]==2'b00) begin
			stepa <= 0;
			stepb <= y[3:2];
			dir<=0;
		end
		if( y[1:0]==2'b01) begin
			stepa <= 0;
			stepb <= y[3:2];
			dir<=1;
		end
		if( y[1:0]==2'b10) begin
			stepb <= 0;
			stepa <= y[3:2];
			dir<=0;
		end
		if( y[1:0]==2'b11) begin
			stepb <= 0;
			stepa <= y[3:2];
			dir<=1;
		end
	end
	prev <= rot_event;
end

one o1(preva[0],stepa[0],dir,dir,a1[0],c[0]);

one o2(preva[1],stepa[1],c[0],dir,a1[1],c[1]);

one o3(preva[2],0,c[1],dir,a1[2],c[2]);

one o4(preva[3],0,c[2],dir,a1[3],c[3]);
one o5(preva[4],0,c[3],dir,a1[4],c[4]);

one o6(prevb[0],stepb[0],dir,dir,b1[0],c[5]);

one o7(prevb[1],stepb[1],c[5],dir,b1[1],c[6]);

one o8(prevb[2],0,c[6],dir,b1[2],c[7]);

one o9(prevb[3],0,c[7],dir,b1[3],c[8]);
one o10(prevb[4],0,c[8],dir,b1[4],c[9]);

assign a[0]=(c[3]^c[4])|(a1[0] & (~a1[4]));
assign a[1]=(c[3]^c[4])|(a1[1] & (~a1[4]));
assign a[2]=(c[3]^c[4])|(a1[2] & (~a1[4]));
assign a[3]=(c[3]^c[4])|(a1[3] & (~a1[4]));
assign b[0]=(c[8]^c[9])|(b1[0] & (~b1[4]));
assign b[1]=(c[8]^c[9])|(b1[1] & (~b1[4]));
assign b[2]=(c[8]^c[9])|(b1[2] & (~b1[4]));
assign b[3]=(c[8]^c[9])|(b1[3] & (~b1[4]));
endmodule
