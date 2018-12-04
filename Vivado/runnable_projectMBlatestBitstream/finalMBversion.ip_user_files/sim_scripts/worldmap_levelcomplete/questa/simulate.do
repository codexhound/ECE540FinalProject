onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib worldmap_levelcomplete_opt

do {wave.do}

view wave
view structure
view signals

do {worldmap_levelcomplete.udo}

run -all

quit -force
