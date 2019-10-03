`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:36:30 01/21/2019 
// Design Name: 
// Module Name:    seven_bit_adder 
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
module seven_bit_adder(pb1,pb2,pb3,pb4,y,sum,cout
    );
input pb1,pb2,pb3,pb4;
input [3:0] y;
output [6:0] sum;
output cout;
wire [6:0] sum;
wire cout;
reg [6:0] a;
reg [6:0] b;
wire [6:0] carry;
always @(posedge pb1) begin
		a[3:0] <= y;
	end
always @(posedge pb2) begin
	a[6:4] <= y[2:0];
end
always @(posedge pb3) begin
	b[3:0] <= y;
end
always @(posedge pb4) begin
	b[6:4] <= y[2:0];
end
full_adder fa0(a[0],b[0],1'b0,sum[0],carry[0]);
full_adder fa1(a[1],b[1],carry[0],sum[1],carry[1]);
full_adder fa2(a[2],b[2],carry[1],sum[2],carry[2]);
full_adder fa3(a[3],b[3],carry[2],sum[3],carry[3]);
full_adder fa4(a[4],b[4],carry[3],sum[4],carry[4]);
full_adder fa5(a[5],b[5],carry[4],sum[5],carry[5]);
full_adder fa6(a[6],b[6],carry[5],sum[6],cout);

endmodule
