`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:48:56 01/28/2019
// Design Name:   led
// Module Name:   /media/ssinghal/480A-D8B5/CS220Labs/Lab3_1/blinker/test.v
// Project Name:  blinker
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: led
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
	reg clk;

	// Outputs
	wire led0;

	// Instantiate the Unit Under Test (UUT)
	led uut (
		.clk(clk), 
		.led0(led0)
	);
	always @(led0)
	$display("time= %d  %b",$time,led0);
	
	initial begin
		// Initialize Inputs
		forever begin
		clk = 0;
		#1
		clk = 1;
		#1
		clk = 0;
		end
		

		// Wait 100 ns for global reset to finish
		
        
		// Add stimulus here

	end
	
	initial
	begin
	#1215752192;
	$finish;
	end
      
endmodule

