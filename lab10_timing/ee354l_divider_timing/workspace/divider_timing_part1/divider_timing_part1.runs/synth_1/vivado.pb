
�
Command: %s
53*	vivadotcl2O
;synth_design -top divider_timing_top -part xc7a100tcsg324-12default:defaultZ4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7a100t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7a100t2default:defaultZ17-349h px� 
W
Loading part %s157*device2$
xc7a100tcsg324-12default:defaultZ21-403h px� 
�
%s*synth2�
yStarting RTL Elaboration : Time (s): cpu = 00:00:04 ; elapsed = 00:00:05 . Memory (MB): peak = 1039.324 ; gain = 233.406
2default:defaulth px� 
�
synthesizing module '%s'%s4497*oasys2&
divider_timing_top2default:default2
 2default:default2h
RC:/Xilinx_projects/ee354l_divider_timing/src/divider_timing_top_with_single_step.v2default:default2
92default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
BUFGP2default:default2
 2default:default2K
5C:/Xilinx/Vivado/2019.2/scripts/rt/data/unisim_comp.v2default:default2
12312default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
BUFGP2default:default2
 2default:default2
12default:default2
12default:default2K
5C:/Xilinx/Vivado/2019.2/scripts/rt/data/unisim_comp.v2default:default2
12312default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2#
ee201_debouncer2default:default2
 2default:default2f
PC:/Xilinx_projects/ee354l_divider_timing/src/ee201_debounce_DPB_SCEN_CCEN_MCEN.v2default:default2
902default:default8@Z8-6157h px� 
Z
%s
*synth2B
.	Parameter N_dc bound to: 25 - type: integer 
2default:defaulth p
x
� 
P
%s
*synth28
$	Parameter INI bound to: 6'b000000 
2default:defaulth p
x
� 
O
%s
*synth27
#	Parameter WQ bound to: 6'b000001 
2default:defaulth p
x
� 
T
%s
*synth2<
(	Parameter SCEN_st bound to: 6'b111100 
2default:defaulth p
x
� 
O
%s
*synth27
#	Parameter WH bound to: 6'b100000 
2default:defaulth p
x
� 
T
%s
*synth2<
(	Parameter MCEN_st bound to: 6'b101100 
2default:defaulth p
x
� 
T
%s
*synth2<
(	Parameter CCEN_st bound to: 6'b100100 
2default:defaulth p
x
� 
V
%s
*synth2>
*	Parameter MCEN_cont bound to: 6'b101101 
2default:defaulth p
x
� 
P
%s
*synth28
$	Parameter CCR bound to: 6'b100001 
2default:defaulth p
x
� 
Q
%s
*synth29
%	Parameter WFCR bound to: 6'b100010 
2default:defaulth p
x
� 
�
"Detected attribute (* %s = "%s" *)3982*oasys2 
fsm_encoding2default:default2
user2default:default2f
PC:/Xilinx_projects/ee354l_divider_timing/src/ee201_debounce_DPB_SCEN_CCEN_MCEN.v2default:default2
1172default:default8@Z8-5534h px� 
�
-case statement is not full and has no default155*oasys2f
PC:/Xilinx_projects/ee354l_divider_timing/src/ee201_debounce_DPB_SCEN_CCEN_MCEN.v2default:default2
1512default:default8@Z8-155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2#
ee201_debouncer2default:default2
 2default:default2
22default:default2
12default:default2f
PC:/Xilinx_projects/ee354l_divider_timing/src/ee201_debounce_DPB_SCEN_CCEN_MCEN.v2default:default2
902default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2"
divider_timing2default:default2
 2default:default2Y
CC:/Xilinx_projects/ee354l_divider_timing/src/divider_timing_part1.v2default:default2
102default:default8@Z8-6157h px� 
Q
%s
*synth29
%	Parameter INITIAL bound to: 3'b001 
2default:defaulth p
x
� 
Q
%s
*synth29
%	Parameter COMPUTE bound to: 3'b010 
2default:defaulth p
x
� 
P
%s
*synth28
$	Parameter DONE_S bound to: 3'b100 
2default:defaulth p
x
� 
�
?HDL ADVISOR - Pragma %s detected. Simulation mismatch may occur3412*oasys2!
parallel_case2default:default2Y
CC:/Xilinx_projects/ee354l_divider_timing/src/divider_timing_part1.v2default:default2
442default:default8@Z8-3536h px� 
�
?HDL ADVISOR - Pragma %s detected. Simulation mismatch may occur3412*oasys2
	full_case2default:default2Y
CC:/Xilinx_projects/ee354l_divider_timing/src/divider_timing_part1.v2default:default2
442default:default8@Z8-3536h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2"
divider_timing2default:default2
 2default:default2
32default:default2
12default:default2Y
CC:/Xilinx_projects/ee354l_divider_timing/src/divider_timing_part1.v2default:default2
102default:default8@Z8-6155h px� 
�
default block is never used226*oasys2h
RC:/Xilinx_projects/ee354l_divider_timing/src/divider_timing_top_with_single_step.v2default:default2
1922default:default8@Z8-226h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2
Ld82default:default2&
divider_timing_top2default:default2h
RC:/Xilinx_projects/ee354l_divider_timing/src/divider_timing_top_with_single_step.v2default:default2
262default:default8@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2
Ld92default:default2&
divider_timing_top2default:default2h
RC:/Xilinx_projects/ee354l_divider_timing/src/divider_timing_top_with_single_step.v2default:default2
262default:default8@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2
Ld102default:default2&
divider_timing_top2default:default2h
RC:/Xilinx_projects/ee354l_divider_timing/src/divider_timing_top_with_single_step.v2default:default2
262default:default8@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2
Ld112default:default2&
divider_timing_top2default:default2h
RC:/Xilinx_projects/ee354l_divider_timing/src/divider_timing_top_with_single_step.v2default:default2
262default:default8@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2
Ld122default:default2&
divider_timing_top2default:default2h
RC:/Xilinx_projects/ee354l_divider_timing/src/divider_timing_top_with_single_step.v2default:default2
262default:default8@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2
Ld132default:default2&
divider_timing_top2default:default2h
RC:/Xilinx_projects/ee354l_divider_timing/src/divider_timing_top_with_single_step.v2default:default2
262default:default8@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2
Ld142default:default2&
divider_timing_top2default:default2h
RC:/Xilinx_projects/ee354l_divider_timing/src/divider_timing_top_with_single_step.v2default:default2
262default:default8@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2
Ld152default:default2&
divider_timing_top2default:default2h
RC:/Xilinx_projects/ee354l_divider_timing/src/divider_timing_top_with_single_step.v2default:default2
262default:default8@Z8-3848h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2&
divider_timing_top2default:default2
 2default:default2
42default:default2
12default:default2h
RC:/Xilinx_projects/ee354l_divider_timing/src/divider_timing_top_with_single_step.v2default:default2
92default:default8@Z8-6155h px� 
�
+design %s has port %s driven by constant %s3447*oasys2&
divider_timing_top2default:default2
MemOE2default:default2
12default:defaultZ8-3917h px� 
�
+design %s has port %s driven by constant %s3447*oasys2&
divider_timing_top2default:default2
MemWR2default:default2
12default:defaultZ8-3917h px� 
�
+design %s has port %s driven by constant %s3447*oasys2&
divider_timing_top2default:default2
RamCS2default:default2
12default:defaultZ8-3917h px� 
�
+design %s has port %s driven by constant %s3447*oasys2&
divider_timing_top2default:default2"
QuadSpiFlashCS2default:default2
12default:defaultZ8-3917h px� 
�
+design %s has port %s driven by constant %s3447*oasys2&
divider_timing_top2default:default2
Dp2default:default2
02default:defaultZ8-3917h px� 
�
!design %s has unconnected port %s3331*oasys2&
divider_timing_top2default:default2
Ld82default:defaultZ8-3331h px� 
�
!design %s has unconnected port %s3331*oasys2&
divider_timing_top2default:default2
Ld92default:defaultZ8-3331h px� 
�
!design %s has unconnected port %s3331*oasys2&
divider_timing_top2default:default2
Ld102default:defaultZ8-3331h px� 
�
!design %s has unconnected port %s3331*oasys2&
divider_timing_top2default:default2
Ld112default:defaultZ8-3331h px� 
�
!design %s has unconnected port %s3331*oasys2&
divider_timing_top2default:default2
Ld122default:defaultZ8-3331h px� 
�
!design %s has unconnected port %s3331*oasys2&
divider_timing_top2default:default2
Ld132default:defaultZ8-3331h px� 
�
!design %s has unconnected port %s3331*oasys2&
divider_timing_top2default:default2
Ld142default:defaultZ8-3331h px� 
�
!design %s has unconnected port %s3331*oasys2&
divider_timing_top2default:default2
Ld152default:defaultZ8-3331h px� 
�
%s*synth2�
yFinished RTL Elaboration : Time (s): cpu = 00:00:05 ; elapsed = 00:00:06 . Memory (MB): peak = 1111.875 ; gain = 305.957
2default:defaulth px� 
D
%s
*synth2,

Report Check Netlist: 
2default:defaulth p
x
� 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
� 
u
%s
*synth2]
I|      |Item              |Errors |Warnings |Status |Description       |
2default:defaulth p
x
� 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
� 
u
%s
*synth2]
I|1     |multi_driven_nets |      0|        0|Passed |Multi driven nets |
2default:defaulth p
x
� 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:06 ; elapsed = 00:00:06 . Memory (MB): peak = 1111.875 ; gain = 305.957
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:06 ; elapsed = 00:00:06 . Memory (MB): peak = 1111.875 ; gain = 305.957
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0052default:default2
1111.8752default:default2
0.0002default:defaultZ17-268h px� 
e
-Analyzing %s Unisim elements for replacement
17*netlist2
12default:defaultZ29-17h px� 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
�
Parsing XDC File [%s]
179*designutils2X
BC:/Xilinx_projects/ee354l_divider_timing/src/ee354_divider_top.xdc2default:default8Z20-179h px� 
�
No nets matched '%s'.
507*	planAhead2
Ld02default:default2X
BC:/Xilinx_projects/ee354l_divider_timing/src/ee354_divider_top.xdc2default:default2
1372default:default8@Z12-507h px� 
�
"No fanout objects found for '%s'.
830*	planAhead2I
5all_fanout -endpoints_only -flat -from [get_nets Ld0]2default:default2X
BC:/Xilinx_projects/ee354l_divider_timing/src/ee354_divider_top.xdc2default:default2
1372default:default8@Z12-830h px� 
�
No nets matched '%s'.
507*	planAhead2
Ld12default:default2X
BC:/Xilinx_projects/ee354l_divider_timing/src/ee354_divider_top.xdc2default:default2
1382default:default8@Z12-507h px� 
�
"No fanout objects found for '%s'.
830*	planAhead2I
5all_fanout -endpoints_only -flat -from [get_nets Ld1]2default:default2X
BC:/Xilinx_projects/ee354l_divider_timing/src/ee354_divider_top.xdc2default:default2
1382default:default8@Z12-830h px� 
�
No nets matched '%s'.
507*	planAhead2
Ld22default:default2X
BC:/Xilinx_projects/ee354l_divider_timing/src/ee354_divider_top.xdc2default:default2
1392default:default8@Z12-507h px� 
�
"No fanout objects found for '%s'.
830*	planAhead2I
5all_fanout -endpoints_only -flat -from [get_nets Ld2]2default:default2X
BC:/Xilinx_projects/ee354l_divider_timing/src/ee354_divider_top.xdc2default:default2
1392default:default8@Z12-830h px� 
�
No nets matched '%s'.
507*	planAhead2
Ld32default:default2X
BC:/Xilinx_projects/ee354l_divider_timing/src/ee354_divider_top.xdc2default:default2
1402default:default8@Z12-507h px� 
�
"No fanout objects found for '%s'.
830*	planAhead2I
5all_fanout -endpoints_only -flat -from [get_nets Ld3]2default:default2X
BC:/Xilinx_projects/ee354l_divider_timing/src/ee354_divider_top.xdc2default:default2
1402default:default8@Z12-830h px� 
�
No nets matched '%s'.
507*	planAhead2
Ld82default:default2X
BC:/Xilinx_projects/ee354l_divider_timing/src/ee354_divider_top.xdc2default:default2
1452default:default8@Z12-507h px� 
�
"No fanout objects found for '%s'.
830*	planAhead2I
5all_fanout -endpoints_only -flat -from [get_nets Ld8]2default:default2X
BC:/Xilinx_projects/ee354l_divider_timing/src/ee354_divider_top.xdc2default:default2
1452default:default8@Z12-830h px� 
�
No nets matched '%s'.
507*	planAhead2
Ld92default:default2X
BC:/Xilinx_projects/ee354l_divider_timing/src/ee354_divider_top.xdc2default:default2
1462default:default8@Z12-507h px� 
�
"No fanout objects found for '%s'.
830*	planAhead2I
5all_fanout -endpoints_only -flat -from [get_nets Ld9]2default:default2X
BC:/Xilinx_projects/ee354l_divider_timing/src/ee354_divider_top.xdc2default:default2
1462default:default8@Z12-830h px� 
�
No nets matched '%s'.
507*	planAhead2
Ld102default:default2X
BC:/Xilinx_projects/ee354l_divider_timing/src/ee354_divider_top.xdc2default:default2
1472default:default8@Z12-507h px� 
�
"No fanout objects found for '%s'.
830*	planAhead2J
6all_fanout -endpoints_only -flat -from [get_nets Ld10]2default:default2X
BC:/Xilinx_projects/ee354l_divider_timing/src/ee354_divider_top.xdc2default:default2
1472default:default8@Z12-830h px� 
�
No nets matched '%s'.
507*	planAhead2
Ld112default:default2X
BC:/Xilinx_projects/ee354l_divider_timing/src/ee354_divider_top.xdc2default:default2
1482default:default8@Z12-507h px� 
�
"No fanout objects found for '%s'.
830*	planAhead2J
6all_fanout -endpoints_only -flat -from [get_nets Ld11]2default:default2X
BC:/Xilinx_projects/ee354l_divider_timing/src/ee354_divider_top.xdc2default:default2
1482default:default8@Z12-830h px� 
�
No nets matched '%s'.
507*	planAhead2
Ld122default:default2X
BC:/Xilinx_projects/ee354l_divider_timing/src/ee354_divider_top.xdc2default:default2
1492default:default8@Z12-507h px� 
�
"No fanout objects found for '%s'.
830*	planAhead2J
6all_fanout -endpoints_only -flat -from [get_nets Ld12]2default:default2X
BC:/Xilinx_projects/ee354l_divider_timing/src/ee354_divider_top.xdc2default:default2
1492default:default8@Z12-830h px� 
�
No nets matched '%s'.
507*	planAhead2
Ld132default:default2X
BC:/Xilinx_projects/ee354l_divider_timing/src/ee354_divider_top.xdc2default:default2
1502default:default8@Z12-507h px� 
�
"No fanout objects found for '%s'.
830*	planAhead2J
6all_fanout -endpoints_only -flat -from [get_nets Ld13]2default:default2X
BC:/Xilinx_projects/ee354l_divider_timing/src/ee354_divider_top.xdc2default:default2
1502default:default8@Z12-830h px� 
�
No nets matched '%s'.
507*	planAhead2
Ld142default:default2X
BC:/Xilinx_projects/ee354l_divider_timing/src/ee354_divider_top.xdc2default:default2
1512default:default8@Z12-507h px� 
�
"No fanout objects found for '%s'.
830*	planAhead2J
6all_fanout -endpoints_only -flat -from [get_nets Ld14]2default:default2X
BC:/Xilinx_projects/ee354l_divider_timing/src/ee354_divider_top.xdc2default:default2
1512default:default8@Z12-830h px� 
�
No nets matched '%s'.
507*	planAhead2
Ld152default:default2X
BC:/Xilinx_projects/ee354l_divider_timing/src/ee354_divider_top.xdc2default:default2
1522default:default8@Z12-507h px� 
�
"No fanout objects found for '%s'.
830*	planAhead2J
6all_fanout -endpoints_only -flat -from [get_nets Ld15]2default:default2X
BC:/Xilinx_projects/ee354l_divider_timing/src/ee354_divider_top.xdc2default:default2
1522default:default8@Z12-830h px� 
�
No nets matched '%s'.
507*	planAhead2
Dp2default:default2X
BC:/Xilinx_projects/ee354l_divider_timing/src/ee354_divider_top.xdc2default:default2
2342default:default8@Z12-507h px� 
�
"No fanout objects found for '%s'.
830*	planAhead2H
4all_fanout -endpoints_only -flat -from [get_nets Dp]2default:default2X
BC:/Xilinx_projects/ee354l_divider_timing/src/ee354_divider_top.xdc2default:default2
2342default:default8@Z12-830h px� 
�
Finished Parsing XDC File [%s]
178*designutils2X
BC:/Xilinx_projects/ee354l_divider_timing/src/ee354_divider_top.xdc2default:default8Z20-178h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2V
BC:/Xilinx_projects/ee354l_divider_timing/src/ee354_divider_top.xdc2default:default28
$.Xil/divider_timing_top_propImpl.xdc2default:defaultZ1-236h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1194.5662default:default2
0.0002default:defaultZ17-268h px� 
�
!Unisim Transformation Summary:
%s111*project2j
V  A total of 1 instances were transformed.
  BUFGP => BUFGP (BUFG, IBUF): 1 instance 
2default:defaultZ1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common24
 Constraint Validation Runtime : 2default:default2
00:00:002default:default2 
00:00:00.0122default:default2
1194.5662default:default2
0.0002default:defaultZ17-268h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
Finished Constraint Validation : Time (s): cpu = 00:00:12 ; elapsed = 00:00:14 . Memory (MB): peak = 1194.566 ; gain = 388.648
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Loading part: xc7a100tcsg324-1
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:12 ; elapsed = 00:00:14 . Memory (MB): peak = 1194.566 ; gain = 388.648
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Z
%s
*synth2B
.Start Applying 'set_property' XDC Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:12 ; elapsed = 00:00:14 . Memory (MB): peak = 1194.566 ; gain = 388.648
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2
	state_reg2default:default2#
ee201_debouncer2default:defaultZ8-802h px� 
�
TROM size for "%s" is below threshold of ROM address width. It will be mapped to LUTs4039*oasys2

MCEN_count2default:defaultZ8-5587h px� 
~
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2"
debounce_count2default:defaultZ8-5546h px� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2
	state_reg2default:default2"
divider_timing2default:defaultZ8-802h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_                     INI |                        000000001 |                           000000
2default:defaulth p
x
� 
�
%s
*synth2s
_                      WQ |                        000000010 |                           000001
2default:defaulth p
x
� 
�
%s
*synth2s
_                 SCEN_st |                        000000100 |                           111100
2default:defaulth p
x
� 
�
%s
*synth2s
_                      WH |                        000001000 |                           100000
2default:defaulth p
x
� 
�
%s
*synth2s
_                 MCEN_st |                        000010000 |                           101100
2default:defaulth p
x
� 
�
%s
*synth2s
_                 CCEN_st |                        000100000 |                           100100
2default:defaulth p
x
� 
�
%s
*synth2s
_               MCEN_cont |                        001000000 |                           101101
2default:defaulth p
x
� 
�
%s
*synth2s
_                     CCR |                        010000000 |                           100001
2default:defaulth p
x
� 
�
%s
*synth2s
_                    WFCR |                        100000000 |                           100010
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
	state_reg2default:default2
one-hot2default:default2#
ee201_debouncer2default:defaultZ8-3354h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
.
%s
*synth2
*
2default:defaulth p
x
� 
�
%s
*synth2s
_                 INITIAL |                              001 |                              001
2default:defaulth p
x
� 
�
%s
*synth2s
_                 COMPUTE |                              010 |                              010
2default:defaulth p
x
� 
�
%s
*synth2s
_                  DONE_S |                              100 |                              100
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
6No Re-encoding of one hot register '%s' in module '%s'3445*oasys2
	state_reg2default:default2"
divider_timing2default:defaultZ8-3898h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:13 ; elapsed = 00:00:14 . Memory (MB): peak = 1194.566 ; gain = 388.648
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
� 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input     25 Bit       Adders := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   3 Input      8 Bit       Adders := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input      8 Bit       Adders := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input      4 Bit       Adders := 1     
2default:defaulth p
x
� 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               25 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                8 Bit    Registers := 3     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                4 Bit    Registers := 1     
2default:defaulth p
x
� 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   9 Input     25 Bit        Muxes := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   9 Input      9 Bit        Muxes := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input      9 Bit        Muxes := 5     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   4 Input      8 Bit        Muxes := 2     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   9 Input      6 Bit        Muxes := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   9 Input      4 Bit        Muxes := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   4 Input      3 Bit        Muxes := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 4     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   9 Input      1 Bit        Muxes := 3     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   4 Input      1 Bit        Muxes := 3     
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Y
%s
*synth2A
-Start RTL Hierarchical Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Hierarchical RTL Component report 
2default:defaulth p
x
� 
D
%s
*synth2,
Module ee201_debouncer 
2default:defaulth p
x
� 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
� 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input     25 Bit       Adders := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input      4 Bit       Adders := 1     
2default:defaulth p
x
� 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               25 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                4 Bit    Registers := 1     
2default:defaulth p
x
� 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   9 Input     25 Bit        Muxes := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   9 Input      9 Bit        Muxes := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input      9 Bit        Muxes := 5     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   9 Input      6 Bit        Muxes := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   9 Input      4 Bit        Muxes := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 3     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   9 Input      1 Bit        Muxes := 3     
2default:defaulth p
x
� 
C
%s
*synth2+
Module divider_timing 
2default:defaulth p
x
� 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
� 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   3 Input      8 Bit       Adders := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input      8 Bit       Adders := 1     
2default:defaulth p
x
� 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                8 Bit    Registers := 3     
2default:defaulth p
x
� 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   4 Input      8 Bit        Muxes := 2     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   4 Input      3 Bit        Muxes := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   4 Input      1 Bit        Muxes := 3     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 1     
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
[
%s
*synth2C
/Finished RTL Hierarchical Component Statistics
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2k
WPart Resources:
DSPs: 240 (col length:80)
BRAMs: 270 (col length: RAMB18 80 RAMB36 40)
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
]
%s
*synth2E
1Warning: Parallel synthesis criteria is not met 
2default:defaulth p
x
� 
�
+design %s has port %s driven by constant %s3447*oasys2&
divider_timing_top2default:default2
MemOE2default:default2
12default:defaultZ8-3917h px� 
�
+design %s has port %s driven by constant %s3447*oasys2&
divider_timing_top2default:default2
MemWR2default:default2
12default:defaultZ8-3917h px� 
�
+design %s has port %s driven by constant %s3447*oasys2&
divider_timing_top2default:default2
RamCS2default:default2
12default:defaultZ8-3917h px� 
�
+design %s has port %s driven by constant %s3447*oasys2&
divider_timing_top2default:default2"
QuadSpiFlashCS2default:default2
12default:defaultZ8-3917h px� 
�
+design %s has port %s driven by constant %s3447*oasys2&
divider_timing_top2default:default2
Dp2default:default2
02default:defaultZ8-3917h px� 
�
!design %s has unconnected port %s3331*oasys2&
divider_timing_top2default:default2
Ld82default:defaultZ8-3331h px� 
�
!design %s has unconnected port %s3331*oasys2&
divider_timing_top2default:default2
Ld92default:defaultZ8-3331h px� 
�
!design %s has unconnected port %s3331*oasys2&
divider_timing_top2default:default2
Ld102default:defaultZ8-3331h px� 
�
!design %s has unconnected port %s3331*oasys2&
divider_timing_top2default:default2
Ld112default:defaultZ8-3331h px� 
�
!design %s has unconnected port %s3331*oasys2&
divider_timing_top2default:default2
Ld122default:defaultZ8-3331h px� 
�
!design %s has unconnected port %s3331*oasys2&
divider_timing_top2default:default2
Ld132default:defaultZ8-3331h px� 
�
!design %s has unconnected port %s3331*oasys2&
divider_timing_top2default:default2
Ld142default:defaultZ8-3331h px� 
�
!design %s has unconnected port %s3331*oasys2&
divider_timing_top2default:default2
Ld152default:defaultZ8-3331h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:15 ; elapsed = 00:00:17 . Memory (MB): peak = 1194.566 ; gain = 388.648
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
R
%s
*synth2:
&Start Applying XDC Timing Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:22 ; elapsed = 00:00:24 . Memory (MB): peak = 1194.566 ; gain = 388.648
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
}Finished Timing Optimization : Time (s): cpu = 00:00:23 ; elapsed = 00:00:25 . Memory (MB): peak = 1214.883 ; gain = 408.965
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
|Finished Technology Mapping : Time (s): cpu = 00:00:23 ; elapsed = 00:00:25 . Memory (MB): peak = 1216.203 ; gain = 410.285
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
vFinished IO Insertion : Time (s): cpu = 00:00:27 ; elapsed = 00:00:29 . Memory (MB): peak = 1221.988 ; gain = 416.070
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:27 ; elapsed = 00:00:29 . Memory (MB): peak = 1221.988 ; gain = 416.070
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
D
%s
*synth2,

Report Check Netlist: 
2default:defaulth p
x
� 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
� 
u
%s
*synth2]
I|      |Item              |Errors |Warnings |Status |Description       |
2default:defaulth p
x
� 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
� 
u
%s
*synth2]
I|1     |multi_driven_nets |      0|        0|Passed |Multi driven nets |
2default:defaulth p
x
� 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:27 ; elapsed = 00:00:29 . Memory (MB): peak = 1221.988 ; gain = 416.070
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:27 ; elapsed = 00:00:29 . Memory (MB): peak = 1221.988 ; gain = 416.070
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:27 ; elapsed = 00:00:29 . Memory (MB): peak = 1221.988 ; gain = 416.070
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:27 ; elapsed = 00:00:29 . Memory (MB): peak = 1221.988 ; gain = 416.070
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
| |BlackBox name |Instances |
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px� 
D
%s*synth2,
+------+-------+------+
2default:defaulth px� 
D
%s*synth2,
|      |Cell   |Count |
2default:defaulth px� 
D
%s*synth2,
+------+-------+------+
2default:defaulth px� 
D
%s*synth2,
|1     |CARRY4 |    15|
2default:defaulth px� 
D
%s*synth2,
|2     |LUT1   |     3|
2default:defaulth px� 
D
%s*synth2,
|3     |LUT2   |    13|
2default:defaulth px� 
D
%s*synth2,
|4     |LUT3   |    24|
2default:defaulth px� 
D
%s*synth2,
|5     |LUT4   |    25|
2default:defaulth px� 
D
%s*synth2,
|6     |LUT5   |     9|
2default:defaulth px� 
D
%s*synth2,
|7     |LUT6   |    14|
2default:defaulth px� 
D
%s*synth2,
|8     |MUXF7  |     4|
2default:defaulth px� 
D
%s*synth2,
|9     |FDCE   |    31|
2default:defaulth px� 
D
%s*synth2,
|10    |FDPE   |     2|
2default:defaulth px� 
D
%s*synth2,
|11    |FDRE   |    53|
2default:defaulth px� 
D
%s*synth2,
|12    |BUFGP  |     1|
2default:defaulth px� 
D
%s*synth2,
|13    |IBUF   |    22|
2default:defaulth px� 
D
%s*synth2,
|14    |OBUF   |    28|
2default:defaulth px� 
D
%s*synth2,
|15    |OBUFT  |     8|
2default:defaulth px� 
D
%s*synth2,
+------+-------+------+
2default:defaulth px� 
E
%s
*synth2-

Report Instance Areas: 
2default:defaulth p
x
� 
b
%s
*synth2J
6+------+--------------------+----------------+------+
2default:defaulth p
x
� 
b
%s
*synth2J
6|      |Instance            |Module          |Cells |
2default:defaulth p
x
� 
b
%s
*synth2J
6+------+--------------------+----------------+------+
2default:defaulth p
x
� 
b
%s
*synth2J
6|1     |top                 |                |   252|
2default:defaulth p
x
� 
b
%s
*synth2J
6|2     |  divider           |divider_timing  |    86|
2default:defaulth p
x
� 
b
%s
*synth2J
6|3     |  ee201_debouncer_1 |ee201_debouncer |    67|
2default:defaulth p
x
� 
b
%s
*synth2J
6+------+--------------------+----------------+------+
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:27 ; elapsed = 00:00:29 . Memory (MB): peak = 1221.988 ; gain = 416.070
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
s
%s
*synth2[
GSynthesis finished with 0 errors, 0 critical warnings and 13 warnings.
2default:defaulth p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:00:19 ; elapsed = 00:00:27 . Memory (MB): peak = 1221.988 ; gain = 333.379
2default:defaulth p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:27 ; elapsed = 00:00:30 . Memory (MB): peak = 1221.988 ; gain = 416.070
2default:defaulth p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0032default:default2
1221.9882default:default2
0.0002default:defaultZ17-268h px� 
f
-Analyzing %s Unisim elements for replacement
17*netlist2
202default:defaultZ29-17h px� 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1237.8832default:default2
0.0002default:defaultZ17-268h px� 
�
!Unisim Transformation Summary:
%s111*project2j
V  A total of 1 instances were transformed.
  BUFGP => BUFGP (BUFG, IBUF): 1 instance 
2default:defaultZ1-111h px� 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
332default:default2
602default:default2
02default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:00:332default:default2
00:01:002default:default2
1237.8832default:default2
731.3052default:defaultZ17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1237.8832default:default2
0.0002default:defaultZ17-268h px� 
K
"No constraints selected for write.1103*constraintsZ18-5210h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2�
�C:/Xilinx_projects/ee354l_divider_timing/workspace/divider_timing_part1/divider_timing_part1.runs/synth_1/divider_timing_top.dcp2default:defaultZ17-1381h px� 
�
%s4*runtcl2�
zExecuting : report_utilization -file divider_timing_top_utilization_synth.rpt -pb divider_timing_top_utilization_synth.pb
2default:defaulth px� 
�
Exiting %s at %s...
206*common2
Vivado2default:default2,
Sun Mar 29 21:22:05 20202default:defaultZ17-206h px� 


End Record