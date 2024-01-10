onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tbconfigurecodecviai2c/DUT/iClk
add wave -noupdate /tbconfigurecodecviai2c/DUT/inResetAsync
add wave -noupdate /tbconfigurecodecviai2c/DUT/iStrobeI2C
add wave -noupdate /tbconfigurecodecviai2c/DUT/iStart
add wave -noupdate /tbconfigurecodecviai2c/DUT/oConfigured
add wave -noupdate /tbconfigurecodecviai2c/DUT/oI2cSclk
add wave -noupdate /tbconfigurecodecviai2c/DUT/ioI2cSdin
add wave -noupdate -expand /tbconfigurecodecviai2c/DUT/R
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Sclk fall 1} {4159109 ps} 1} {{Sclk rise} {5492357 ps} 1} {{Sclk fall 2} {6825605 ps} 1} {{Start sdin fall} {2825861 ps} 1} {{Data Sclk fall} {9492101 ps} 1} {{Data change} {9512933 ps} 1} {{Data Sclk rise} {10825349 ps} 1} {{Stop setup begin} {77487749 ps} 1} {{Stop setup end} {78820997 ps} 1} {{Bus free begin} {1649387141 ps} 1} {{Bus free end} {1650720389 ps} 1}
quietly wave cursor active 9
configure wave -namecolwidth 136
configure wave -valuecolwidth 94
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
WaveRestoreZoom {0 ps} {25350126 ps}
