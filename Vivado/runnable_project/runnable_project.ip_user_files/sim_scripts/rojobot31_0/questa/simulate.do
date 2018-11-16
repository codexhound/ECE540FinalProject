onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib rojobot31_0_opt

do {wave.do}

view wave
view structure
view signals

do {rojobot31_0.udo}

run -all

quit -force
