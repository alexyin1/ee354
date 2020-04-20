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
	wire Reset;
	assign Reset=BtnC;
	wire bright;
	wire[9:0] hc, vc;
	wire[15:0] score;
	wire up,down,left,right;
	wire [3:0] anode;
	wire [11:0] rgb;
	ee354_debouncer #(.N_dc(28)) ee354_debouncer_1 (.CLK(ClkPort), .RESET(Reset), .PB(BtnL), .SCEN(left));
	ee354_debouncer #(.N_dc(28)) ee354_debouncer_2 (.CLK(ClkPort), .RESET(Reset), .PB(BtnR), .SCEN(right));
	ee354_debouncer #(.N_dc(28)) ee354_debouncer_3 (.CLK(ClkPort), .RESET(Reset), .PB(BtnU), .SCEN(up));
	ee354_debouncer #(.N_dc(28)) ee354_debouncer_4 (.CLK(ClkPort), .RESET(Reset), .PB(BtnD), .SCEN(down));
	display_controller dc(.clk(ClkPort), .hSync(hSync), .vSync(vSync), .bright(bright), .hCount(hc), .vCount(vc));
	block_controller sc(.clk(ClkPort), .bright(bright), .rst(BtnC), .up(up), .down(down),.left(left),.right(right),.hCount(hc), .vCount(vc), .rgb(rgb));
	
	assign Dp = 1;
	assign {Ca, Cb, Cc, Cd, Ce, Cf, Cg} = 7'b1111111;
    assign {An7, An6, An5, An4, An3, An2, An1, An0} = 8'b11111111;

	
	assign vgaR = rgb[11 : 8];
	assign vgaG = rgb[7  : 4];
	assign vgaB = rgb[3  : 0];
	
	// disable mamory ports
	assign {MemOE, MemWR, RamCS, QuadSpiFlashCS} = 4'b1111;

endmodule
