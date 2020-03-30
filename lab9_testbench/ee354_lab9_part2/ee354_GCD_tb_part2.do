# ee354_gcd_tb_Part2.do
vlib work
vlog +acc "ee354_GCD.v"
vlog +acc "ee354_GCD_tb_part2.v"
vsim -t 1ps -lib work ee354_GCD_tb_v_part2
view objects
view wave
do {ee354_gcd_tb_part2_wave.do}
log -r *
run 1us

