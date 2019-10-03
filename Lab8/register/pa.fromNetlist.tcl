
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name register -dir "/media/paramvir/480A-D8B5/CS220Labs/Lab8/register/planAhead_run_3" -part xc3s500efg320-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "/media/paramvir/480A-D8B5/CS220Labs/Lab8/register/top.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/media/paramvir/480A-D8B5/CS220Labs/Lab8/register} }
set_property target_constrs_file "top.ucf" [current_fileset -constrset]
add_files [list {top.ucf}] -fileset [get_property constrset [current_run]]
link_design
