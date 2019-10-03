`timescale 1ns / 1ps
`define OFF_TIME 25000000
`define ON_TIME (`OFF_TIME*2)
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:43:04 01/28/2019 
// Design Name: 
// Module Name:    led 
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
module led(clk,led0
    );
	input clk;
	output led0;
	reg led0;
	reg [26:0] cnt;
	
always @(posedge clk)
begin
		cnt <= cnt + 1;
		//$display("%d",cnt);
		if(cnt == `OFF_TIME)
		begin
			led0 <= 0;
			//$display("1");
			end
		if(cnt == `ON_TIME)
		begin
			led0 <= 1;
			cnt <= 0;
		end
end

initial
begin
	cnt <= 0;
	led0 <= 0;
end

endmodule
