-makelib xcelium_lib/xil_defaultlib -sv \
  "C:/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "C:/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../ECE540FinalProject.srcs/sources_1/ip/rojobot31_0/src/bot31_if.v" \
  "../../../../ECE540FinalProject.srcs/sources_1/ip/rojobot31_0/src/bot31_pgm.v" \
  "../../../../ECE540FinalProject.srcs/sources_1/ip/rojobot31_0/src/kcpsm6.v" \
  "../../../../ECE540FinalProject.srcs/sources_1/ip/rojobot31_0/src/bot31_top.v" \
  "../../../../ECE540FinalProject.srcs/sources_1/ip/rojobot31_0/sim/rojobot31_0.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

