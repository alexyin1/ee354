#special_counter.do

vlib work
vlog  "ee201L_sync_counter_mix_of_blocking_and_non_blocking.v"  
vlog  "ee201L_sync_counter_mix_of_blocking_and_non_blocking_tb.v" 
vsim -novopt -t 1ps -lib work ee201L_sync_counter_mix_of_blocking_and_non_blocking_tb

view wave
view structure
view signals

do {parity_wave.do}
log -r *

run 2560ns



