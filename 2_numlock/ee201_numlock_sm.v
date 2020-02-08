//////////////////////////////////////////////////////////////////////////////////
// Author:			Brandon Franzke, Gandhi Puvvada, Bilal Zafar
// Create Date:   	02/13/2008, 
// Description: 

//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module ee201_numlock_sm(Clk, reset, U, Z, q_Bad, q_Opening, q_G1011, q_G1011get, q_G101, q_G101get, q_G10, q_G10get, q_G1, q_G1get, q_I, Unlock);

	/*  INPUTS */
	// Clock & Reset
	input	Clk, reset;
	input 	U, Z;
	wire Timerout;	
	
	/*  OUTPUTS */
	// store current state
	output q_Bad, q_Opening, q_G1011, q_G1011get, q_G101, q_G101get, q_G10, q_G10get, q_G1, q_G1get, q_I, Unlock;

	reg [10:0] state;
	reg [3:0] Timerout_count;

	assign {q_Bad, q_Opening, q_G1011, q_G1011get, q_G101, q_G101get, q_G10, q_G10get, q_G1, q_G1get, q_I} = state;
		
	// lets make accessing the state information easier within the state machine code
	// each line aliases the approriate state bits and sets up a 1-hot code
	localparam
		QBad		=	11'b10000000000,  
		QOpening	=	11'b01000000000,
		QG1011  	=	11'b00100000000,
		QG1011get 	=	11'b00010000000,
		QG101 		=	11'b00001000000,
		QG101get 	=	11'b00000100000,
		QG10 		=	11'b00000010000,
		QG10get 	=	11'b00000001000,
		QG1 		=	11'b00000000100,
		QG1get 		=	11'b00000000010,
		QI  		=	11'b00000000001,
		UNK		=	11'bXXXXXXXXXXX;
		
	// NSL AND SM
	always @ (posedge Clk, posedge reset)
	begin
		if(reset)
			state <= QI;
		else 
		begin
			case(state)
				QI:
					if(U & ~Z)
						state <= QG1get;
				QG1get:
					if(~U)
						state <= QG1;
				QG1:
					if(~U & Z)
						state <= QG10get;
					else if(U)
						state <= QBad;
				QG10get:
					if(~Z)
						state <= QG10;
				QG10:
					if(U & ~Z)
						state <= QG101get;
					else if(Z)
						state <= QBad;
				QG101get:
					if(~U)
						state <= QG101;					
				QG101:
					if(U & ~Z)
						state <= QG1011get;
					else if(Z)
						state <= QBad;
				QG1011get:
					if(~U)
						state <= QG1011;
				QG1011:
					state <= QOpening;
				QOpening:
					if(Timerout)				
						state <= QI;
				QBad:
					if(~U & ~Z)
						state <= QI;

			default:	state <= UNK;
			endcase
		end
	end
	
// timerout combination logic
	assign Timerout = (Timerout_count[3]) & (Timerout_count[2]) & (Timerout_count[1]) & (Timerout_count[0]);

		always @ (posedge Clk, posedge reset)
		begin : TIMEROUT_COUNT 
			if(reset)
				Timerout_count <= 0;
			else
				if(state == QOpening)
					Timerout_count <= Timerout_count + 1;
				else
					Timerout_count <= 0;
		end


	assign Unlock = q_Opening;
//timerout end	
endmodule