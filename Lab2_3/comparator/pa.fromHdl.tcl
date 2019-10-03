
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name comparator -dir "/media/paramvir/480A-D8B5/CS220Labs/Lab2_3/comparator/planAhead_run_2" -part xc3s500efg320-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "eight.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {onebit.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {eight.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top eight $srcset
add_files [list {eight.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500efg320-4
