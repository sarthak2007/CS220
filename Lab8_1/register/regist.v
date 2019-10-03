`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:10:05 03/11/2019 
// Design Name: 
// Module Name:    register 
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
module regist(z,clk,y,rot_event,first,second,cnt,inst
    );
input clk,rot_event;
input [3:0] y;
input z;
output [127:0] first;
output [127:0] second;
output [10:0] cnt;
output [2:0] inst;
reg [2:0] inst;
reg [4:0] write_add;
reg [4:0] read_add1;
reg [4:0] read_add2;
reg [15:0] write_data;
reg prev=0;
reg [10:0] cnt=0;
reg [15:0] regist [0:31];
reg [127:0] first;
reg [127:0] second;
reg [15:0] a;
reg [15:0] b;
reg [15:0] c;
reg [3:0] shift;



always @(posedge clk) begin
	if(z==1)
		cnt<=0;

	if(prev==0 & rot_event==1) begin
		if(cnt==0)
			cnt<=1;
		if(cnt==1) begin
			inst<=y[2:0];
			cnt<=cnt+1;
		end
		if(inst==0) begin
			if(cnt==2) begin
				write_add[3:0] <= y;
				cnt<=cnt+1;
			end
			else if(cnt==3) begin
				write_add[4]<= y[0];
				cnt<=cnt+1;
			end
			else if(cnt==4) begin
				write_data[3:0]<= y;
				cnt<=cnt+1;
			end
			else if(cnt==5) begin
				write_data[7:4]<= y;
				cnt<=cnt+1;
			end
			else if(cnt==6) begin
				write_data[11:8]<= y;
				cnt<=cnt+1;
			end
			else if(cnt==7) begin
				write_data[15:12]<= y;
				cnt<=cnt+1;
			end
			else if(cnt==8) begin
				regist[write_add]<= write_data;
				first[127:120] <= write_add[4]+48;
				first[119:112] <= write_add[3]+48;
				first[111:104] <= write_add[2]+48;
				first[103:96] <= write_add[1]+48;
				first[95:88] <= write_add[0]+48;
				first[87:0] <= "           ";
				second[127:120] <= write_data[15]+48;
				second[119:112] <= write_data[14]+48;
				second[111:104] <= write_data[13]+48;
				second[103:96] <= write_data[12]+48;
				second[95:88] <= write_data[11]+48;
				second[87:80] <= write_data[10]+48;
				second[79:72] <= write_data[9]+48;
				second[71:64] <= write_data[8]+48;
				second[63:56] <= write_data[7]+48;
				second[55:48] <= write_data[6]+48;
				second[47:40] <= write_data[5]+48;
				second[39:32] <= write_data[4]+48;
				second[31:24] <= write_data[3]+48;
				second[23:16] <= write_data[2]+48;
				second[15:8] <= write_data[1]+48;
				second[7:0] <= write_data[0]+48;
				cnt <= cnt+1;
			end
			else if(cnt==9) begin
				cnt <=0;
			end	
		end
		
		
		else if(inst==1) begin
			if(cnt==2) begin
				read_add1[3:0] <= y;
				cnt<=cnt+1;
			end
			else if(cnt==3) begin
				read_add1[4]<= y[0];
				cnt<=cnt+1;
			end
			else if(cnt==4) begin
				a<=regist[read_add1];
				cnt<=cnt+1;
			end
			else if(cnt==5) begin
				first[127:120] <= read_add1[4]+48;
				first[119:112] <= read_add1[3]+48;
				first[111:104] <= read_add1[2]+48;
				first[103:96] <= read_add1[1]+48;
				first[95:88] <= read_add1[0]+48;
				first[87:0] <= "           ";
				second[127:120] <= a[15]+48;
				second[119:112] <= a[14]+48;
				second[111:104] <= a[13]+48;
				second[103:96] <= a[12]+48;
				second[95:88] <= a[11]+48;
				second[87:80] <= a[10]+48;
				second[79:72] <= a[9]+48;
				second[71:64] <= a[8]+48;
				second[63:56] <= a[7]+48;
				second[55:48] <= a[6]+48;
				second[47:40] <= a[5]+48;
				second[39:32] <= a[4]+48;
				second[31:24] <= a[3]+48;
				second[23:16] <= a[2]+48;
				second[15:8] <= a[1]+48;
				second[7:0] <= a[0]+48;
				cnt <= cnt+1;
			end
			else if(cnt==6) begin
				cnt <= 0;
			end
		end
		

		else if(inst==2) begin
			if(cnt==2) begin
				read_add1[3:0] <= y;
				cnt<=cnt+1;
			end
			else if(cnt==3) begin
				read_add1[4]<= y[0];
				cnt<=cnt+1;
			end
			else if(cnt==4) begin
				read_add2[3:0] <= y;
				cnt<=cnt+1;
			end
			else if(cnt==5) begin
				read_add2[4]<= y[0];
				cnt<=cnt+1;
			end
			else if(cnt==6) begin
				a<=regist[read_add1];
				b<=regist[read_add2];
				cnt<=cnt+1;
			end
			else if(cnt==7) begin
				first[127:120] <= a[15]+48;
				first[119:112] <= a[14]+48;
				first[111:104] <= a[13]+48;
				first[103:96] <= a[12]+48;
				first[95:88] <= a[11]+48;
				first[87:80] <= a[10]+48;
				first[79:72] <= a[9]+48;
				first[71:64] <= a[8]+48;
				first[63:56] <= a[7]+48;
				first[55:48] <= a[6]+48;
				first[47:40] <= a[5]+48;
				first[39:32] <= a[4]+48;
				first[31:24] <= a[3]+48;
				first[23:16] <= a[2]+48;
				first[15:8] <= a[1]+48;
				first[7:0] <= a[0]+48;
				second[127:120] <= b[15]+48;
				second[119:112] <= b[14]+48;
				second[111:104] <= b[13]+48;
				second[103:96] <= b[12]+48;
				second[95:88] <= b[11]+48;
				second[87:80] <= b[10]+48;
				second[79:72] <= b[9]+48;
				second[71:64] <= b[8]+48;
				second[63:56] <= b[7]+48;
				second[55:48] <= b[6]+48;
				second[47:40] <= b[5]+48;
				second[39:32] <= b[4]+48;
				second[31:24] <= b[3]+48;
				second[23:16] <= b[2]+48;
				second[15:8] <= b[1]+48;
				second[7:0] <= b[0]+48;
				cnt <= cnt+1;
			end
			else if(cnt==8) begin
				cnt <= 0;
			end
		end
		

		else if(inst==3) begin
			if(cnt==2) begin
				read_add1[3:0] <= y;
				cnt<=cnt+1;
			end
			else if(cnt==3) begin
				read_add1[4]<= y[0];
				cnt<=cnt+1;
			end
			else if(cnt==4) begin
				write_add[3:0] <= y;
				cnt<=cnt+1;
			end
			else if(cnt==5) begin
				write_add[4]<= y[0];
				a<=regist[read_add1];
				cnt<=cnt+1;
			end
			else if(cnt==6) begin
				write_data[3:0]<= y;
				cnt<=cnt+1;
			end
			else if(cnt==7) begin
				write_data[7:4]<= y;
				cnt<=cnt+1;
			end
			else if(cnt==8) begin
				write_data[11:8]<= y;
				cnt<=cnt+1;
			end
			else if(cnt==9) begin
				write_data[15:12]<= y;
				cnt<=cnt+1;
			end
			else if(cnt==10) begin
				regist[write_add]<= write_data;
				first[127:120] <= read_add1[4]+48;
				first[119:112] <= read_add1[3]+48;
				first[111:104] <= read_add1[2]+48;
				first[103:96] <= read_add1[1]+48;
				first[95:88] <= read_add1[0]+48;
				first[87:0] <= "           ";
				second[127:120] <= a[15]+48;
				second[119:112] <= a[14]+48;
				second[111:104] <= a[13]+48;
				second[103:96] <= a[12]+48;
				second[95:88] <= a[11]+48;
				second[87:80] <= a[10]+48;
				second[79:72] <= a[9]+48;
				second[71:64] <= a[8]+48;
				second[63:56] <= a[7]+48;
				second[55:48] <= a[6]+48;
				second[47:40] <= a[5]+48;
				second[39:32] <= a[4]+48;
				second[31:24] <= a[3]+48;
				second[23:16] <= a[2]+48;
				second[15:8] <= a[1]+48;
				second[7:0] <= a[0]+48;
				cnt <= cnt+1;
			end
			else if(cnt==11) begin
				cnt <= 0;
			end
		end

		else if(inst==4) begin
			if(cnt==2) begin
				read_add1[3:0] <= y;
				cnt<=cnt+1;
			end
			else if(cnt==3) begin
				read_add1[4]<= y[0];
				cnt<=cnt+1;
			end
			else if(cnt==4) begin
				read_add2[3:0] <= y;
				cnt<=cnt+1;
			end
			else if(cnt==5) begin
				read_add2[4]<= y[0];
				cnt<=cnt+1;
			end
			else if(cnt==6) begin
				write_add[3:0] <= y;
				cnt<=cnt+1;
			end
			else if(cnt==7) begin
				write_add[4]<= y[0];
				a<=regist[read_add1];
				b<=regist[read_add2];
				cnt<=cnt+1;
			end
			else if(cnt==8) begin
				write_data[3:0]<= y;
				cnt<=cnt+1;
			end
			else if(cnt==9) begin
				write_data[7:4]<= y;
				cnt<=cnt+1;
			end
			else if(cnt==10) begin
				write_data[11:8]<= y;
				cnt<=cnt+1;
			end
			else if(cnt==11) begin
				write_data[15:12]<= y;
				cnt<=cnt+1;
			end
			else if(cnt==12) begin
				regist[write_add]<= write_data;
				first[127:120] <= a[15]+48;
				first[119:112] <= a[14]+48;
				first[111:104] <= a[13]+48;
				first[103:96] <= a[12]+48;
				first[95:88] <= a[11]+48;
				first[87:80] <= a[10]+48;
				first[79:72] <= a[9]+48;
				first[71:64] <= a[8]+48;
				first[63:56] <= a[7]+48;
				first[55:48] <= a[6]+48;
				first[47:40] <= a[5]+48;
				first[39:32] <= a[4]+48;
				first[31:24] <= a[3]+48;
				first[23:16] <= a[2]+48;
				first[15:8] <= a[1]+48;
				first[7:0] <= a[0]+48;
				second[127:120] <= b[15]+48;
				second[119:112] <= b[14]+48;
				second[111:104] <= b[13]+48;
				second[103:96] <= b[12]+48;
				second[95:88] <= b[11]+48;
				second[87:80] <= b[10]+48;
				second[79:72] <= b[9]+48;
				second[71:64] <= b[8]+48;
				second[63:56] <= b[7]+48;
				second[55:48] <= b[6]+48;
				second[47:40] <= b[5]+48;
				second[39:32] <= b[4]+48;
				second[31:24] <= b[3]+48;
				second[23:16] <= b[2]+48;
				second[15:8] <= b[1]+48;
				second[7:0] <= b[0]+48;
				cnt <= cnt+1;
			end
			else if(cnt==13) begin
				cnt <= 0;
			end
		end


		else if(inst==5) begin
			if(cnt==2) begin
				read_add1[3:0] <= y;
				cnt<=cnt+1;
			end
			else if(cnt==3) begin
				read_add1[4]<= y[0];
				cnt<=cnt+1;
			end
			else if(cnt==4) begin
				read_add2[3:0] <= y;
				cnt<=cnt+1;
			end
			else if(cnt==5) begin
				read_add2[4]<= y[0];
				cnt<=cnt+1;
			end
			else if(cnt==6) begin
				write_add[3:0] <= y;
				a<=regist[read_add1];
				b<=regist[read_add2];
				cnt<=cnt+1;
			end
			else if(cnt==7) begin
				write_add[4]<= y[0];
				c<= a+b;
				cnt<=cnt+1;
			end
			else if(cnt==8) begin
				regist[write_add]<= c;
				first[127:120] <= write_add[4]+48;
				first[119:112] <= write_add[3]+48;
				first[111:104] <= write_add[2]+48;
				first[103:96] <= write_add[1]+48;
				first[95:88] <= write_add[0]+48;
				first[87:0] <= "           ";
				second[127:120] <= c[15]+48;
				second[119:112] <= c[14]+48;
				second[111:104] <= c[13]+48;
				second[103:96] <= c[12]+48;
				second[95:88] <= c[11]+48;
				second[87:80] <= c[10]+48;
				second[79:72] <= c[9]+48;
				second[71:64] <= c[8]+48;
				second[63:56] <= c[7]+48;
				second[55:48] <= c[6]+48;
				second[47:40] <= c[5]+48;
				second[39:32] <= c[4]+48;
				second[31:24] <= c[3]+48;
				second[23:16] <= c[2]+48;
				second[15:8] <= c[1]+48;
				second[7:0] <= c[0]+48;
				cnt <= cnt+1;
			end
			else if(cnt==9) begin
				cnt <= 0;
			end
		end


		else if(inst==6) begin
			if(cnt==2) begin
				read_add1[3:0] <= y;
				cnt<=cnt+1;
			end
			else if(cnt==3) begin
				read_add1[4]<= y[0];
				cnt<=cnt+1;
			end
			else if(cnt==4) begin
				read_add2[3:0] <= y;
				cnt<=cnt+1;
			end
			else if(cnt==5) begin
				read_add2[4]<= y[0];
				cnt<=cnt+1;
			end
			else if(cnt==6) begin
				write_add[3:0] <= y;
				a<=regist[read_add1];
				b<=regist[read_add2];
				cnt<=cnt+1;
			end
			else if(cnt==7) begin
				write_add[4]<= y[0];
				c<= a-b;
				cnt<=cnt+1;
			end
			else if(cnt==8) begin
				regist[write_add]<= c;
				first[127:120] <= write_add[4]+48;
				first[119:112] <= write_add[3]+48;
				first[111:104] <= write_add[2]+48;
				first[103:96] <= write_add[1]+48;
				first[95:88] <= write_add[0]+48;
				first[87:0] <= "           ";
				second[127:120] <= c[15]+48;
				second[119:112] <= c[14]+48;
				second[111:104] <= c[13]+48;
				second[103:96] <= c[12]+48;
				second[95:88] <= c[11]+48;
				second[87:80] <= c[10]+48;
				second[79:72] <= c[9]+48;
				second[71:64] <= c[8]+48;
				second[63:56] <= c[7]+48;
				second[55:48] <= c[6]+48;
				second[47:40] <= c[5]+48;
				second[39:32] <= c[4]+48;
				second[31:24] <= c[3]+48;
				second[23:16] <= c[2]+48;
				second[15:8] <= c[1]+48;
				second[7:0] <= c[0]+48;
				cnt <= cnt+1;
			end
			else if(cnt==9) begin
				cnt <= 0;
			end
		end		


		else if(inst==7) begin
			if(cnt==2) begin
				read_add1[3:0] <= y;
				cnt<=cnt+1;
			end
			else if(cnt==3) begin
				read_add1[4]<= y[0];
				cnt<=cnt+1;
			end
			else if(cnt==4) begin
				shift<=y;
				cnt<=cnt+1;
			end
			else if(cnt==5) begin
				write_add[3:0] <= y;
				a<=regist[read_add1];
				cnt<=cnt+1;
			end
			else if(cnt==6) begin
				write_add[4]<= y[0];
				c<= (a << shift);
				cnt<=cnt+1;
			end
			else if(cnt==7) begin
				regist[write_add]<= c;
				first[127:120] <= write_add[4]+48;
				first[119:112] <= write_add[3]+48;
				first[111:104] <= write_add[2]+48;
				first[103:96] <= write_add[1]+48;
				first[95:88] <= write_add[0]+48;
				first[87:0] <= "           ";
				second[127:120] <= c[15]+48;
				second[119:112] <= c[14]+48;
				second[111:104] <= c[13]+48;
				second[103:96] <= c[12]+48;
				second[95:88] <= c[11]+48;
				second[87:80] <= c[10]+48;
				second[79:72] <= c[9]+48;
				second[71:64] <= c[8]+48;
				second[63:56] <= c[7]+48;
				second[55:48] <= c[6]+48;
				second[47:40] <= c[5]+48;
				second[39:32] <= c[4]+48;
				second[31:24] <= c[3]+48;
				second[23:16] <= c[2]+48;
				second[15:8] <= c[1]+48;
				second[7:0] <= c[0]+48;
				cnt <= cnt+1;
			end
			else if(cnt==8) begin
				cnt <= 0;
			end
		end


	end
	prev <= rot_event;
end



endmodule