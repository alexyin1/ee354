onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ee354_GCD_tb_v_part2/Clk
add wave -noupdate /ee354_GCD_tb_v_part2/clk_cnt
add wave -noupdate /ee354_GCD_tb_v_part2/Reset
add wave -noupdate /ee354_GCD_tb_v_part2/Start
add wave -noupdate /ee354_GCD_tb_v_part2/Ack
add wave -noupdate /ee354_GCD_tb_v_part2/Ain
add wave -noupdate /ee354_GCD_tb_v_part2/Bin
add wave -noupdate /ee354_GCD_tb_v_part2/AB_GCD
add wave -noupdate /ee354_GCD_tb_v_part2/q_I
add wave -noupdate /ee354_GCD_tb_v_part2/q_Sub
add wave -noupdate /ee354_GCD_tb_v_part2/q_Mult
add wave -noupdate /ee354_GCD_tb_v_part2/q_Done
add wave -noupdate /ee354_GCD_tb_v_part2/start_clock_cnt
add wave -noupdate /ee354_GCD_tb_v_part2/clocks_taken
add wave -noupdate /ee354_GCD_tb_v_part2/a_loop
add wave -noupdate /ee354_GCD_tb_v_part2/b_loop
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1041290 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 122
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
WaveRestoreZoom {0 ps} {315 ns}
