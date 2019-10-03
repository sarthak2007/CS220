`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:33:20 03/04/2019 
// Design Name: 
// Module Name:    second 
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
module second(clk,rot_event,y,led
    );
input clk,rot_event;
input [1:0] y;
output [3:0] led;
reg [3:0] led;
reg [2:0] ROM [0:12];
reg prev=1;
reg [3:0] prevs=0;
reg [40:0] cnt=0;
initial begin
	ROM[0]=0;
	ROM[1]=0;
	ROM[2]=0;
	ROM[3]=1;
	ROM[4]=2;
	ROM[5]=2;
	ROM[6]=0;
	ROM[7]=0;
	ROM[8]=0;
	ROM[9]=0;
	ROM[10]=3;
	ROM[11]=4;
	ROM[12]=4;
end
always @(posedge clk) begin
	cnt <= cnt+1;
	
	if(prev==0 & rot_event==1) begin		
		if(ROM[prevs]==0) begin
			led <= prevs+1;
		end
		if(ROM[prevs]==2) begin
			led <= 7;
		end
		if(ROM[prevs]==4) begin
			led <= 0;
		end
		if(ROM[prevs]==1) begin
			if(y==0)
				led<=4;
			else if(y==1)
				led<=5;
			else
				led<=6;
		end
		if(ROM[prevs]==3) begin
			if(y==0)
				led<=11;
			else
				led<=12;
		end
		prevs<=led;

	end
	else if(cnt==100000000) begin
		cnt<=0;
		if(ROM[prevs]==0) begin
			led <= prevs+1;
		end
		if(ROM[prevs]==2) begin
			led <= 7;
		end
		if(ROM[prevs]==4) begin
			led <= 0;
		end
		if(ROM[prevs]==1) begin
			if(y==0)
				led<=4;
			else if(y==1)
				led<=5;
			else
				led<=6;
		end
		if(ROM[prevs]==3) begin
			if(y==0)
				led<=11;
			else
				led<=12;
		end
		prevs<=led;
	end
		prev <= rot_event;
	if(cnt==100000000)
		cnt<=0;
end
 


endmodule
