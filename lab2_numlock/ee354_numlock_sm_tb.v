`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: ee354L Teaching Team
//
// Create Date:   22:26:25 02/06/2012
// Design Name:   ee354_numlock_sm
// Module Name:   C:/Xilinx_projects/ee354l_number_lock/ee354l_number_lock_verilog_SOLN/ee354_numlock_sm_tb
// Project Name:  ee354l_number_lock_verilog_SOLN
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ee354_numlock_sm
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ee354_numlock_sm_tb;

	// Inputs
	reg Clk;
	reg reset;
	reg U;
	reg Z;

	// Outputs
	wire q_I;
	wire q_G1get;
	wire q_G1;
	wire q_G10get;
	wire q_G10;
	wire q_G101get;
	wire q_G101;
	wire q_G1011get;
	wire q_G1011;
	wire q_Opening;
	wire q_Bad;
	wire Unlock;

	// Instantiate the Unit Under Test (UUT)
	ee354_numlock_sm uut (
		.Clk(Clk), 
		.reset(reset), 
		.q_I(q_I), 
		.q_G1get(q_G1get), 
		.q_G1(q_G1), 
		.q_G10get(q_G10get), 
		.q_G10(q_G10), 
		.q_G101get(q_G101get), 
		.q_G101(q_G101), 
		.q_G1011get(q_G1011get), 
		.q_G1011(q_G1011), 
		.q_Opening(q_Opening), 
		.q_Bad(q_Bad), 
		.U(U), 
		.Z(Z), 
		.Unlock(Unlock)
	);

	initial begin
		// Initialize Inputs

		Clk = 0;
		reset = 0;
		U = 0;
		Z = 0;

		// Wait 100 ns for global reset to finish
		#100;
		reset = 1;
		#10;		
		reset = 0;
		#10;
		
		U = 1; Z = 0;
		#100;
		U = 0; Z = 0;
		#50;
		
		U = 0; Z = 1;
		#100;
		U = 0; Z = 0;
		#50;
		
		U = 1; Z = 0;
		#100;
		U = 0; Z = 0;
		#50;
		
		U = 0; Z = 1;
		#100;
		U = 0; Z = 0;
		#50;
		
		// Add stimulus here
		
		U = 1; Z = 0;
		#100;
		U = 0; Z = 0;
		#50;
		
		U = 0; Z = 1;
		#100;
		U = 0; Z = 0;
		#50;
		
		U = 1; Z = 0;
		#100;
		U = 0; Z = 0;
		#50;
		
		U = 1; Z = 0;
		#100;
		U = 0; Z = 0;
		#50;
		
		// Add stimulus here
		
	end
	
	always  begin #10; Clk = ~ Clk; end
	
// test cases from the testbench from the schematic-based number lock folder 
//test case 1
//initial begin u = 0; #520; u = 1;  #500; u = 0; #1000; u = 1; #500; u = 0; #500; u = 1; #500; u = 0; end
//initial begin z = 0; #1200; z = 1; #500; z = 0; end

//test case 2
//initial begin u = 0; #520; u = 1;  #500; u = 0; #1000; u = 1; #500; u = 0; end
//initial begin z = 0; end

//test case 3
//initial begin u = 0; #520; u = 1;  #500; u = 0; #1000; u = 1; #500; u = 0; end
//initial begin z = 0; #1200; z = 1; #570; z = 0; #1250; z = 1; #500; z = 0;  end



      
endmodule

