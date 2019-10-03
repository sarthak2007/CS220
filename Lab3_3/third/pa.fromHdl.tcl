
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name third -dir "/media/ssinghal/480A-D8B5/CS220Labs/Lab3_3/third/planAhead_run_1" -part xc3s500efg320-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "final.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {one.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {six.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {four.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {five.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {final.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top final $srcset
add_files [list {final.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500efg320-4
