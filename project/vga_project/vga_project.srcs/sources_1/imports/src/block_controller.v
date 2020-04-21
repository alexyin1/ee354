/* Problems:
- 2's complement 10'b1111111011 AKA -5 doesn't work
- Score increments by 2's
- Timer doesn't correctly wait for 10 secs
- SSD doesn't show the Qp3, Qp2, Qp1, Qi states on SSD4, but SSD5 shows Done state correctly
*/

`timescale 1ns / 1ps

module block_controller
#(parameter N_dc = 28)
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
	output reg ten_secs
   );
	reg [1:0] direction;
	reg [27:0]	DIV_CLK;
	reg [4:0] state;
	
	always @ (posedge clk, posedge rst)  
	begin : CLOCK_DIVIDER
      if (rst)
			DIV_CLK <= 0;
	  else
			DIV_CLK <= DIV_CLK + 1'b1;
	end

	wire move_clk;
	assign move_clk=DIV_CLK[19];
	wire bird_fill;
	wire block_fill;
	integer i;

	reg [N_dc-1:0] timer_count;
	reg [3:0] check_ten_secs;
	
	//these two values dictate the center of the block, incrementing and decrementing them at a rate leads the block to move in certain directions
	reg [9:0] bird_x, bird_y;
	reg [9:0] block_x, block_y;
	reg [9:0] sub_x, sub_y;

	// wire feedback;
	// assign feedback = block_x

	reg direction_chosen, passed_ten_secs;
	
	localparam 
	RED  = 12'b1111_0000_0000,
	GREEN = 12'b0000_1111_0000,
	BLUE  = 12'b0000_0000_1111;

	localparam
	INITIAL = 5'b00001,
	PHASE1  = 5'b00010,
	PHASE2  = 5'b00100,
	PHASE3  = 5'b01000,
	DONE    = 5'b10000;

	assign {Done, Qp3, Qp2, Qp1, Qi} = state;
	
	/*when outputting the rgb value in an always block like this, make sure to include the if(~bright) statement, as this ensures the monitor 
	will output some data to every pixel and not just the images you are trying to display*/
	always@ (*) begin
    	if(bird_fill )
			rgb = RED;
		else if (block_fill)
			rgb = BLUE;
		else if (~bright)
			rgb = 12'b0000_0000_0000;
		else	
			rgb=12'b1111_1111_1111;
	end
		//the +-5 for the positions give the dimension of the block (i.e. it will be 10x10 pixels)
	assign bird_fill=vCount>=(bird_y-5) && vCount<=(bird_y+5) && hCount>=(bird_x-5) && hCount<=(bird_x+5);
	assign block_fill = vCount>=(block_y-5) && vCount<=(block_y+5) && hCount>=(block_x-5) && hCount<=(block_x+5);

	always@(posedge move_clk, posedge rst) 
	begin
		if(rst)
		begin 
			state <= INITIAL;
			bird_x <= 10'bXXXXXXXXXX;
			bird_y <= 10'bXXXXXXXXXX;
			block_x <= 10'bXXXXXXXXXX;
			block_y <= 10'bXXXXXXXXXX;
			sub_x <= 10'bXXXXXXXXXX;
			sub_y <= 10'bXXXXXXXXXX;
			score_ones <= 4'bXXXX;
			score_tens <= 4'bXXXX;
			score_hundreds <= 4'bXXXX;
			direction_chosen <= 1'bX;
			passed_ten_secs <= 1'bX;
		end
		else 
		begin
			(* full_case, parallel_case *)
			case (state)
				INITIAL: 
				begin
					if (Start) // Start is left button
						state <= PHASE1;

					//rough values for center of screen
					bird_x<=200;
					bird_y<=250;

					block_x <= 700;
					block_y <= 250;

					// This only works for testbench I think... then how can we produce random positions for the blocks to be in?
					// block_x <= $urandom_range(700, 600);
					// block_y <= $urandom_range(505, 30);

					sub_x <= -1;
					sub_y <= -6;
					score_ones <= 0;
					score_tens <= 0;
					score_hundreds <= 0;
					direction_chosen <= 1'b0;
					passed_ten_secs <= 1'b0;
				end

				PHASE1:
				begin
					/* Note that the top left of the screen does NOT correlate to vCount=0 and hCount=0. This is due to the way that the scanning
					works in display_controller. There is a little bit of time right after the pulse (the front porch) and right before the next
					pulse (called the back porch) that the scanning doesn't output to the display. So effectively, the top left corner corresponds 
					to (hcount,vcount)~(144,35). Which means with a 640x480 resolution, the bottom right corner corresponds to ~(783,515).  
					*/

					// For the block, we want to choose a random position between
					// 30 and 505 vertically
					// 810 and 1010 horizontally

					// passed_ten_secs <= 1'b0;
					direction_chosen <= 1'b0;

					// if (ten_secs == 1'b1)
					// begin
					// 	passed_ten_secs <= 1'b1;
					// 	state <= PHASE2;
					// end

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

					block_x <= block_x - 1;
					if (block_x <= 150) 
					begin
						block_x <= 800;
					end

					sub_x <= block_x - bird_x;
					sub_y <= block_y - bird_y;

					if (sub_x >= 0 && sub_x <= 10 && sub_y >= 0 && sub_y <= 10)
					begin
						bird_x <= 200;
						bird_y <= 250;
						block_x <= 700;
						block_y <= 250;

						score_ones <= score_ones + 1;
						if (score_ones == 9)
						begin
							score_ones <= 0;
							score_tens <= score_tens + 1;
						end
						if (score_tens == 9)
						begin
							score_ones <= 0;
							score_tens <= 0;
							score_hundreds <= score_hundreds + 1;
						end
					end

				end

				PHASE2:
				// Blocks move faster. This is reached after 10 seconds.
				begin
					passed_ten_secs <= 1'b0;
					direction_chosen <= 1'b0;
					
					if (ten_secs == 1'b1)
					begin
						passed_ten_secs <= 1'b1;
						state <= PHASE3;
					end

					if(direction == 2'b10) 
					begin // up
						bird_y<=bird_y-10;
						if(bird_y<=34)
							bird_y<=514;
						direction_chosen <= 1'b1;
					end
					else if(direction == 2'b11) 
					begin // down
						bird_y<=bird_y+10;
						if(bird_y>=514)
							bird_y<=34;
						direction_chosen <= 1'b1;
					end

					block_x <= block_x - 3;
					if (block_x <= 150) 
					begin
						block_x <= 800;
					end

					sub_x <= block_x - bird_x;
					sub_y <= block_y - bird_y;
					// 2's complement 10'b1111111011 AKA -5 doesn't work
					// Score increments by 2's
					if (sub_x >= 0 && sub_x <= 10 && sub_y >= 0 && sub_y <= 10)
					begin
						bird_x <= 200;
						bird_y <= 250;
						block_x <= 700;
						block_y <= 250;

						score_ones <= score_ones + 1;
						if (score_ones == 9)
						begin
							score_ones <= 0;
							score_tens <= score_tens + 1;
						end
						if (score_tens == 9)
						begin
							score_ones <= 0;
							score_tens <= 0;
							score_hundreds <= score_hundreds + 1;
						end
					end

				end

				PHASE3:
				// Blocks move faster. This is reached after 20 seconds.
				begin
					passed_ten_secs <= 1'b0;
					direction_chosen <= 1'b0;

					if (ten_secs == 1'b1)
					begin
						passed_ten_secs <= 1'b1;
						state <= DONE;
					end

					if(direction == 2'b10) 
					begin // up
						bird_y<=bird_y-10;
						if(bird_y<=34)
							bird_y<=514;
						direction_chosen <= 1'b1;
					end
					else if(direction == 2'b11) 
					begin // down
						bird_y<=bird_y+10;
						if(bird_y>=514)
							bird_y<=34;
						direction_chosen <= 1'b1;
					end

					block_x <= block_x - 5;
					if (block_x <= 150) 
					begin
						block_x <= 800;
					end

					sub_x <= block_x - bird_x;
					sub_y <= block_y - bird_y;
					if (sub_x >= 0 && sub_x <= 10 && sub_y >= 0 && sub_y <= 10)
					begin
						bird_x <= 200;
						bird_y <= 250;
						block_x <= 700;
						block_y <= 250;

						score_ones <= score_ones + 1;
						if (score_ones == 9)
						begin
							score_ones <= 0;
							score_tens <= score_tens + 1;
						end
						if (score_tens == 9)
						begin
							score_ones <= 0;
							score_tens <= 0;
							score_hundreds <= score_hundreds + 1;
						end
					end
				end

				DONE:
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
			direction<=2'b00;
			ten_secs <= 1'b0;
		end
		else 
		begin
			if(up)
				direction<=2'b10;
			else if(down)
				direction<=2'b11;

			if (direction_chosen)
				direction<=2'b00;
			
			timer_count <= timer_count + 1;

			if (timer_count[N_dc-1])
			begin
				check_ten_secs <= check_ten_secs + 1;
				if (check_ten_secs == 9)
				begin
					check_ten_secs <= 0;
					timer_count <= 0;
					ten_secs <= 1'b1;
				end 
			end

			if (passed_ten_secs)
				ten_secs <= 1'b0;
		end
	end
	
	
endmodule