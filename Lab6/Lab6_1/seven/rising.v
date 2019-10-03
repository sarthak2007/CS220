`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:07:22 02/25/2019 
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
module rising(clk,rot_event,y,led
    );
input clk,rot_event;
input [3:0] y;
output [7:0] led; 

wire [7:0] led;
reg prev=1;
reg [2:0] cnt=3'b000;
reg [6:0] a;
reg [6:0] b;
wire [6:0] c;
reg add;



always @(posedge clk) begin
	if(prev==0 & rot_event==1) begin
		if( cnt == 3'b000 ) begin
			a[3:0] <= y;
			cnt <= cnt+1;
		end
		if( cnt == 3'b001 ) begin
			a[6:4] <= y[2:0];
			cnt <= cnt+1;
		end
		if( cnt == 3'b010 ) begin
			b[3:0] <= y;
			cnt <= cnt+1;
		end
		if( cnt == 3'b011 ) begin
			b[6:4] <= y[2:0];
			cnt <= cnt+1;
		end
		if( cnt == 3'b100 ) begin
			add <= y[0];
			cnt <= 0;
		end
	end
	prev <= rot_event;
end

one o1(a[0],b[0],add,add,led[0],c[0]);

one o2(a[1],b[1],c[0],add,led[1],c[1]);

one o3(a[2],b[2],c[1],add,led[2],c[2]);

one o4(a[3],b[3],c[2],add,led[3],c[3]);

one o5(a[4],b[4],c[3],add,led[4],c[4]);

one o6(a[5],b[5],c[4],add,led[5],c[5]);

one o7(a[6],b[6],c[5],add,led[6],c[6]);

assign led[7]=(c[5]^c[6]);

endmodule
