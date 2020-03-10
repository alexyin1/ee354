`timescale 1ns / 1ps

// ==============================================================================================
// 												Define Module
// ==============================================================================================
module PmodKYPD_5RO_6WO(
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
	inout [7:0] JA;			// Port JA on Nexys3, JA[3:0] is Columns, JA[7:4] is rows
	output [7:0] an;			// Anodes on seven segment display
	output [6:0] seg;			// Cathodes on seven segment display

// ==============================================================================================
// 							  		Parameters, Regsiters, and Wires
// ==============================================================================================

// Output wires
	wire [7:0] an;
	wire [6:0] seg;
	
// Signals used to connect KCPSM6

	wire [11:0] address;
	wire [17:0]	instruction;
	wire        bram_enable;
	reg  [7:0]  in_port;
	wire [7:0]  out_port;
	wire [7:0]  port_id;
	wire        write_strobe;
	wire        k_write_strobe;
	wire        read_strobe;
	reg         interrupt;   
	wire        interrupt_ack;
	wire        kcpsm6_sleep;  
	wire        kcpsm6_reset;
	wire        rdl;	
	
	wire		Reset, ClkPort;
	wire		board_clk, sys_clk;
	reg [3:0]	outJA;
	reg [3:0]   outAnode;
	reg [6:0]	outSeg;
	/////////////////////////////////////////////////////////////////////////////////////////
  // Instantiate KCPSM6 and connect to program ROM
  /////////////////////////////////////////////////////////////////////////////////////////
  //
  // The generics can be defined as required. In this case the 'hwbuild' value is used to 
  // define a version using the ASCII code for the desired letter and the interrupt vector
  // has been set to 3C0 to provide 64 instructions for an Interrupt Service Routine (ISR)
  // before reaching the end of a 1K memory 
  //


  kcpsm6 #(
	.interrupt_vector	(12'h3FF),
	.scratch_pad_memory_size(64),
	.hwbuild		(8'h41))            // 41 hex is ASCII Character "A"
  processor (
	.address 		(address),
	.instruction 	(instruction),
	.bram_enable 	(bram_enable),
	.port_id 		(port_id),
	.write_strobe 	(write_strobe),
	.k_write_strobe (k_write_strobe),
	.out_port 		(out_port),
	.read_strobe 	(read_strobe),
	.in_port 		(in_port),
	.interrupt 		(interrupt),
	.interrupt_ack 	(interrupt_ack),
	.reset 			(kcpsm6_reset),
	.sleep			(kcpsm6_sleep),
	.clk 			(board_clk)); 
	
prom_kypd_5RO_6WO #(
	.C_FAMILY		   ("7S"),  
	.C_RAM_SIZE_KWORDS	(1),  
	.C_JTAG_LOADER_ENABLE	(1))
	program_rom (
	.rdl 			(rdl),
	.enable 		(bram_enable),
	.address 		(address),
	.instruction 	(instruction),
	.clk 			(board_clk));  

	BUFGP BUFGP1 (board_clk, ClkPort); 	
	
assign JA[3:0]= outJA[3:0];
assign an = {4'b1111, outAnode};
assign seg = outSeg;
always @ (*)
begin
	case (port_id[3:0])
		// #1 TODO select signal to input port
		4'b0100 : in_port <=  {4'b0000, sw};
		default : in_port <= 8'bXXXXXXXX ;  
	endcase
end	

always @(posedge board_clk) 	
begin	
	// 'write_strobe' is used to qualify all writes to general output ports using OUTPUT.
	if (write_strobe == 1'b1) 
	begin
		case (port_id[3:0])
		// #2 TODO connect signal to output port
		4'b0100 : outAnode <= out_port[3:0];
		4'b0101 : outSeg <= out_port[6:0];
		endcase
	end
end	
endmodule