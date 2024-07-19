# Setting environment
# sh mkdir -p Netlist
# sh mkdir -p Report

# set company {NTUGIEE}
# set designer {Student}

# set search_path      ". /home/raid7_2/course/cvsd/CBDK_IC_Contest/CIC/SynopsysDC/db  $search_path ../ ./"
# set target_library   "slow.db"
# set link_library     "* $target_library dw_foundation.sldb"
# set symbol_library   "tsmc13.sdb generic.sdb"
# set synthetic_library "dw_foundation.sldb"
# set default_schematic_options {-size infinite}


# # Import Design
set DESIGN "IOTDF"

# set hdlin_translate_off_skip_text "TRUE"
# set edifout_netlist_only "TRUE"
# set verilogout_no_tri true

# set hdlin_enable_presto_for_vhdl "TRUE"
# set sh_enable_line_editing true
# set sh_line_editing_mode emacs
# history keep 100
# alias h history

analyze -format sverilog "flist.sv"
elaborate $DESIGN
current_design [get_designs $DESIGN]
link

source -echo -verbose ./IOTDF_DC.sdc

# Compile Design
current_design [get_designs ${DESIGN}]

check_design > Report/check_design.txt
check_timing > Report/check_timing.txt

#set high_fanout_net_threshold 0


uniquify
set_fix_multiple_port_nets -all -buffer_constants [get_designs *]
# set_clock_gating_style -pos integrated
# compile_ultra -retime 
compile -gate_clock
#-gate_clock

# Report Output
current_design [get_designs ${DESIGN}]
report_timing > "./Report/${DESIGN}_syn.timing"
report_area > "./Report/${DESIGN}_syn.area"
report_qor > "./Report/${DESIGN}_syn.qor"
report_clock_gating -gating_elements > "./Report/${DESIGN}_syn.gating_elements"
report_clock_gating -ungated > "./Report/${DESIGN}_syn.ungated"
all_high_fanout -net -threshold 500 > Report/all_high_fanout_greater_than_500.txt
report_net_fanout -verbose -high_fanout > Report/report_net_fanout.txt
# report_constraint -verbose > Report/report_constraint.txt

# Output Design
current_design [get_designs ${DESIGN}]

set bus_inference_style {%s[%d]}
set bus_naming_style {%s[%d]}
set hdlout_internal_busses true
change_names -hierarchy -rule verilog
define_name_rules name_rule -allowed {a-z A-Z 0-9 _} -max_length 255 -type cell
define_name_rules name_rule -allowed {a-z A-Z 0-9 _[]} -max_length 255 -type net
define_name_rules name_rule -map {{"\\*cell\\*" "cell"}}
define_name_rules name_rule -case_insensitive
change_names -hierarchy -rules name_rule

remove_unconnected_ports -blast_buses [get_cells -hierarchical *]
set verilogout_higher_designs_first true
write -format ddc     -hierarchy -output "./Netlist/${DESIGN}_syn.ddc"
write -format verilog -hierarchy -output "./Netlist/${DESIGN}_syn.v"
write_sdf -version 2.1  -context verilog -load_delay cell ./Netlist/${DESIGN}_syn.sdf
write_sdc  ./Netlist/${DESIGN}_syn.sdc -version 1.8


report_timing
report_area
check_design
exit
