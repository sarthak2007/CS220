`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:54:16 01/21/2019
// Design Name:   seven_bit_adder
// Module Name:   /media/paramvir/786F-1E38/CS220Labs/Lab2_2/seven_bit_adder/top_module.v
// Project Name:  seven_bit_adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: seven_bit_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module top_module;

	// Inputs
	reg pb1;
	reg pb2;
	reg pb3;
	reg pb4;
	reg [3:0] y;

	// Outputs
	wire [6:0] sum;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	seven_bit_adder uut (
		.pb1(pb1), 
		.pb2(pb2), 
		.pb3(pb3), 
		.pb4(pb4), 
		.y(y), 
		.sum(sum), 
		.cout(cout)
	);
	
	always @(sum or cout) begin
	$display("time= %d %b%b%b%b%b%b%b%b",$time,cout,sum[6],sum[5],sum[4],sum[3],sum[2],sum[1],sum[0]);
	end
	
	initial begin
		// Initialize Inputs
		y=4'b0000;pb1=0;pb2=0;pb3=0;pb4=0;
		#5
		y=4'b0001;pb1=1;pb2=1;pb3=1;pb4=1;
		#5
		
	$finish;
		// Wait 100 ns for global reset to finish
		
        
		// Add stimulus here

	end
      
endmodule

