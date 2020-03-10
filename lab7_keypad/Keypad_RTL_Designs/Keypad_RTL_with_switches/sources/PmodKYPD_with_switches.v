`timescale 1ns / 1ps

// ==============================================================================================
// 												Define Module
// ==============================================================================================
module PmodKYPD_with_switches(
    ClkPort,
	sw,
    JA,
    an,
    seg
    );
	 
	 
// ==============================================================================================
// 											Port Declarations
// ==============================================================================================
	input ClkPort;					// 100Mhz onboard clock
	input [3:0]sw;				// Switches on FPGA board
	inout [7:0] JA;			// Port JA on Nexys3, JA[3:0] is Columns, JA[10:7] is rows
	output [7:0] an;			// Anodes on seven segment display
	output [6:0] seg;			// Cathodes on seven segment display

// ==============================================================================================
// 							  		Parameters, Regsiters, and Wires
// ==============================================================================================
	
	// Output wires
	wire [7:0] an;
	wire [6:0] seg;
	wire [3:0] Decode;

// ==============================================================================================
// 												Implementation
// ==============================================================================================

	// Turn off the upper four SSDs
	assign an[7:4] = 4'b1111;

	//-----------------------------------------------
	//  						Decoder
	//-----------------------------------------------
	Decoder C0(
			.clk(ClkPort),
			.Row(JA[7:4]),
			.Col(JA[3:0]),
			.DecodeOut(Decode)
	);

	//-----------------------------------------------
	//  		Seven Segment Display Controller
	//-----------------------------------------------
	DisplayController C1(
			.DispVal(Decode),
			.switch(sw),
			.anode(an[3:0]),
			.segOut(seg)
	);

endmodule
