`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:09:24 01/28/2019 
// Design Name: 
// Module Name:    final 
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
module final(pb1,pb2,pb3,pb4,pb5,y,sum,cout
    );
input pb1,pb2,pb3,pb4,pb5;
input [3:0] y;
output [5:0] sum;
output cout;
wire [5:0] sum;
wire cout;
reg [3:0] a;
wire [4:0] p;
wire [4:0] q;
wire [5:0] r;
reg [3:0] b;
reg [3:0] c;
reg [3:0] d;
reg [3:0] e;
reg [5:0] f;
wire [6:0] carry;
always @(posedge pb1) begin
		a[3:0] <= y;
	end
always @(posedge pb2) begin
	b[3:0] <= y;
end
always @(posedge pb3) begin
	c[3:0] <= y;
end
always @(posedge pb4) begin
	d[3:0] <= y;
end
always @(posedge pb5) begin
	e[3:0] <= y;
	f <= {2'b00, y};
end



four f0(a,b,p[3:0],p[4]);
four f1(c,d,q[3:0],q[4]);
five f2(p,q,r[4:0],r[5]);
six f3(r,f,sum,cout);

endmodule
