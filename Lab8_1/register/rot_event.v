`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:08:25 03/11/2019 
// Design Name: 
// Module Name:    rot_event 
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
module rot_event(clk,rot_a,rot_b,rot_event
    );
input clk,rot_a,rot_b;
output rot_event;
reg rot_event;
always @(posedge clk) begin
	if(rot_a == 1 & rot_b==1)
		rot_event <= 1;
	if(rot_a == 0 & rot_b==0)
		rot_event <= 0;
	
end
endmodule
