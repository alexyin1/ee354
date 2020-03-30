onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ee354_GCD_tb_v_part3/Clk
add wave -noupdate /ee354_GCD_tb_v_part3/clk_cnt
add wave -noupdate /ee354_GCD_tb_v_part3/Reset
add wave -noupdate /ee354_GCD_tb_v_part3/Start
add wave -noupdate /ee354_GCD_tb_v_part3/Ack
add wave -noupdate /ee354_GCD_tb_v_part3/Ain
add wave -noupdate /ee354_GCD_tb_v_part3/Bin
add wave -noupdate /ee354_GCD_tb_v_part3/AB_GCD
add wave -noupdate /ee354_GCD_tb_v_part3/q_I
add wave -noupdate /ee354_GCD_tb_v_part3/q_Sub
add wave -noupdate /ee354_GCD_tb_v_part3/q_Mult
add wave -noupdate /ee354_GCD_tb_v_part3/q_Done
add wave -noupdate /ee354_GCD_tb_v_part3/start_clock_cnt
add wave -noupdate /ee354_GCD_tb_v_part3/clocks_taken
add wave -noupdate /ee354_GCD_tb_v_part3/a_loop
add wave -noupdate /ee354_GCD_tb_v_part3/b_loop
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 125
configure wave -valuecolwidth 40
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1050 ns}
