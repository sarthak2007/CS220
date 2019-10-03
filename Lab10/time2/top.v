`timescale 1ns / 1ps
`define MAX_PC 14
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:55:13 04/01/2019 
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
module top(clk,led
    );
input clk;
output [7:0] led;
reg [7:0] led;
reg [7:0] pc;
reg [5:0] opcode;
reg [4:0] rs;
reg [4:0] rt;
reg [4:0] rd;
reg [5:0] func;

reg [25:0] jump;
reg [15:0] immediate;
reg [7:0] source1;
reg [7:0] source2;
reg [7:0] add;
reg [7:0] store;
reg [6:0] state;
reg invalid;

reg [31:0] inst[0:13];
reg [7:0] data[0:10];
reg [7:0] regis[0:31] ;

reg [31:0] temp;

initial begin
	pc <= 8'd12;
	invalid <= 0;
	state <= 7'd0;
	inst[0] <= {6'h9,5'd0,5'd2,16'd0};
	inst[1] <= {6'h9,5'd0,5'd3,16'd0};
	inst[2] <= {6'h0,5'd3,5'd1,5'd4,5'd0,6'h2a};
	inst[3] <= {6'h4,5'd4,5'd0,16'd8};
	inst[4] <= {6'h9,5'd0,5'd5,16'd10};
	inst[5] <= {6'h4,5'd3,5'd5,16'd6};
	inst[6] <= {6'h23,5'd3,5'd6,16'd0};
	inst[7] <= {6'h0,5'd2,5'd6,5'd2,5'd0,6'h21};
	inst[8] <= {6'h9,5'd3,5'd3,16'd1};
	inst[9] <= {6'h0,5'd3,5'd1,5'd4,5'd0,6'h2a};
	inst[10] <= {6'h5,5'd4,5'd0,16'b1111111111111011};
	inst[11] <= {6'h0,5'd31,5'd0,5'd0,5'd0,6'h8};
	inst[12] <= {6'h23,5'd0,5'd1,16'd10};
	inst[13] <= {6'h3,26'd0};
	
	data[0] <= 8'd70;
	data[1] <= -8'd20;
	data[2] <= 8'd88;
	data[3] <= 8'd22;
	data[4] <= -8'd103;
	data[5] <= -8'd102;
	data[6] <= 8'd104;
	data[7] <= -8'd73;
	data[8] <= 8'd40;
	data[9] <= -8'd32;
	data[10] <= 8'd11;
	
	regis[0] <= 8'd0;regis[1] <= 8'd0;regis[2] <= 8'd0;regis[3] <= 8'd0;regis[4] <= 8'd0;regis[5] <= 8'd0;regis[6] <= 8'd0;regis[7] <= 8'd0;
	regis[8] <= 8'd0;regis[9] <= 8'd0;regis[10] <= 8'd0;regis[11] <= 8'd0;regis[12] <= 8'd0;regis[13] <= 8'd0;regis[14] <= 8'd0;regis[15] <= 8'd0;
	regis[16] <= 8'd0;regis[17] <= 8'd0;regis[18] <= 8'd0;regis[19] <= 8'd0;regis[20] <= 8'd0;regis[21] <= 8'd0;regis[22] <= 8'd0;regis[23] <= 8'd0;
	regis[24] <= 8'd0;regis[25] <= 8'd0;regis[26] <= 8'd0;regis[27] <= 8'd0;regis[28] <= 8'd0;regis[29] <= 8'd0;regis[30] <= 8'd0;regis[31] <= 8'd0;
	
end

always @(posedge clk) begin
	

	
	if(state==0) begin
		temp <= inst[pc];
		state <= state+1;
	end
	
	else if(state==1) begin
		if(temp[31:26] == 0) begin
			opcode <= 0; rs <= temp[25:21]; rt <= temp[20:16]; rd <= temp[15:11]; func <= temp[5:0];
		end
		else if(temp[31:26] == 2 || temp[31:26]==3) begin
			opcode <= temp[31:26]; jump <= temp[25:0];
		end
		else begin
			opcode <= temp[31:26]; rs <= temp[25:21]; rt <= temp[20:16]; immediate <= temp[15:0];
		end
		state <= state+1;
	end
	
	else if(state==2) begin
		if(opcode==0) begin
			source1 <= regis[rs]; source2 <= regis[rt];
		end
		else if(opcode!=2 && opcode!=3) begin
			source1 <= regis[rs]; source2 <= regis[rt];
		end
		state<=state+1;
	end
	
	else if(state==3) begin
		if(opcode==0) begin
			if(func==6'h21) begin
				store <= source1 + source2;
				pc <= pc+1;
			end
			else if(func==6'h2a) begin
				if($signed(source1) < $signed(source2))
					store <= 1;
				else
					store <= 0;	
				pc <= pc+1;
			end
			else if(func==6'h8) begin
				pc <= regis[rs];
			end
		end
		else if(opcode==2 || opcode==3) begin
			regis[31] <= pc+1;
			pc <= jump[7:0];		
		end
		else if(opcode==9) begin
			store <= source1+immediate[7:0];
			pc <= pc+1;
		end
		else if(opcode==4) begin
			if(source1==source2) pc<=pc+immediate[7:0];
			else pc<=pc+1;
		end
		else if(opcode==5) begin
			if(regis[rs]!=regis[rt]) pc<=pc+immediate[7:0];
			else pc<=pc+1;
		end
		else if(opcode==6'h23) begin
			add<=source1+immediate[7:0];
			
			pc <= pc+1;
		end
		else invalid<=1;
		state<=state+1;
	end
	
	else if(state==4) begin
		if(opcode==6'h23) begin
			store <= data[add];
		end
		state <= state+1;
	end
	
	else if(state==5) begin
			
		if(invalid==0) begin
			if(opcode==0 && rd!=0) begin
				if(func==6'h21 || func==6'h2a) begin
					regis[rd] <= store;
				end
			end
			else if(opcode==9 && rt!=0) begin
				regis[rt] <= store;
			end
			else if(opcode==6'h23 && rt!=0) begin
				regis[rt]<=store;
			end
		end	
		
		if(pc < 14) begin
			state<=0;
		end 
		else begin
			state <= state+1;
		end
		
	end
	
	else if(state==6) begin
		led<= regis[2];
	end
	
end



endmodule
