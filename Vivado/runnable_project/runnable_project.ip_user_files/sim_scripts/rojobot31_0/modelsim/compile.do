vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/xpm

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap xpm modelsim_lib/msim/xpm

vlog -work xil_defaultlib -64 -incr -sv \
"C:/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -64 -93 \
"C:/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 -incr \
"../../../../ECE540FinalProject.srcs/sources_1/ip/rojobot31_0/src/bot31_if.v" \
"../../../../ECE540FinalProject.srcs/sources_1/ip/rojobot31_0/src/bot31_pgm.v" \
"../../../../ECE540FinalProject.srcs/sources_1/ip/rojobot31_0/src/kcpsm6.v" \
"../../../../ECE540FinalProject.srcs/sources_1/ip/rojobot31_0/src/bot31_top.v" \
"../../../../ECE540FinalProject.srcs/sources_1/ip/rojobot31_0/sim/rojobot31_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

