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
module ripple(led0,led1,led2,led3,led4,led5,led6,led7,clk
    );
input clk;
output led0,led1,led2,led3,led4,led5,led6,led7;
reg led0,led1,led2,led3,led4,led5,led6,led7;
reg [26:0] cnt;

always @(posedge clk)
begin
	cnt <= cnt + 1;
	if(cnt == `SHIFT_TIME)
	begin
		led1 <= led0;
		led2 <= led1;
		led3 <= led2;
		led4 <= led3;
		led5 <= led4;
		led6 <= led5;
		led7 <= led6;
		led0 <= led7;
		cnt <= 0;
	end
end

initial
begin
	led0 <= 1;
	led1 <= 0;
	led2 <= 0;
	led3 <= 0;
	led4 <= 0;
	led5 <= 0;
	led6 <= 0;
	led7 <= 0;
	cnt <= 0;
end

endmodule
