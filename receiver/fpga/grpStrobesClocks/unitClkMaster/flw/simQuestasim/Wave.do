onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tbclkmaster/DUT/iClk
add wave -noupdate /tbclkmaster/DUT/inResetAsync
add wave -noupdate /tbclkmaster/DUT/oMclk
add wave -noupdate /tbclkmaster/DUT/oBclk
add wave -noupdate /tbclkmaster/DUT/oADClrc
add wave -noupdate /tbclkmaster/DUT/BitCounter
add wave -noupdate /tbclkmaster/DUT/ClkCounter
add wave -noupdate /tbclkmaster/DUT/BMclk
add wave -noupdate /tbclkmaster/DUT/ADClrc
add wave -noupdate /tbclkmaster/DUT/cDivideBy
add wave -noupdate /tbclkmaster/DUT/cClkCycPerHalfDivdClkPeriod
add wave -noupdate /tbclkmaster/DUT/cClkCounterBinDigitCount
add wave -noupdate /tbclkmaster/DUT/cBitsPerStereosample
add wave -noupdate /tbclkmaster/DUT/cBitsPerChannel
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {iClkStart {153 ns} 1} {iClkEnd {173 ns} 1 default Blue} {BMclkStart {173 ns} 1 Blue default} {BMClkEnd {253 ns} 1 Blue Blue} {ADClrcStart {11013 ns} 1 default Cyan} {ADClrcEnd {32773 ns} 1 default Cyan}
quietly wave cursor active 6
configure wave -namecolwidth 313
configure wave -valuecolwidth 198
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 500
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits us
update
WaveRestoreZoom {0 ns} {35023 ns}
