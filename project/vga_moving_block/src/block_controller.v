`timescale 1ns / 1ps

module block_controller(
	input clk,
	input bright,
	input rst,
	input up, input down, input left, input right,
	input [9:0] hCount, vCount,
	output reg [11:0] rgb
   );
	reg [2:0] direction;
	reg [27:0]	DIV_CLK;
	always @ (posedge clk, posedge rst)  
	begin : CLOCK_DIVIDER
      if (rst)
			DIV_CLK <= 0;
	  else
			DIV_CLK <= DIV_CLK + 1'b1;
	end
	wire move_clk;
	assign move_clk=DIV_CLK[19];
	wire block_fill;
	integer i;
	
	//these two values dictate the center of the block, incrementing and decrementing them at a rate leads the block to move in certain directions
	reg [9:0] xpos, ypos;
	
	parameter RED   = 12'b1111_0000_0000;
	
	/*when outputting the rgb value in an always block like this, make sure to include the if(~bright) statement, as this ensures the monitor 
	will output some data to every pixel and not just the images you are trying to display*/
	always@ (*) begin
    	if(block_fill )
			rgb = RED; 
		else if (~bright)
			rgb = 12'b0000_0000_0000;
		else	
			rgb=12'b1111_1111_1111;
	end
		//the +-5 for the positions give the dimension of the block (i.e. it will be 10x10 pixels)
	assign block_fill=vCount>=(ypos-5) && vCount<=(ypos+5) && hCount>=(xpos-5) && hCount<=(xpos+5);
	
	always@(posedge move_clk, posedge rst) 
	begin
		if(rst)
		begin 
			//rough values for center of screen
			xpos<=450;
			ypos<=250;
		end
		else if (move_clk) begin
		
		/* Note that the top left of the screen does NOT correlate to vCount=0 and hCount=0. This is due to the way that the scanning
			works in display_controller. There is a little bit of time right after the pulse (the front porch) and right before the next
			pulse (called the back porch) that the scanning doesn't output to the display. So effectively, the top left corner corresponds 
			to (hcount,vcount)~(144,35). Which means with a 640x480 resolution, the bottom right corner corresponds to ~(783,515).  
		*/
			if(direction==3'b100) begin
				xpos<=xpos+2; //change the amount you increment to make the speed faster 
				if(xpos==800) //these are rough values to attempt looping around, you can adjust them to make it more accurate- refer to the block comment above
					xpos<=150;
			end
			else if(direction==3'b101) begin
				xpos<=xpos-2;
				if(xpos==150)
					xpos<=800;
			end
			else if(direction==3'b110) begin
				ypos<=ypos-2;
				if(ypos==34)
					ypos<=514;
			end
			else if(direction==3'b111) begin
				ypos<=ypos+2;
				if(ypos==514)
					ypos<=34;
			end
		end
	end
	
	//msb of direction acts as a sort of enable, lower two bits dictate direction
	always@(posedge clk,posedge rst) begin
		if(rst)
			direction<=3'b000;
		else begin
			if(right)
				direction<=3'b100;
			else if(left)
				direction<=3'b101;
			else if(up)
				direction<=3'b110;
			else if(down)
				direction<=3'b111;
		end
	end
	
	
endmodule
