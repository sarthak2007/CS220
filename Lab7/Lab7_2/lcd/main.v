`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:29:51 03/04/2019 
// Design Name: 
// Module Name:    main 
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
module main(clk,rot_event,y,first,second,cnt
    );
input clk,rot_event;
input [2:0] y;
reg prev=0;
output [3:0] cnt;
reg [3:0] cnt=0;
output [127:0] first;
output [127:0] second;
reg [127:0] first;
reg [127:0] second;
reg [2:0] a;
reg [2:0] b;
reg [2:0] c;
reg [2:0] d;
reg [1:0] index;
reg [7:0] a1;
reg [7:0] b1;
reg [7:0] c1;
reg [7:0] d1;
reg [7:0] e1;
always @(posedge clk) begin
	if(prev==0 & rot_event==1) begin
		if(cnt==0)
			cnt<=1;
		if( cnt == 1 ) begin
			a<= y;
			cnt <= cnt+1;
		end
		if( cnt == 2 ) begin
			b<= y;
			cnt <= cnt+1;
		end
		if( cnt == 3 ) begin
			c<= y;
			cnt <= cnt+1;
		end
		if( cnt == 4 ) begin
			d<= y;
			cnt <= cnt+1;
		end
		if( cnt == 5 ) begin
			if(a<=b && a<=c && a<=d)
				index<=0;
			else if(b<=a && b<=c && b<=d)
				index<=1;
			else if(c<=a && c<=b && c<=d)
				index<=2;
			else if(d<=a && d<=c && d<=b)
				index<=3;
			a1<=a+48;
			b1<=b+48;
			c1<=c+48;
			d1<=d+48;
			cnt<= cnt+1;
		end
		if (cnt == 6) begin
			e1<=index+48;
			cnt <= cnt+1;
		end
		if (cnt == 7) begin
			first<={a1,", ",b1,", ",c1,", ",d1,"      "};
			second<={e1,"               "};
			cnt <= cnt+1;
		end
		else if(cnt==8) 
			cnt<=0;
	end
	prev <= rot_event;
end



endmodule
