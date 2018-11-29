onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib worldmap_level3_opt

do {wave.do}

view wave
view structure
view signals

do {worldmap_level3.udo}

run -all

quit -force
