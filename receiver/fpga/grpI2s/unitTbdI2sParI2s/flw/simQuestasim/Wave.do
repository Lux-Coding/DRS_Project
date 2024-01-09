onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tbtbdi2spari2s/Clk
add wave -noupdate /tbtbdi2spari2s/nResetAsync
add wave -noupdate /tbtbdi2spari2s/Bclk
add wave -noupdate /tbtbdi2spari2s/ADClrc
add wave -noupdate /tbtbdi2spari2s/ADCdat
add wave -noupdate /tbtbdi2spari2s/DAClrc
add wave -noupdate /tbtbdi2spari2s/DACdat
add wave -noupdate /tbtbdi2spari2s/DUT/ValL
add wave -noupdate /tbtbdi2spari2s/DUT/ValR
add wave -noupdate /tbtbdi2spari2s/DUT/Start
add wave -noupdate /tbtbdi2spari2s/DUT/PllLocked
add wave -noupdate /tbtbdi2spari2s/DUT/Configured
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {valR {35532101 ps} 1} {DAClrcR {48322949 ps} 1} {valL {46864709 ps} 1} {DAClrcL {46906373 ps} 1} {{Cursor 6} {8197310 ps} 0}
quietly wave cursor active 2
configure wave -namecolwidth 239
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {88407040 ps}
