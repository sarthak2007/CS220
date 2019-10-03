`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:00:08 02/04/2019 
// Design Name: 
// Module Name:    driver 
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
module driver(first,second,clk,LCD_RS,LCD_W,LCD_E,data
    );
input [127:0] first;
input [127:0] second;
input clk;
output LCD_RS,LCD_W,LCD_E;
output [3:0] data;
reg LCD_RS,LCD_W,LCD_E;
reg [3:0] data;
reg [25:0] cnt;
reg [5:0] state;
reg [5:0] local;
reg [2:0] temp;
reg [8:0] pos;
reg [8:0] pos1;
reg [5:0] count;
initial begin
cnt <= 0;
state <= 1;
local <= 0;
temp <= 0;
pos <= 127;
pos1 <= 127;
count <= 0;
end

always @(posedge clk) begin
	cnt <= cnt + 1;
	if(state == 1) begin
		
		if(cnt == 1000000) begin
			cnt <= 0;
			if(temp == 3) begin
				if(local == 0) begin
					LCD_E <= 0; local <= 1;
				end
				else if(local == 1) begin
					LCD_RS <= 0;LCD_W <= 0;data <= 4'b0010;
					local <= 2;
				end
				else if(local == 2) begin
					LCD_E <= 1;
					state <= 2;local <= 0;
				end
			end
			else begin
				if(local == 0) begin
					LCD_E <= 0;	local <= 1;
				end
				else if(local == 1) begin
					LCD_RS <= 0;LCD_W <= 0; data <= 4'b0011;
					local <= 2;
				end
				else if(local == 2) begin
					LCD_E <= 1; local <= 0;
					temp <= temp + 1;
				end
			end
			
		end
	end
	
	else if(state == 2) begin
		if(cnt == 1000000) begin
			cnt <= 0;
			if(local == 0) begin
				LCD_E <= 0;local <= 1;
			end
			else if(local == 1) begin
				LCD_RS <= 0;LCD_W <= 0; data <= 4'b0010;
				local <= 2;
			end
			else if(local == 2) begin
				LCD_E <= 1; local <= 3;
			end
			else if(local == 3) begin
				LCD_E <= 0;local <= 4;
			end
			else if(local == 4) begin
				LCD_RS <= 0;LCD_W <= 0; data <= 4'b1000;
				local <= 5;
			end
			else if(local == 5) begin
				LCD_E <= 1; local <= 0; state <= 3;
			end
		end
	end
	
	else if(state == 3) begin
		if(cnt == 1000000) begin
			cnt <= 0;
			if(local == 0) begin
				LCD_E <= 0;local <= 1;
			end
			else if(local == 1) begin
				LCD_RS <= 0;LCD_W <= 0; data <= 4'b0000;
				local <= 2;
			end
			else if(local == 2) begin
				LCD_E <= 1; local <= 3;
			end
			else if(local == 3) begin
				LCD_E <= 0;local <= 4;
			end
			else if(local == 4) begin
				LCD_RS <= 0;LCD_W <= 0; data <= 4'b0110;
				local <= 5;
			end
			else if(local == 5) begin
				LCD_E <= 1; local <= 0; state <= 4;
			end
		end
	end
	
	else if(state == 4) begin
		if(cnt == 1000000) begin
			cnt <= 0;
			if(local == 0) begin
				LCD_E <= 0;local <= 1;
			end
			else if(local == 1) begin
				LCD_RS <= 0;LCD_W <= 0; data <= 4'b0000;
				local <= 2;
			end
			else if(local == 2) begin
				LCD_E <= 1; local <= 3;
			end
			else if(local == 3) begin
				LCD_E <= 0;local <= 4;
			end
			else if(local == 4) begin
				LCD_RS <= 0;LCD_W <= 0; data <= 4'b1100;
				local <= 5;
			end
			else if(local == 5) begin
				LCD_E <= 1; local <= 0; state <= 5;
			end
		end
	end
	
	else if(state == 5) begin
		if(cnt == 1000000) begin
			cnt <= 0;
			if(local == 0) begin
				LCD_E <= 0;local <= 1;
			end
			else if(local == 1) begin
				LCD_RS <= 0;LCD_W <= 0; data <= 4'b0000;
				local <= 2;
			end
			else if(local == 2) begin
				LCD_E <= 1; local <= 3;
			end
			else if(local == 3) begin
				LCD_E <= 0;local <= 4;
			end
			else if(local == 4) begin
				LCD_RS <= 0;LCD_W <= 0; data <= 4'b0001;
				local <= 5;
			end
			else if(local == 5) begin
				LCD_E <= 1; local <= 0; state <= 6;
			end
		end
	end
	
	else if(state == 6) begin
		if(cnt == 1000000) begin
			cnt <= 0;
			if(local == 0) begin
				LCD_E <= 0;local <= 1;
			end
			else if(local == 1) begin
				LCD_RS <= 0;LCD_W <= 0; data <= 4'b1000;
				local <= 2;
			end
			else if(local == 2) begin
				LCD_E <= 1; local <= 3;
			end
			else if(local == 3) begin
				LCD_E <= 0;local <= 4;
			end
			else if(local == 4) begin
				LCD_RS <= 0;LCD_W <= 0; data <= 4'b0000;
				local <= 5;
			end
			else if(local == 5) begin
				LCD_E <= 1; local <= 0; state <= 7;
			end
		end
	end
	
	else if(state == 7) begin
		if(cnt == 1000000) begin
			cnt <= 0;
			if(count != 16) begin
				if(local == 0) begin
					LCD_E <= 0;local <= 1;
				end
				else if(local == 1) begin
					LCD_RS <= 1;LCD_W <= 0; data <= first[pos-:4];
					local <= 2;
				end
				else if(local == 2) begin
						LCD_E <= 1; local <= 3;pos <= pos - 4;
					end
				else if(local == 3) begin
					LCD_E <= 0;local <= 4;
				end
				else if(local == 4) begin
					LCD_RS <= 1;LCD_W <= 0; data <= first[pos-:4];
					local <= 5;
				end
				else if(local == 5) begin
					LCD_E <= 1; local <= 0; pos <= pos - 4;count <= count + 1;
				end
			end
			else begin
				pos <= 127;state <= 8; count <= 0;
			end

		end
	end
	
	else if(state == 8) begin
		if(cnt == 1000000) begin
			cnt <= 0;
			if(local == 0) begin
				LCD_E <= 0;local <= 1;
			end
			else if(local == 1) begin
				LCD_RS <= 0;LCD_W <= 0; data <= 4'b1100;
				local <= 2;
			end
			else if(local == 2) begin
				LCD_E <= 1; local <= 3;
			end
			else if(local == 3) begin
				LCD_E <= 0;local <= 4;
			end
			else if(local == 4) begin
				LCD_RS <= 0;LCD_W <= 0; data <= 4'b0000;
				local <= 5;
			end
			else if(local == 5) begin
				LCD_E <= 1; local <= 0; state <= 9;
			end
		end
	end
	
	else if(state == 9) begin
		if(cnt == 1000000) begin
			cnt <= 0;
			if(count != 16) begin
				if(local == 0) begin
					LCD_E <= 0;local <= 1;
				end
				else if(local == 1) begin
					LCD_RS <= 1;LCD_W <= 0; data <= second[pos1-:4];
					local <= 2;
				end
				else if(local == 2) begin
						LCD_E <= 1; local <= 3;pos1 <= pos1 - 4;
					end
				else if(local == 3) begin
					LCD_E <= 0;local <= 4;
				end
				else if(local == 4) begin
					LCD_RS <= 1;LCD_W <= 0; data <= second[pos1-:4];
					local <= 5;
				end
				else if(local == 5) begin
					LCD_E <= 1; local <= 0; pos1 <= pos1 - 4;count <= count + 1;
				end
			end
			else begin
				state <= 10; LCD_E <= 0;
			end
		end
	end
	
end

endmodule
