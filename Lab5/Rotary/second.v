`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:10:11 02/11/2019 
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
module second(clk,rot_event,rot_dir,led
    );
input clk,rot_event,rot_dir;
output [7:0] led;
reg [7:0] led;
reg prev=1;
initial begin
led <= 8'b00000001;
end

always @(posedge clk) begin
	if(prev==0 & rot_event==1) begin
		if(rot_dir==0) begin
			led[0] <= led[1];
			led[1] <= led[2];
			led[2] <= led[3];
			led[3] <= led[4];
			led[4] <= led[5];
			led[5] <= led[6];
			led[6] <= led[7];
			led[7] <= led[0];
		end
		if(rot_dir==1) begin
			led[1] <= led[0];
			led[2] <= led[1];
			led[3] <= led[2];
			led[4] <= led[3];
			led[5] <= led[4];
			led[6] <= led[5];
			led[7] <= led[6];
			led[0] <= led[7];
		end
	end
	prev <= rot_event;
end


endmodule
