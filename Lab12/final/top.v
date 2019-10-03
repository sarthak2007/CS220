`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:41:11 04/15/2019 
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
reg [2:0] mem[0:7];
reg [4:0] rc=0;
reg [4:0] cnt=0;
reg [4:0] cnt1=0;
reg [7:0] xo=0;
initial begin
	mem[0]<=3;mem[1]<=4;mem[2]<=7;mem[3]<=2;
	mem[4]<=3;mem[5]<=5;mem[6]<=0;mem[7]<=2;
end

always @(posedge clk) begin
	if(rc!=8) begin
		xo <= xo^(1<<mem[rc]);
		rc <= rc+1;
	end
	if(y==0)
		led <= xo;
	else begin
		if(cnt!=8) begin
			cnt1 <= cnt1+(xo[0]&1);
			xo <= (xo>>1);
			cnt <= cnt+1;
		end
		else begin
			if((cnt1[0]&1)==1) led<={7'd0,1};
			else led<=0;
		end
		
	end
	
end

endmodule
