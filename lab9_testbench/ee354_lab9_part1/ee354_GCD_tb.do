# ee354_gcd_tb_Part1.do
vlib work
vlog +acc "ee354_GCD.v"
vlog +acc "ee354_GCD_tb.v"
vsim -t 1ps -lib work ee354_GCD_tb_v
view objects
view wave
do {ee354_GCD_tb_wave.do}
log -r *
run 300ns

