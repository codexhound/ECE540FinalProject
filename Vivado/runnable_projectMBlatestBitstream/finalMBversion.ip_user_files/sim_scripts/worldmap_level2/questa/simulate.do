onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib worldmap_level2_opt

do {wave.do}

view wave
view structure
view signals

do {worldmap_level2.udo}

run -all

quit -force
