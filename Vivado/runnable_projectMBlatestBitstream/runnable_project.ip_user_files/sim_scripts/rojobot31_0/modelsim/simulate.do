onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L xil_defaultlib -L xpm -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.rojobot31_0 xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {rojobot31_0.udo}

run -all

quit -force
