`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:25:14 03/25/2019 
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
module top(clk,y,led
    );
input clk;
input y;
output [7:0] led;
reg [7:0] led;
reg [2:0] pc=0;
reg [2:0] r,i,j;
reg [2:0] cnt=0;
reg [2:0] c3;
reg [2:0] c4;
reg [2:0] c5;
reg [2:0] c6;
reg [31:0] inst[0:7];
reg [31:0] temp;

initial begin
	r<=0; i<=0;j<=0;
	c3<=0;c4<=0;c5<=0;c6<=0;
	inst[0] <= {6'h8,5'd0,5'd4,16'h3456};
	inst[1] <= {6'h8,5'd0,5'd5,16'hffff};
	inst[2] <= {6'h0,5'd5,5'd4,5'd6,5'd0,6'h20};
	inst[3] <= {6'h8,5'd0,5'd3,16'h0007};
	inst[4] <= {6'h0,5'd3,5'd6,5'd6,5'd0,6'h4};
	inst[5] <= {6'h0,5'd0,5'd3,5'd3,5'h1,6'h2};
	inst[6] <= {6'h23,5'b4,5'b5,16'h9abc};
	inst[7] <= {6'h2,26'h123456};			
end

always @(posedge clk) begin
	if(pc<8) begin
		temp <= inst[pc];
		cnt <= cnt+1;
	end
	if(cnt==1)	begin
		cnt<=0;
		if(temp[31:26]==0) begin
			r<=r+1;
			if(temp[16:11]==3)	c3<=c3+1;
			if(temp[16:11]==4)	c4<=c4+1;
			if(temp[16:11]==5)	c5<=c5+1;
			if(temp[16:11]==6)	c6<=c6+1;
		end
		else if(temp[31:26]==2 || temp[31:26]==3) begin
			j<=j+1;
		end
		else begin
			i<=i+1;
			if(temp[21:16]==3)	c3<=c3+1;
			if(temp[21:16]==4)	c4<=c4+1;
			if(temp[21:16]==5)	c5<=c5+1;
			if(temp[21:16]==6)	c6<=c6+1;
		end
		pc <= pc +1;
	end
	
	if(pc==8) begin
		if(y==0) begin
		led[2:0]<=r;
		led[5:3]<=i;
		led[7:6]<=j;
		end
		else begin
			led[1:0]<=c3;
			led[3:2]<=c4;
			led[5:4]<=c5;
			led[7:6]<=c6;
		end
	end
end

endmodule
