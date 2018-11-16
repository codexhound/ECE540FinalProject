vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/xpm

vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap xpm questa_lib/msim/xpm

vlog -work xil_defaultlib -64 -sv \
"C:/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -64 -93 \
"C:/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 \
"../../../../ECE540FinalProject.srcs/sources_1/ip/rojobot31_0/src/bot31_if.v" \
"../../../../ECE540FinalProject.srcs/sources_1/ip/rojobot31_0/src/bot31_pgm.v" \
"../../../../ECE540FinalProject.srcs/sources_1/ip/rojobot31_0/src/kcpsm6.v" \
"../../../../ECE540FinalProject.srcs/sources_1/ip/rojobot31_0/src/bot31_top.v" \
"../../../../ECE540FinalProject.srcs/sources_1/ip/rojobot31_0/sim/rojobot31_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

