onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib worldmap_level1_opt

do {wave.do}

view wave
view structure
view signals

do {worldmap_level1.udo}

run -all

quit -force
