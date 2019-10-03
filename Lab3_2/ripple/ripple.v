`timescale 1ns / 1ps
`define SHIFT_TIME 50000000
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:20:14 01/28/2019 
// Design Name: 
// Module Name:    ripple 
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
module ripple(led,clk
    );
input clk;
ouput led;
reg [7:0] led;
reg [26:0] cnt;

always @(posedge clk)
begin
	cnt <= cnt + 1;
	if(cnt == `SHIFT_TIME)
	begin
		led[1] <= led[0];
		led[2] <= led[1];
		led[3] <= led[2];
		led[4] <= led[3];
		led[5] <= led[4];
		led[6] <= led[5];
		led[7] <= led[6];
		led[0] <= led[7];
		cnt <= 0;
	end
end

initial
begin
	led[0] <= 1;
	cnt <= 0;
end

endmodule
