`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:29:37 01/28/2019
// Design Name:   ripple
// Module Name:   /media/ssinghal/480A-D8B5/CS220Labs/Lab3_2/ripple/top1.v
// Project Name:  ripple
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ripple
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module top1;

	// Inputs
	reg led;
	reg clk;

	// Instantiate the Unit Under Test (UUT)
	ripple uut (
		.led(led), 
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		led = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

