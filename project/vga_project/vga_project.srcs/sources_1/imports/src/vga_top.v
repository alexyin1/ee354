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
	
	output MemOE, MemWR, RamCS, QuadSpiFlashCS
	);
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

	wire [3:0] SSD0, SSD1, SSD2, SSD3;	
	reg [6:0] SSD_CATHODES;
	reg [3:0] SSD;

	wire [1:0] ssdscan_clk;
	reg [26:0] DIV_CLK;
	wire board_clk;

	ee354_debouncer #(.N_dc(28)) ee354_debouncer_1 (.CLK(ClkPort), .RESET(Reset), .PB(BtnL), .SCEN(left));
	ee354_debouncer #(.N_dc(28)) ee354_debouncer_2 (.CLK(ClkPort), .RESET(Reset), .PB(BtnR), .SCEN(right));
	ee354_debouncer #(.N_dc(28)) ee354_debouncer_3 (.CLK(ClkPort), .RESET(Reset), .PB(BtnU), .SCEN(up));
	ee354_debouncer #(.N_dc(28)) ee354_debouncer_4 (.CLK(ClkPort), .RESET(Reset), .PB(BtnD), .SCEN(down));
	display_controller dc(.clk(ClkPort), .hSync(hSync), .vSync(vSync), .bright(bright), .hCount(hc), .vCount(vc));
	block_controller sc(.clk(ClkPort), .bright(bright), .rst(Reset), .up(up), .down(down),.Start(Start),.Ack(Ack),.hCount(hc), .vCount(vc), .rgb(rgb), .score_ones(score_ones),
	.Qi(Qi), .Qp1(Qp1), .Qp2(Qp2), .Qp3(Qp3), .Done(Done) );

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

	assign SSD0 = score_ones;

	assign ssdscan_clk = DIV_CLK[19:18];
	
	assign An0	= !(~(ssdscan_clk[1]) && ~(ssdscan_clk[0]));  // when ssdscan_clk = 00
	assign An1	= !(~(ssdscan_clk[1]) &&  (ssdscan_clk[0]));  // when ssdscan_clk = 01
	assign An2	= !( (ssdscan_clk[1]) && ~(ssdscan_clk[0]));  // when ssdscan_clk = 10
	assign An3	= !( (ssdscan_clk[1]) &&  (ssdscan_clk[0]));  // when ssdscan_clk = 11
	
	assign {Ld7, Ld6, Ld5, Ld4, Ld3} = {Qi, Qp1, Qp2, Qp3, Done};
	assign {Ld2, Ld1, Ld0} = {Start, Ack, Reset};

	always @ (ssdscan_clk, SSD0, SSD1, SSD2, SSD3)
	begin : SSD_SCAN_OUT
		case (ssdscan_clk) 
		 	2'b00: SSD = SSD0;
		 	2'b01: SSD = SSD1;
		 	2'b10: SSD = SSD2;
		 	2'b11: SSD = SSD3;
		endcase
	end	

	// Hex-to-SSD conversion
	always @ (SSD) 
	begin : HEX_TO_SSD
		case (SSD)
			4'b0000: SSD_CATHODES = 7'b0000001 ; // 0
			4'b0001: SSD_CATHODES = 7'b1001111 ; // 1
			4'b0010: SSD_CATHODES = 7'b0010010 ; // 2
			4'b0011: SSD_CATHODES = 7'b0000110 ; // 3
			4'b0100: SSD_CATHODES = 7'b1001100 ; // 4
			4'b0101: SSD_CATHODES = 7'b0100100 ; // 5
			4'b0110: SSD_CATHODES = 7'b0100000 ; // 6
			4'b0111: SSD_CATHODES = 7'b0001111 ; // 7
			4'b1000: SSD_CATHODES = 7'b0000000 ; // 8
			4'b1001: SSD_CATHODES = 7'b0000100 ; // 9
			4'b1010: SSD_CATHODES = 7'b0001000 ; // A
			4'b1011: SSD_CATHODES = 7'b1100000 ; // B
			4'b1100: SSD_CATHODES = 7'b0110001 ; // C
			4'b1101: SSD_CATHODES = 7'b1000010 ; // D
			4'b1110: SSD_CATHODES = 7'b0110000 ; // E
			4'b1111: SSD_CATHODES = 7'b0111000 ; // F    
			default: SSD_CATHODES = 7'bXXXXXXX ; // default is not needed as we covered all cases
		endcase
	end

	assign {Ca, Cb, Cc, Cd, Ce, Cf, Cg, Dp} = {SSD_CATHODES};	

endmodule
