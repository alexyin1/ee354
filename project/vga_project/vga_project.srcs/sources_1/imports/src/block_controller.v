/* 
TODO:
Problems:
- SSD doesn't show the Qp3, Qp2, Qp1, Qi states on SSD4, but SSD5 shows Done state correctly
- LEDs don't work?

Tasks:
- Whenever you miss a block and it collides with the left screen, choose a random vertical position to start at for the next time
it comes through
- Whenever you collide with a block, choose a random vertical position to start at for the next time it comes through 
- Add functionality such that if you hold down the up or down buttons, you continuously move up/down the screen (This probably
involves some functionality with CCEN from ee354_debounce_DPB_SCEN_CCEN_MCEN_r1.v).

Code cleanup:
- Is there a way to make the routines in PHASE1, PHASE2, PHASE3 into a task/function that you can provide parameters to?
The functionalities for each are basically the same, except the block movements are just different.
- Is there a better way to communicate between the move_clk and the full clock cycle rather than just using flags?
*/

`timescale 1ns / 1ps

module block_controller
  (
	input clk,
	input bright,
	input rst,
	input up, input down, input Start, input Ack,
	input [9:0] hCount, vCount,
	output reg [11:0] rgb,
	output reg [3:0] score_ones,
	output reg [3:0] score_tens,
	output reg [3:0] score_hundreds,
	output Qi, Qp1, Qp2, Qp3, Done,
	output reg ten_secs_elapsed
   );
	reg [1:0] direction;
	reg [27:0]	DIV_CLK;
	reg [4:0] state;
	reg [1:0] full_clk_state;
	reg [3:0] random;
	integer i, k;
	
	always @ (posedge clk, posedge rst)  
	begin : CLOCK_DIVIDER
      if (rst)
			DIV_CLK <= 0;
	  else
			DIV_CLK <= DIV_CLK + 1'b1;
	end

	wire move_clk;
	assign move_clk=DIV_CLK[19];

	reg [27:0] clk_count;
	reg [3:0] sec_count;
	
	reg [9:0] bird_x, bird_y;
	reg [9:0] block_x[5:0], block_y[5:0];
	reg [9:0] bad_x[5:0], bad_y[5:0];
	reg [9:0] block_sub_x[5:0], block_sub_y[5:0];
	reg [9:0] bad_sub_x[5:0], bad_sub_y[5:0];

	wire block_fill[6:0];
	wire bad_fill[6:0];

	wire feedback;
	assign feedback = random[0] ^ random[3];

	reg direction_chosen, state_ten_sec_elapsed;
	
	localparam 
	RED   = 12'b1111_0000_0000,
	GREEN = 12'b0000_1111_0000,
	BLUE  = 12'b0000_0000_1111,
	PINK1 = 12'b1111_1100_1111,
	PINK2 = 12'b1111_1010_1111,
	BLACK = 12'b0000_0000_0000,
	WHITE = 12'b1111_1111_1111;

	localparam
	INITIAL = 5'b00001,
	PHASE1  = 5'b00010,
	PHASE2  = 5'b00100,
	PHASE3  = 5'b01000,
	DONE    = 5'b10000;

	localparam
	FULL_CLK_INIT = 2'b00,
	OPERATIONS    = 2'b01,
	FULL_CLK_DONE = 2'b10;

	assign {Done, Qp3, Qp2, Qp1, Qi} = state;
	
	/*when outputting the rgb value in an always block like this, make sure to include the if(~bright) statement, as this ensures the monitor 
	will output some data to every pixel and not just the images you are trying to display*/
	always@ (*) 
	begin
		if(bird_fill)
			rgb = BLUE;
		else if (block_fill[0])
			rgb = GREEN;
		else if (bad_fill[0])
			rgb = RED;
		else if (block_fill[1])
			rgb = GREEN;
		else if (bad_fill[1])
			rgb = RED;
		else if (block_fill[2])
			rgb = GREEN;
		else if (bad_fill[2])
			rgb = RED;
		else if (block_fill[3])
			rgb = GREEN;
		else if (bad_fill[3])
			rgb = RED;
		else if (block_fill[4])
			rgb = GREEN;
		else if (bad_fill[4])
			rgb = RED;
		else if (block_fill[5])
			rgb = GREEN;
		else if (bad_fill[5])
			rgb = RED;
		else if (~bright)
			rgb = BLACK;
		else if (state == PHASE2)
			rgb = PINK1;
		else if (state == PHASE3)
			rgb = PINK2;
		else
			rgb = WHITE;
	end
	
	//the +-5 for the positions give the dimension of the block (i.e. it will be 10x10 pixels)

	genvar j;
	generate
		for (j = 0; j < 6; j = j + 1)
		begin
			assign block_fill[j] = vCount>=(block_y[j]-5) && vCount<=(block_y[j]+5) && hCount>=(block_x[j]-5) && hCount<=(block_x[j]+5);
			assign bad_fill[j] = vCount>=(bad_y[j]-5) && vCount<=(bad_y[j]+5) && hCount>=(bad_x[j]-5) && hCount<=(bad_x[j]+5);
		end
	endgenerate

	assign bird_fill=vCount>=(bird_y-5) && vCount<=(bird_y+5) && hCount>=(bird_x-5) && hCount<=(bird_x+5);

	always@(posedge move_clk, posedge rst) 
	begin
		if(rst)
		begin 
			state <= INITIAL;
			bird_x <= 10'bXXXXXXXXXX;
			bird_y <= 10'bXXXXXXXXXX;
			score_ones <= 4'bXXXX;
			score_tens <= 4'bXXXX;
			score_hundreds <= 4'bXXXX;
			direction_chosen <= 1'bX;
			state_ten_sec_elapsed <= 1'bX;
			for (i = 0; i < 6; i = i + 1)
			begin
				block_x[i] <= 10'bXXXXXXXXXX;
				block_y[i] <= 10'bXXXXXXXXXX;
				bad_x[i] <= 10'bXXXXXXXXXX;
				bad_y[i] <= 10'bXXXXXXXXXX;
				block_sub_x[i] <= 10'bXXXXXXXXXX;
				block_sub_y[i] <= 10'bXXXXXXXXXX;
			end
		end
		else 
		begin
			(* full_case, parallel_case *)
			case (state)
				INITIAL: 
				begin
					if (Start) // Start is left button
					begin
						state <= PHASE1;
					end

					bird_x<=200;
					bird_y<=250;

					score_ones <= 0;
					score_tens <= 0;
					score_hundreds <= 0;

					direction_chosen <= 1'b0;
					state_ten_sec_elapsed <= 1'b0;

					for (i = 0; i < 6; i = i + 1)
					begin
						block_x[i] <= 820 + 20 * i; // TODO: CHANGE TO MAKE THIS VARIABLE
						block_y[i] <= 50 + 66 * i;
						bad_x[i] <= 820 + 20 * i; // TODO: CHANGE TO MAKE THIS VARIABLE
						bad_y[i] <= 100 + 66 * i;
						block_sub_x[i] <= 11;
						block_sub_y[i] <= 11;
						bad_sub_x[i] <= 11;
						bad_sub_y[i] <= 11;
					end
				end

				PHASE1:
				// Initial phase. Blocks are slowest here.
				begin
					/* Note that the top left of the screen does NOT correlate to vCount=0 and hCount=0. This is due to the way that the scanning
					works in display_controller. There is a little bit of time right after the pulse (the front porch) and right before the next
					pulse (called the back porch) that the scanning doesn't output to the display. So effectively, the top left corner corresponds 
					to (hcount,vcount)~(144,35). Which means with a 640x480 resolution, the bottom right corner corresponds to ~(783,515).  
					*/
					PHASE_MOVEMENT(1, PHASE2);
				end

				PHASE2:
				// Blocks move faster. This is reached after ~13 seconds.
				begin
					PHASE_MOVEMENT(2, PHASE3);
				end

				PHASE3:
				// Blocks move faster. This is reached after ~26 seconds.
				begin
					PHASE_MOVEMENT(3, DONE);
				end

				DONE:
				// Reached after ~39 seconds
				begin
					if (Ack) // Ack is right button
						state <= INITIAL;
				end
			endcase
		end
	end
	
	//msb of direction acts as a sort of enable, lower bits dictate direction
	always@(posedge clk,posedge rst) begin
		if(rst)
		begin
			full_clk_state <= FULL_CLK_INIT;
			direction<=2'bXX;
			ten_secs_elapsed <= 1'bX;
			clk_count <= 28'bXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
			sec_count <= 4'bXXXX;
			random <= 4'bXXXX;
		end
		else 
		begin
			(* full_case, parallel_case *)
			case (full_clk_state)
				FULL_CLK_INIT:
				begin
					if (Start)
						full_clk_state <= OPERATIONS;

					direction<=2'b00;
					ten_secs_elapsed <= 1'b0;
					clk_count <= 0;
					sec_count <= 0;
					random <= 6;
				end

				OPERATIONS:
				begin
					if (state == DONE)
						full_clk_state <= FULL_CLK_DONE;

					if(up)
						direction<=2'b10;
					else if(down)
						direction<=2'b11;

					if (direction_chosen)
						direction<=2'b00;
					
					random <= {random[2:0], feedback};

					clk_count <= clk_count + 1;

					if (clk_count[27])
					begin
						sec_count <= sec_count + 1;
						clk_count <= 0;
						if (sec_count == 9)
						begin
							sec_count <= 0;
							ten_secs_elapsed <= 1'b1;
						end 
					end

					if (state_ten_sec_elapsed)
						ten_secs_elapsed <= 1'b0;
				end

				FULL_CLK_DONE:
				begin
					if (Ack)
						full_clk_state <= FULL_CLK_INIT;
				end
			endcase	
		end
	end

	// Common task for each phase
	task PHASE_MOVEMENT;
		input [3:0] block_movement;
		input [4:0] transition_state;
		begin
			state_ten_sec_elapsed <= 1'b0;
			direction_chosen <= 1'b0;

			if (ten_secs_elapsed == 1'b1)
			begin
				state_ten_sec_elapsed <= 1'b1;
				state <= transition_state;
			end

			if(direction == 2'b10)
			begin // up
				bird_y<=bird_y-10;
				if(bird_y<=34)
					bird_y<=514;
				direction_chosen <= 1'b1; // Tell the full clk that we moved up and to reset direction back to zero.
			end
			else if(direction == 2'b11)
			begin // down
				bird_y<=bird_y+10;
				if(bird_y>=514)
					bird_y<=34;
				direction_chosen <= 1'b1; // Tell the full clk that we moved down and reset direction back to zero.
			end

			for (i = 0; i < 6; i = i + 1)
			begin
				BLOCK_POS_CHECK(i, block_movement);
				BAD_POS_CHECK(i, block_movement);
			end

		end
	endtask
	
		// Task for checking positions and boundaries for blocks
	task BLOCK_POS_CHECK;
		input [2:0] index;
		input [3:0] block_movement;
		begin
			block_x[index] <= block_x[index] - block_movement;
			if (block_x[index] <= 150) 
			begin
				block_x[index] <= 820 + 11 * random; // Position is 820 to be right outside the screen!
				block_y[index] <= 50 + 25 * random;
			end
			
			block_sub_x[index] <= block_x[index] - bird_x;
			block_sub_y[index] <= block_y[index] - bird_y;
			
			if ((block_sub_x[index] >= 0 && block_sub_x[index] <= 10 && block_sub_y[index] >= 0 && block_sub_y[index] <= 10) 
				|| (block_sub_x[index] >= 0 && block_sub_x[index] <= 10 && block_sub_y[index] >= 1014 && block_sub_y[index] <= 1023) 
				|| (block_sub_x[index] >= 1015 && block_sub_x[index] <= 1023 && block_sub_y[index] >= 0 && block_sub_y[index] <= 10) 
				|| (block_sub_x[index] >= 1015 && block_sub_x[index] <= 1023 && block_sub_y[index] >= 1014 && block_sub_y[index] <= 1023))
			begin
				block_x[index] <= 820 + 11 * random;
				block_y[index] <= 50 + 25 * random;

				block_sub_x[index] <= 11;
				block_sub_y[index] <= 11;

				score_ones <= score_ones + 1;
				if (score_ones == 9)
				begin
					score_ones <= 0;
					score_tens <= score_tens + 1;
					if (score_tens == 9)
					begin
						score_ones <= 0;
						score_tens <= 0;
						score_hundreds <= score_hundreds + 1;
						if (score_hundreds == 9)
						begin
							score_ones <= 9;
							score_tens <= 9;
							score_hundreds <= 9;
						end
					end
				end
			end
		end
	endtask

	// Task for checking positions and boundaries for bad blocks
	task BAD_POS_CHECK;
		input [2:0] index;
        input [3:0] block_movement;
		begin
			bad_x[index] <= bad_x[index] - block_movement;
			if (bad_x[index] <= 150) 
			begin
				bad_x[index] <= 820 + 11 * random; // NORMAL IS 820 to be right outside the screen!
				bad_y[index] <= 25 + 25 * random;
			end
			
			bad_sub_x[index] <= bad_x[index] - bird_x;
			bad_sub_y[index] <= bad_y[index] - bird_y;
			
			if ((bad_sub_x[index] >= 0 && bad_sub_x[index] <= 10 && bad_sub_y[index] >= 0 && bad_sub_y[index] <= 10) 
				|| (bad_sub_x[index] >= 0 && bad_sub_x[index] <= 10 && bad_sub_y[index] >= 1014 && bad_sub_y[index] <= 1023) 
				|| (bad_sub_x[index] >= 1015 && bad_sub_x[index] <= 1023 && bad_sub_y[index] >= 0 && bad_sub_y[index] <= 10) 
				|| (bad_sub_x[index] >= 1015 && bad_sub_x[index] <= 1023 && bad_sub_y[index] >= 1014 && bad_sub_y[index] <= 1023))
			begin
				bad_x[index] <= 820 + 11 * random; // NORM IS 820!
				bad_y[index] <= 25 + 25 * random;

				bad_sub_x[index] <= 11;
				bad_sub_y[index] <= 11;

				if (!(score_ones == 0 && score_tens == 0 && score_hundreds == 0)) // Don't want to go into negative scores 
				begin
					score_ones <= score_ones - 1;
					if (score_ones == 0)
					begin
						score_ones <= 9;
						if (score_tens > 0)
							score_tens <= score_tens - 1;
						else if (score_tens == 0)
						begin
							if (score_hundreds > 0)
							begin
								score_tens <= 9;
								score_hundreds <= score_hundreds - 1;
							end
						end
					end
				end
			end
		end
	endtask

endmodule
