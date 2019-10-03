`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:35:37 01/28/2019
// Design Name:   final
// Module Name:   /media/ssinghal/480A-D8B5/CS220Labs/Lab3_3/third/test.v
// Project Name:  third
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: final
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test;

	// Inputs
	reg pb1;
	reg pb2;
	reg pb3;
	reg pb4;
	reg pb5;
	reg [3:0] y;

	// Outputs
	wire [5:0] sum;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	final uut (
		.pb1(pb1), 
		.pb2(pb2), 
		.pb3(pb3), 
		.pb4(pb4), 
		.pb5(pb5), 
		.y(y), 
		.sum(sum), 
		.cout(cout)
	);
	always @(sum or cout)
		$display("time= %d : %b  %b",$time,sum[0],cout);
	
	initial begin
		// Initialize Inputs
		pb1 = 0;	pb2 = 0;	pb3 = 0;	pb4 = 0;	pb5 = 0;	y = 4'b0000;
		#5
		pb1 = 1;	pb2 = 1;	pb3 = 1;	pb4 = 1;	pb5 = 1;	y = 4'b1111;
		#5
		pb1 = 0;	pb2 = 0;	pb3 = 0;	pb4 = 0;	pb5 = 0;	y = 4'b0000;
		#5
		pb1 = 1;	pb2 = 0;	pb3 = 0;	pb4 = 0;	pb5 = 0;	y = 4'b1000;
		#5
		pb1 = 1;	pb2 = 1;	pb3 = 0;	pb4 = 0;	pb5 = 0;	y = 4'b1111;
		#5
		pb1 = 1;	pb2 = 1;	pb3 = 1;	pb4 = 0;	pb5 = 0;	y = 4'b1001;
		#5
		pb1 = 1;	pb2 = 1;	pb3 = 1;	pb4 = 1;	pb5 = 0;	y = 4'b1101;
		#5
		pb1 = 1;	pb2 = 1;	pb3 = 1;	pb4 = 1;	pb5 = 1;	y = 4'b1110;
		#5
		// Wait 100 ns for global reset to finish
		#100;
       $finish;
		// Add stimulus here

	end
      
endmodule

