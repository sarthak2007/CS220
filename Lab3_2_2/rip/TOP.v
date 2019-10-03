`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:53:30 01/28/2019
// Design Name:   ripple
// Module Name:   /media/ssinghal/480A-D8B5/CS220Labs/Lab3_2_2/rip/TOP.v
// Project Name:  rip
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

module TOP;

	// Inputs
	reg clk;

	// Outputs
	wire led0;
	wire led1;
	wire led2;
	wire led3;
	wire led4;
	wire led5;
	wire led6;
	wire led7;

	// Instantiate the Unit Under Test (UUT)
	ripple uut (
		.led0(led0), 
		.led1(led1), 
		.led2(led2), 
		.led3(led3), 
		.led4(led4), 
		.led5(led5), 
		.led6(led6), 
		.led7(led7), 
		.clk(clk)
	);

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

