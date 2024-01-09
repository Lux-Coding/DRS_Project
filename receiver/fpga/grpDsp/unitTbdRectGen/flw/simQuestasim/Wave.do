onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tbtbdrectgen/Clk
add wave -noupdate /tbtbdrectgen/nResetAsync
add wave -noupdate /tbtbdrectgen/Bclk
add wave -noupdate /tbtbdrectgen/ADClrc
add wave -noupdate /tbtbdrectgen/DAClrc
add wave -noupdate /tbtbdrectgen/DACdat
add wave -noupdate /tbtbdrectgen/dut/PllLocked
add wave -noupdate /tbtbdrectgen/dut/StartConfig
add wave -noupdate /tbtbdrectgen/dut/Configured
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 2} {11471141 ps} 1} {{Cursor 3} {34136357 ps} 1} {{Cursor 4} {22762085 ps} 1} {{Cursor 4} {22803749 ps} 1} {{Cursor 5} {22845413 ps} 1}
quietly wave cursor active 5
configure wave -namecolwidth 189
configure wave -valuecolwidth 40
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
WaveRestoreZoom {22233104 ps} {28370662 ps}
