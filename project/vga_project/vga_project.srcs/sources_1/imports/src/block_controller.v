`timescale 1ns / 1ps

module block_controller(
	input clk,
	input bright,
	input rst,
	input up, input down, input Start, input Ack,
	input [9:0] hCount, vCount,
	output reg [11:0] rgb,
	output reg [3:0] score_ones,
	output Qi, Qp1, Qp2, Qp3, Done
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
	
	//these two values dictate the center of the block, incrementing and decrementing them at a rate leads the block to move in certain directions
	reg [9:0] bird_x, bird_y;
	reg [9:0] block_x, block_y;
	reg [9:0] sub_x, sub_y;
	
	parameter RED   = 12'b1111_0000_0000;
	parameter GREEN = 12'b0000_1111_0000;
	parameter BLUE  = 12'b0000_0000_1111;

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
			//rough values for center of screen
			state <= INITIAL;
			bird_x <= 10'bXXXXXXXXXX;
			bird_y <= 10'bXXXXXXXXXX;
			block_x <= 10'bXXXXXXXXXX;
			block_y <= 10'bXXXXXXXXXX;
			sub_x <= 10'bXXXXXXXXXX;
			sub_y <= 10'bXXXXXXXXXX;
			score_ones <= 4'bXXXX;
		end
		else 
		begin
			(* full_case, parallel_case *)
			case (state)
				INITIAL: 
				begin
					if (Start) // Start is left button
						state <= PHASE1;

					bird_x<=200;
					bird_y<=250;
					block_x <= 700;
					block_y <= 250;
					sub_x <= 6;
					sub_y <= 6;
				end

				PHASE1:
				begin
					/* Note that the top left of the screen does NOT correlate to vCount=0 and hCount=0. This is due to the way that the scanning
					works in display_controller. There is a little bit of time right after the pulse (the front porch) and right before the next
					pulse (called the back porch) that the scanning doesn't output to the display. So effectively, the top left corner corresponds 
					to (hcount,vcount)~(144,35). Which means with a 640x480 resolution, the bottom right corner corresponds to ~(783,515).  
					*/
					// if(direction==3'b100)
					// begin // right
					// 	bird_x<=bird_x+2; //change the amount you increment to make the speed faster 
					// 	if(bird_x==800) //these are rough values to attempt looping around, you can adjust them to make it more accurate- refer to the block comment above
					// 		bird_x<=150;
					// end
					// else if(direction==3'b101) 
					// begin // left
					// 	bird_x<=bird_x-2; 
					// 	if(bird_x==150)
					// 		bird_x<=800;
					// end
					if(direction==2'b10) 
					begin // up
						bird_y<=bird_y-2;
						if(bird_y==34)
							bird_y<=514;
					end
					else if(direction==2'b11) 
					begin // down
						bird_y<=bird_y+2;
						if(bird_y==514)
							bird_y<=34;
					end

					block_x <= block_x - 1;
					if (block_x == 150) 
					begin
						block_x <= 800;
					end

					sub_x <= block_x - bird_x;
					sub_y <= block_y - bird_y;
					if (sub_x >= 0 && sub_x <= 5 && sub_y >= 0 && sub_y <= 5)
					begin
						score_ones <= score_ones + 1;
						bird_x <= 200;
						bird_y <= 250;
					end
				end

				PHASE2:
				// Blocks move faster. This is reached after 10 seconds.
				begin
					state <= PHASE3;
				end

				PHASE3:
				// Blocks move faster. This is reached after 20 seconds.
				begin
					state <= DONE;
				end

				DONE:
				begin
					if (Ack) // Ack is right button
						state <= INITIAL;
				end
			endcase
		end
	end
	
	//msb of direction acts as a sort of enable, lower two bits dictate direction
	always@(posedge clk,posedge rst) begin
		if(rst)
			direction<=2'b00;
		else begin
			if(up)
				direction<=2'b10;
			else if(down)
				direction<=2'b11;
		end
	end
	
	
endmodule
