vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/xpm

vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm

vlog -work xil_defaultlib  -sv2k12 \
"C:/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 \
"../../../../ECE540FinalProject.srcs/sources_1/ip/rojobot31_0/src/bot31_if.v" \
"../../../../ECE540FinalProject.srcs/sources_1/ip/rojobot31_0/src/bot31_pgm.v" \
"../../../../ECE540FinalProject.srcs/sources_1/ip/rojobot31_0/src/kcpsm6.v" \
"../../../../ECE540FinalProject.srcs/sources_1/ip/rojobot31_0/src/bot31_top.v" \
"../../../../ECE540FinalProject.srcs/sources_1/ip/rojobot31_0/sim/rojobot31_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

