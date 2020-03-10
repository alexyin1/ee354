`timescale 1ns / 1ps  



////////////////////////////////////////
// Decoder_simplified_by_Trojans.v    //
// Gandhi Puvvada 2/24/2019           //
// Ported to Nexys4 3/8/2020          //
////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Company: Digilent Inc 2011
// Engineer: Michelle Yu  
//				 Josh Sackos
// Create Date:    07/23/2012 
//
// Module Name:    Decoder
// Project Name:   PmodKYPD_Demo
// Target Devices: Nexys3
// Tool versions:  Xilinx ISE 14.1 
// Description: This file defines a component Decoder for the demo project PmodKYPD. The Decoder scans
//					 each column by asserting a low to the pin corresponding to the column at 1KHz. After a
//					 column is asserted low, each row pin is checked. When a row pin is detected to be low,
//					 the key that was pressed could be determined.
//
// Revision History: 
// 						Revision 0.01 - File Created (Michelle Yu)
//							Revision 0.02 - Converted from VHDL to Verilog (Josh Sackos)
//////////////////////////////////////////////////////////////////////////////////////////////////////////

// ==============================================================================================
// 												Define Module
// ==============================================================================================
module Decoder(
    clk,
    Row,
    Col,
    DecodeOut
    );

// ==============================================================================================
// 											Port Declarations
// ==============================================================================================
    input clk;						// 100MHz onboard clock
    input [3:0] Row;				// Rows on KYPD
    output [3:0] Col;				// Columns on KYPD
    output [3:0] DecodeOut;			// Output data

// ==============================================================================================
// 							  		Parameters, Regsiters, and Wires
// ==============================================================================================
	
	// Output wires and registers
	reg [3:0] Col;
	reg [3:0] DecodeOut;
	
	// Count register
	reg [19:0] sclk;
// ==============================================================================================
// 												USC Trojan Implementation
// ==============================================================================================

	always @(posedge clk) begin  
	
			// unconditional incrementation of sclk
			sclk <= sclk + 1'b1;
			
			// On every tick of sclk[15], sclk[18:16] increments
			// one clock-period of sclk[15] is (2**16)*10ns =  655360ns = 0.65ms
			// For every two counts of sclk[18:16] (for every 1.3ms) the column excitation is changed.
			// In the middle of each of these pairs, the rows are checked.
			
			// Comparison with the Digilent design:
			// Digilent Design:
				// Digilent design changed column excitation at 1ms, 2ms, 3ms, and 4ms points
				// They checked rows 80ns after the column excitation
				// i.e. at 1ms+80ns, 2ms+80ns, 3ms+80ns, and 4ms+80ns points
				// At the end of the clock corresponding to the 4ms+80ns point, 
				// they reset the sclk so that the cycle starts over.
			// Trojans' Design
				// Trojans observed that 1ms interval is just a random choice and 
				// and waiting for 80ns is also a random choice. True that the pulled-up 
				// row lines take some time to completely get pulled-up by the weak 
				// pull-up resistances and 80ns is a good timing choice. 80ns waiting is a 
				// lower-bound but we can wait longer for the convenience of simplifying the logic.
				//
				// So, Trojans used sclk[18:16] to space these 4+4=8 events evenly simplifying the design.
				// Instead of 1ms between column excitation changes, Trojans have 1.3ms.
				// Instead of 80ns wait after a column is excited, Trojans have a 0.65ms wait.
				// Instead of long nested-if statement, Trojans coded nested parallel case statements.
				// The logic needed for Trojan decoder is expected to be far smaller than the Digilent Decoder.
				// 
			// Note: We should not use (* full_case *) for the inner four case statements  
			//       as 4'b1111 case should not cause some random assignment to to the DecodeOut!	
			(* full_case, parallel_case *)	
			case (sclk[18:16])  
			//================	
			3'b000:
				//C1
				Col <= 4'b0111;
			3'b001: 
			// check row pins 
			    (* parallel_case *)
				case (Row)
				//R
				4'b0111: DecodeOut <= 4'b0001;		//1
				//R2
				4'b1011: DecodeOut <= 4'b0100; 		//4
				//R
				4'b1101: DecodeOut <= 4'b0111; 		//7
				//R
				4'b1110: DecodeOut <= 4'b0000; 		//0
				endcase
			//================	
			3'b010:
				//C2
				Col <= 4'b1011;
			3'b011: 
			// check row pins
			    (* parallel_case *)
				case (Row)
				//R1
				4'b0111: DecodeOut <= 4'b0010; 		//2
				//R2
				4'b1011: DecodeOut <= 4'b0101; 		//5
				//R3
				4'b1101: DecodeOut <= 4'b1000; 		//8
				//R4
				4'b1110: DecodeOut <= 4'b1111; 		//F
				endcase
			//================	
			3'b100:
				//C3
				Col <= 4'b1101;
			3'b101: 
			// check row pins
			    (* parallel_case *)
				case (Row)
				//R1
				4'b0111: DecodeOut <= 4'b0011;		//3
				//R2
				4'b1011: DecodeOut <= 4'b0110; 		//6
				//R3
				4'b1101: DecodeOut <= 4'b1001; 		//9
				//R4
				4'b1110: DecodeOut <= 4'b1110; 		//E
				endcase
			//================	
			3'b110:
				//C4
				Col <= 4'b1110;
			3'b111: 
			// check row pins
				(* parallel_case *)
				case (Row)
				//R1
				4'b0111: DecodeOut <= 4'b1010;		//A
				//R2
				4'b1011: DecodeOut <= 4'b1011; 		//B
				//R3
				4'b1101: DecodeOut <= 4'b1100; 		//C
				//R4
				4'b1110: DecodeOut <= 4'b1101; 		//D
				endcase
			//================
		endcase // for the outer main case
		//================	
  end			
	

endmodule
