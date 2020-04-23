`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:18:00 12/14/2017 
// Design Name: 
// Module Name:    vga_top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
// Date: 04/04/2020
// Author: Yue (Julien) Niu
// Description: Port from NEXYS3 to NEXYS4
//////////////////////////////////////////////////////////////////////////////////
module vga_top(
	input ClkPort,
	input BtnC,
	input BtnU,
	input BtnR,
	input BtnL,
	input BtnD,
	//VGA signal
	output hSync, vSync,
	output [3:0] vgaR, vgaG, vgaB,
	
	//SSG signal 
	output An0, An1, An2, An3, An4, An5, An6, An7,
	output Ca, Cb, Cc, Cd, Ce, Cf, Cg, Dp,
	
	output MemOE, MemWR, RamCS, QuadSpiFlashC
	wire Reset, Start, Ack;
	assign Reset = BtnC;
	assign Start = BtnL;
	assign Ack   = BtnR;

	wire bright;
	wire[9:0] hc, vc;
	wire[15:0] score;
	wire up,down,left,right;
	wire [3:0] anode;
	wire [11:0] rgb;

	wire Qi, Qp1, Qp2, Qp3, Done;

	wire [3:0] score_ones;
	wire [3:0] score_tens;
	wire [3:0] score_hundreds;
	
	wire ten_secs;

	wire [3:0] SSD0, SSD1, SSD2, SSD3, SSD4, SSD5, SSD6, SSD7;	
	reg [7:0] SSD_CATHODES;
	reg [3:0] SSD;

	wire [2:0] ssdscan_clk;
	reg [26:0] DIV_CLK;
	wire board_clk;

	ee354_debouncer #(.N_dc(28)) ee354_debouncer_up (.CLK(ClkPort), .RESET(Reset), .PB(BtnU), .CCEN(up));
	ee354_debouncer #(.N_dc(28)) ee354_debouncer_down (.CLK(ClkPort), .RESET(Reset), .PB(BtnD), .CCEN(down));
	display_controller dc(.clk(ClkPort), .hSync(hSync), .vSync(vSync), .bright(bright), .hCount(hc), .vCount(vc));
	block_controller sc(.clk(ClkPort), .bright(bright), .rst(Reset), .up(up), .down(down),.Start(Start),.Ack(Ack),.hCount(hc), .vCount(vc), .rgb(rgb), .score_ones(score_ones),
	.score_tens(score_tens), .score_hundreds(score_hundreds), .Qi(Qi), .Qp1(Qp1), .Qp2(Qp2), .Qp3(Qp3), .Done(Done), .ten_secs(ten_secs) );
	assign board_clk = ClkPort;

	always @ (posedge board_clk, posedge Reset)  
	begin : CLOCK_DIVIDER
      if (Reset)
			DIV_CLK <= 0;
      else
			DIV_CLK <= DIV_CLK + 1'b1;
	end		
	
	assign vgaR = rgb[11 : 8];
	assign vgaG = rgb[7  : 4];
	assign vgaB = rgb[3  : 0];
	
	// disable mamory ports
	assign {MemOE, MemWR, RamCS, QuadSpiFlashCS} = 4'b1111;

	// Output: LEDs
	assign {Ld8} = {ten_secs};
	assign {Ld7, Ld6, Ld5, Ld4, Ld3} = {Qi, Qp1, Qp2, Qp3, Done};
	assign {Ld2, Ld1, Ld0} = {Start, Ack, Reset};

	// SSDs
	assign SSD7 = {1'b0, 1'b0, 1'b0, Done};
	assign SSD6 = {1'b0, 1'b0, 1'b0, Qp3};
	assign SSD5 = {1'b0, 1'b0, 1'b0, Qp2};
	assign SSD4 = {1'b0, 1'b0, 1'b0, Qp1};
	assign SSD3 = {1'b0, 1'b0, 1'b0, Qi};
	assign SSD2 = score_hundreds;
	assign SSD1 = score_tens;
	assign SSD0 = score_ones;

	assign ssdscan_clk = DIV_CLK[19:17];
	
	assign An0	= !(~(ssdscan_clk[2]) && ~(ssdscan_clk[1]) && ~(ssdscan_clk[0]));  // when ssdscan_clk = 000
	assign An1	= !(~(ssdscan_clk[2]) && ~(ssdscan_clk[1]) &&  (ssdscan_clk[0]));  // when ssdscan_clk = 001
	assign An2	= !(~(ssdscan_clk[2]) &&  (ssdscan_clk[1]) && ~(ssdscan_clk[0]));  // when ssdscan_clk = 010
	assign An3	= !(~(ssdscan_clk[2]) &&  (ssdscan_clk[1]) &&  (ssdscan_clk[0]));  // when ssdscan_clk = 011
	assign An4	= !( (ssdscan_clk[2]) && ~(ssdscan_clk[1]) && ~(ssdscan_clk[0]));  // when ssdscan_clk = 100
	assign An5	= !( (ssdscan_clk[2]) && ~(ssdscan_clk[1]) &&  (ssdscan_clk[0]));  // when ssdscan_clk = 101
	assign An6	= !( (ssdscan_clk[2]) &&  (ssdscan_clk[1]) && ~(ssdscan_clk[0]));  // when ssdscan_clk = 110
	assign An7	= !( (ssdscan_clk[2]) &&  (ssdscan_clk[1]) &&  (ssdscan_clk[0]));  // when ssdscan_clk = 111

	// SSD Scanning
	always @ (ssdscan_clk, SSD0, SSD1, SSD2, SSD3, SSD4, SSD5, SSD6, SSD7)
	begin : SSD_SCAN_OUT
		case (ssdscan_clk) 
		 	3'b000: SSD = SSD0;
		 	3'b001: SSD = SSD1;
		 	3'b010: SSD = SSD2;
		 	3'b011: SSD = SSD3;
			3'b100: SSD = SSD4;
		 	3'b101: SSD = SSD5;
		 	3'b110: SSD = SSD6;
		 	3'b111: SSD = SSD7;
		endcase
	end	

	// Following is Hex-to-SSD conversion
	always @ (SSD) 
	begin : HEX_TO_SSD
		case (SSD)
			4'b0000: SSD_CATHODES = 8'b00000011; // 0
			4'b0001: SSD_CATHODES = 8'b10011111; // 1
			4'b0010: SSD_CATHODES = 8'b00100101; // 2
			4'b0011: SSD_CATHODES = 8'b00001101; // 3
			4'b0100: SSD_CATHODES = 8'b10011001; // 4
			4'b0101: SSD_CATHODES = 8'b01001001; // 5
			4'b0110: SSD_CATHODES = 8'b01000001; // 6
			4'b0111: SSD_CATHODES = 8'b00011111; // 7
			4'b1000: SSD_CATHODES = 8'b00000001; // 8
			4'b1001: SSD_CATHODES = 8'b00001001; // 9
			4'b1010: SSD_CATHODES = 8'b00010001; // A
			4'b1011: SSD_CATHODES = 8'b11000001; // B
			4'b1100: SSD_CATHODES = 8'b01100011; // C
			4'b1101: SSD_CATHODES = 8'b10000101; // D
			4'b1110: SSD_CATHODES = 8'b01100001; // E
			4'b1111: SSD_CATHODES = 8'b01110001; // F    
			default: SSD_CATHODES = 8'bXXXXXXXX; // default is not needed as we covered all cases
		endcase
	end	

	assign {Ca, Cb, Cc, Cd, Ce, Cf, Cg, Dp} = {SSD_CATHODES};	

endmodule
