`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:32:23 01/21/2019 
// Design Name: 
// Module Name:    onebit 
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
module onebit(a,b,l,g,e,l1,g1,e1
    );
input a,b,l,g,e;
output l1,g1,e1;
reg l1,g1,e1;

if(l==1) begin
	 l1 <= #2 1'b1;
	g1 <= 1'b0;
	e1 <= 1'b0;
end
if(g==1) begin
 assign l1=1'b0;
 assign g1=1'b1;
 assign e1=1'b0;
end

if(e==1) begin

	if(a==1 & b==0)begin
		assign g1=1'b1;assign l1=1'b0;assign e1=1'b0;
		end
	else if(a==0 & b==1) begin
		assign g1=1'b0;assign l1=1'b1;assign e1=1'b0;
		end
	else begin
		assign g1=1'b0;assign l1=1'b0;assign e1=1'b1;
		end
		
end


endmodule
