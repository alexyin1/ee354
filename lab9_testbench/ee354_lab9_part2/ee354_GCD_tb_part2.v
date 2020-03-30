//////////////////////////////////////////////////////////////////////////////////
// Author:			Shideh Shahidi, Bilal Zafar, Gandhi Puvvada
// Create Date:   02/25/08, 10/13/08
// File Name:		ee354_GCD_tb.v 
// Description: 
//
//
// Revision: 		2.1
// Additional Comments:  
// 10/13/2008 Clock Enable (CEN) has been added by Gandhi
// 3/1/2010 Signal names are changed in line with the divider_verilog design
//  02/20/2020 Nexys-3 to Nexys-4 conversion done by Yue (Julien) Niu
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module ee354_GCD_tb_v_part2;

	// Inputs
	reg Clk, CEN;
	reg Reset;
	reg Start;
	reg Ack;
	reg [7:0] Ain;
	reg [7:0] Bin;

	// Outputs
	wire [7:0] A, B, AB_GCD, i_count;
	wire q_I;
	wire q_Sub;
	wire q_Mult;
	wire q_Done;
	reg [6*8:0] state_string; // 6-character string for symbolic display of state
	integer clk_cnt, start_clock_cnt,clocks_taken, a_loop, b_loop;
	// Instantiate the Unit Under Test (UUT)
	ee354_GCD uut (
		.Clk(Clk), 
		.CEN(CEN),
		.Reset(Reset), 
		.Start(Start), 
		.Ack(Ack), 
		.Ain(Ain), 
		.Bin(Bin), 
		.A(A),
		.B(B),
		.AB_GCD(AB_GCD), 
		.i_count(i_count),
		.q_I(q_I), 
		.q_Sub(q_Sub), 
		.q_Mult(q_Mult), 
		.q_Done(q_Done)
	);
		
	task APPLY_STIMULUS;
		input[7:0] Ain_value;
		input[7:0] Bin_value;
		begin
			Ain = Ain_value;
			Bin = Bin_value;
			@(posedge Clk);
			#1;
			Start = 1;
			@(posedge Clk);
			#1;
			Start = 0;
			start_clock_cnt = clk_cnt;
			
			wait(q_Done);
			#1;
			Ack = 1;
			clocks_taken = clk_cnt - start_clock_cnt;
			@(posedge Clk);
			#1;
			Ack = 0;

			$display("Ain: %d Bin: %d GCD: %d", Ain, Bin, AB_GCD);
			$display("It took %d clock(s) to compute the GCD \n", clocks_taken);
		end
	endtask
		
	always  begin #5; Clk = ~ Clk; end
	always @(posedge Clk) clk_cnt = clk_cnt + 1;
	
	initial begin
		// Initialize Inputs
		clk_cnt=0;	
		Clk = 0;
		CEN = 1; // ****** in Part 2 ******
				 // Here, in Part 1, we are enabling clock permanently by making CEN a '1' constantly.
				 // In Part 2, your TOP design provides single-stepping through SCEN control.
				 // We are not planning to write a testbench for the part 2 design. However, if we were 
				 // to write one, we will remove this line, and make CEN enabled and disabled to test 
				 // single stepping.
				 // One of the things you make sure in your core design (DUT) is that when state 
				 // transitions are stopped by making CEN = 0,
				 // the data transformations are also stopped.
		Reset = 0;
		Start = 0;
		Ack = 0;
		Ain = 0;
		Bin = 0;
		start_clock_cnt = 0;

		//generate Reset, Start, Ack, Ain, Bin signals according to the waveform on page 14/19
		//add start_clock_cnt and clocks_taken code in the correct areas
		//add $display statements per 6.10 on page 13/19
		@(posedge Clk);
		@(posedge Clk);
		#1;
		Reset = 1;
		
		@(posedge Clk);
		#1;
		Reset = 0;

		for (a_loop = 2; a_loop <= 63; a_loop = a_loop + 1)
			for (b_loop = 2; b_loop <= 63; b_loop = b_loop + 1)
				begin
					APPLY_STIMULUS(a_loop, b_loop);
				end

	end
	
	always @(*)
		begin
			case ({q_I, q_Sub, q_Mult, q_Done})    // Note the concatenation operator {}
				4'b1000: state_string = "q_I   ";  // ****** TODO ******
				4'b0100: state_string = "q_Sub ";  // Fill-in the three lines
				4'b0010: state_string = "q_Mult";
				4'b0001: state_string = "q_Done";			
			endcase
		end
 
      
endmodule

