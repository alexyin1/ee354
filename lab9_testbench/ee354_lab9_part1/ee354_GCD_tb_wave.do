onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ee354_GCD_tb_v/Clk
add wave -noupdate /ee354_GCD_tb_v/clk_cnt
add wave -noupdate /ee354_GCD_tb_v/Reset
add wave -noupdate /ee354_GCD_tb_v/Start
add wave -noupdate /ee354_GCD_tb_v/Ack
add wave -noupdate /ee354_GCD_tb_v/Ain
add wave -noupdate /ee354_GCD_tb_v/Bin
add wave -noupdate /ee354_GCD_tb_v/AB_GCD
add wave -noupdate /ee354_GCD_tb_v/q_I
add wave -noupdate /ee354_GCD_tb_v/q_Sub
add wave -noupdate /ee354_GCD_tb_v/q_Mult
add wave -noupdate /ee354_GCD_tb_v/q_Done
add wave -noupdate /ee354_GCD_tb_v/start_clock_cnt
add wave -noupdate /ee354_GCD_tb_v/clocks_taken
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {309960 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 88
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
