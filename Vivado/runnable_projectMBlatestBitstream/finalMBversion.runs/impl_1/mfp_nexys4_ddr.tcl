# 
# Report generation script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config  -ruleid {1}  -id {filemgmt 56-3}  -string {{WARNING: [filemgmt 56-3] IP Repository Path: Could not find the directory 'C:/Desktop/Class/Fall2018/ECE540/ECE540FinalProject/Vivado/ECE540FinalProject.ipdefs/rojobot31_0_0'.}}  -suppress 
set_msg_config  -ruleid {2}  -id {Project 1-19}  -string {{CRITICAL WARNING: [Project 1-19] Could not find the file 'C:/Desktop/Class/Fall2018/ECE540/ECE540FinalProject/Vivado/archive_project_summary.txt'.}}  -suppress 
set_msg_config  -ruleid {3}  -id {IP_Flow 19-2162}  -string {{WARNING: [IP_Flow 19-2162] IP 'rojobot31_0' is locked:
* IP definition 'rojobot31 (1.0)' for IP 'rojobot31_0' (customized with software release 2018.2) was not found in the IP Catalog.
Please select 'Report IP Status' from the 'Tools/Report' menu or run Tcl command 'report_ip_status' for more information.}}  -suppress 
set_msg_config  -ruleid {4}  -id {IP_Flow 19-2248}  -string {{WARNING: [IP_Flow 19-2248] Failed to load user IP repository 'c:/Desktop/Class/Fall2018/ECE540/ECE540FinalProject/Vivado/ECE540FinalProject.ipdefs/rojobot31_0_0'; Can't find the specified path.
If this directory should no longer be in your list of user repositories, go to the IP Settings dialog and remove it.}}  -suppress 
set_msg_config  -ruleid {5}  -id {Synth 8-4445}  -string {{CRITICAL WARNING: [Synth 8-4445] could not open $readmem data file 'ram_b0.txt'; please make sure the file is added to project and has read permission, ignoring [C:/Users/RampantVelcro/Desktop/Class/Fall2018/ECE540/ECE540FinalProject/Vivado/runnable_projectMBlatestBitstream/runnable_project.srcs/sources_1/imports/hdl/system/memories/ram_b0.v:19]}}  -suppress 
set_msg_config  -ruleid {6}  -id {Synth 8-4442}  -string {{CRITICAL WARNING: [Synth 8-4442] BlackBox module clk_wiz_0 has unconnected pin reset}}  -suppress 

start_step init_design
set ACTIVE_STEP init_design
set rc [catch {
  create_msg_db init_design.pb
  set_param board.repoPaths C:/Users/Chelsea/vivado-boards-master/new/board_files
  create_project -in_memory -part xc7a100tcsg324-1
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
  set_property webtalk.parent_dir C:/Users/Chelsea/Documents/GitHub/ECE540FinalProject/Vivado/runnable_projectMBlatestBitstream/finalMBversion.cache/wt [current_project]
  set_property parent.project_path C:/Users/Chelsea/Documents/GitHub/ECE540FinalProject/Vivado/runnable_projectMBlatestBitstream/finalMBversion.xpr [current_project]
  set_property ip_repo_paths C:/../../../../../../../../../../Desktop/Class/Fall2018/ECE540/ECE540FinalProject/Vivado/ECE540FinalProject.ipdefs/rojobot31_0_0 [current_project]
  set_property ip_output_repo C:/Users/Chelsea/Documents/GitHub/ECE540FinalProject/Vivado/runnable_projectMBlatestBitstream/finalMBversion.cache/ip [current_project]
  set_property ip_cache_permissions {read write} [current_project]
  set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
  add_files -quiet C:/Users/Chelsea/Documents/GitHub/ECE540FinalProject/Vivado/runnable_projectMBlatestBitstream/finalMBversion.runs/synth_1/mfp_nexys4_ddr.dcp
  read_ip -quiet C:/Users/Chelsea/Documents/GitHub/ECE540FinalProject/Vivado/runnable_projectMBlatestBitstream/finalMBversion.srcs/sources_1/ip/worldmap_level1/worldmap_level1.xci
  read_ip -quiet C:/Users/Chelsea/Documents/GitHub/ECE540FinalProject/Vivado/runnable_projectMBlatestBitstream/finalMBversion.srcs/sources_1/ip/worldmap_level2/worldmap_level2.xci
  read_ip -quiet C:/Users/Chelsea/Documents/GitHub/ECE540FinalProject/Vivado/runnable_projectMBlatestBitstream/finalMBversion.srcs/sources_1/ip/worldmap_level3/worldmap_level3.xci
  read_ip -quiet C:/Users/Chelsea/Documents/GitHub/ECE540FinalProject/Vivado/runnable_projectMBlatestBitstream/finalMBversion.srcs/sources_1/ip/worldmap_gameover/worldmap_gameover.xci
  read_ip -quiet C:/Users/Chelsea/Documents/GitHub/ECE540FinalProject/Vivado/runnable_projectMBlatestBitstream/finalMBversion.srcs/sources_1/ip/worldmap_debug/worldmap_debug.xci
  read_ip -quiet C:/Users/Chelsea/Documents/GitHub/ECE540FinalProject/Vivado/runnable_projectMBlatestBitstream/finalMBversion.srcs/sources_1/ip/worldmap_youwin/worldmap_youwin.xci
  read_ip -quiet C:/Users/Chelsea/Documents/GitHub/ECE540FinalProject/Vivado/runnable_projectMBlatestBitstream/finalMBversion.srcs/sources_1/ip/worldmap_levelcomplete/worldmap_levelcomplete.xci
  read_ip -quiet C:/Users/Chelsea/Documents/GitHub/ECE540FinalProject/Vivado/runnable_projectMBlatestBitstream/finalMBversion.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xci
  read_xdc C:/Users/Chelsea/Documents/GitHub/ECE540FinalProject/Vivado/runnable_projectMBlatestBitstream/finalMBversion.srcs/constrs_1/imports/constraints/mfp_nexys4_ddr.xdc
  link_design -top mfp_nexys4_ddr -part xc7a100tcsg324-1
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
  unset ACTIVE_STEP 
}

start_step opt_design
set ACTIVE_STEP opt_design
set rc [catch {
  create_msg_db opt_design.pb
  opt_design -directive Explore
  write_checkpoint -force mfp_nexys4_ddr_opt.dcp
  create_report "impl_1_opt_report_drc_0" "report_drc -file mfp_nexys4_ddr_drc_opted.rpt -pb mfp_nexys4_ddr_drc_opted.pb -rpx mfp_nexys4_ddr_drc_opted.rpx"
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
  unset ACTIVE_STEP 
}

start_step place_design
set ACTIVE_STEP place_design
set rc [catch {
  create_msg_db place_design.pb
  if { [llength [get_debug_cores -quiet] ] > 0 }  { 
    implement_debug_core 
  } 
  place_design 
  write_checkpoint -force mfp_nexys4_ddr_placed.dcp
  create_report "impl_1_place_report_io_0" "report_io -file mfp_nexys4_ddr_io_placed.rpt"
  create_report "impl_1_place_report_utilization_0" "report_utilization -file mfp_nexys4_ddr_utilization_placed.rpt -pb mfp_nexys4_ddr_utilization_placed.pb"
  create_report "impl_1_place_report_control_sets_0" "report_control_sets -verbose -file mfp_nexys4_ddr_control_sets_placed.rpt"
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
  unset ACTIVE_STEP 
}

start_step phys_opt_design
set ACTIVE_STEP phys_opt_design
set rc [catch {
  create_msg_db phys_opt_design.pb
  phys_opt_design -directive AggressiveFanoutOpt
  write_checkpoint -force mfp_nexys4_ddr_physopt.dcp
  close_msg_db -file phys_opt_design.pb
} RESULT]
if {$rc} {
  step_failed phys_opt_design
  return -code error $RESULT
} else {
  end_step phys_opt_design
  unset ACTIVE_STEP 
}

  set_msg_config -source 4 -id {Route 35-39} -severity "critical warning" -new_severity warning
start_step route_design
set ACTIVE_STEP route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force mfp_nexys4_ddr_routed.dcp
  create_report "impl_1_route_report_drc_0" "report_drc -file mfp_nexys4_ddr_drc_routed.rpt -pb mfp_nexys4_ddr_drc_routed.pb -rpx mfp_nexys4_ddr_drc_routed.rpx"
  create_report "impl_1_route_report_methodology_0" "report_methodology -file mfp_nexys4_ddr_methodology_drc_routed.rpt -pb mfp_nexys4_ddr_methodology_drc_routed.pb -rpx mfp_nexys4_ddr_methodology_drc_routed.rpx"
  create_report "impl_1_route_report_power_0" "report_power -file mfp_nexys4_ddr_power_routed.rpt -pb mfp_nexys4_ddr_power_summary_routed.pb -rpx mfp_nexys4_ddr_power_routed.rpx"
  create_report "impl_1_route_report_route_status_0" "report_route_status -file mfp_nexys4_ddr_route_status.rpt -pb mfp_nexys4_ddr_route_status.pb"
  create_report "impl_1_route_report_timing_summary_0" "report_timing_summary -max_paths 10 -file mfp_nexys4_ddr_timing_summary_routed.rpt -pb mfp_nexys4_ddr_timing_summary_routed.pb -rpx mfp_nexys4_ddr_timing_summary_routed.rpx"
  create_report "impl_1_route_report_incremental_reuse_0" "report_incremental_reuse -file mfp_nexys4_ddr_incremental_reuse_routed.rpt"
  create_report "impl_1_route_report_clock_utilization_0" "report_clock_utilization -file mfp_nexys4_ddr_clock_utilization_routed.rpt"
  create_report "impl_1_route_report_bus_skew_0" "report_bus_skew -warn_on_violation -file mfp_nexys4_ddr_bus_skew_routed.rpt -pb mfp_nexys4_ddr_bus_skew_routed.pb -rpx mfp_nexys4_ddr_bus_skew_routed.rpx"
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  write_checkpoint -force mfp_nexys4_ddr_routed_error.dcp
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
  unset ACTIVE_STEP 
}

start_step post_route_phys_opt_design
set ACTIVE_STEP post_route_phys_opt_design
set rc [catch {
  create_msg_db post_route_phys_opt_design.pb
  phys_opt_design 
  write_checkpoint -force mfp_nexys4_ddr_postroute_physopt.dcp
  create_report "impl_1_post_route_phys_opt_report_timing_summary_0" "report_timing_summary -max_paths 10 -warn_on_violation -file mfp_nexys4_ddr_timing_summary_postroute_physopted.rpt -pb mfp_nexys4_ddr_timing_summary_postroute_physopted.pb -rpx mfp_nexys4_ddr_timing_summary_postroute_physopted.rpx"
  create_report "impl_1_post_route_phys_opt_report_bus_skew_0" "report_bus_skew -warn_on_violation -file mfp_nexys4_ddr_bus_skew_postroute_physopted.rpt -pb mfp_nexys4_ddr_bus_skew_postroute_physopted.pb -rpx mfp_nexys4_ddr_bus_skew_postroute_physopted.rpx"
  close_msg_db -file post_route_phys_opt_design.pb
} RESULT]
if {$rc} {
  step_failed post_route_phys_opt_design
  return -code error $RESULT
} else {
  end_step post_route_phys_opt_design
  unset ACTIVE_STEP 
}

start_step write_bitstream
set ACTIVE_STEP write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
  catch { write_mem_info -force mfp_nexys4_ddr.mmi }
  write_bitstream -force mfp_nexys4_ddr.bit 
  catch {write_debug_probes -quiet -force mfp_nexys4_ddr}
  catch {file copy -force mfp_nexys4_ddr.ltx debug_nets.ltx}
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
  unset ACTIVE_STEP 
}

