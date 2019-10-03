`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:04:32 01/21/2019
// Design Name:   two_bit_adder
// Module Name:   /media/paramvir/786F-1E38/CS220Labs/Lab2_1/two-bit_adder/top_module_two_bit.v
// Project Name:  two-bit_adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: two_bit_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module top_module_two_bit;

	// Inputs
	reg [1:0] x;
	reg [1:0] y;

	// Outputs
	wire [1:0] z;
	wire carry;

	// Instantiate the Unit Under Test (UUT)
	two_bit_adder uut (
		.x(x), 
		.y(y), 
		.z(z), 
		.carry(carry)
	);
   always@(z or carry or x or y) begin
	 $display("time=%d: %b%b + %b%b = %b%b%b\n",$time,x[1],x[0],y[1],y[0],
				 carry,z[1],z[0]);
		end
	initial begin
	  x[0]=0;x[1]=0;y[0]=0;y[1]=0;
	  #5
	  x[0]=1;x[1]=0;y[0]=0;y[1]=1;
	  #5
	  
	  $finish;

	end
      
endmodule

