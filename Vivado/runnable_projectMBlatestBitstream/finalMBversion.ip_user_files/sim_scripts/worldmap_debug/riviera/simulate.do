onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+worldmap_debug -L xil_defaultlib -L xpm -L blk_mem_gen_v8_4_1 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.worldmap_debug xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {worldmap_debug.udo}

run -all

endsim

quit -force
