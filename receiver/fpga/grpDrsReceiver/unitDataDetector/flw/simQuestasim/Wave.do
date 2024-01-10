onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tbdatadetector/Clk
add wave -noupdate /tbdatadetector/nReset
add wave -noupdate /tbdatadetector/DataIn
add wave -noupdate /tbdatadetector/DistanceSelect
add wave -noupdate /tbdatadetector/ByteDetected
add wave -noupdate /tbdatadetector/cClkFrequency
add wave -noupdate /tbdatadetector/cBaudRate
add wave -noupdate /tbdatadetector/cCyclesPerBit
add wave -noupdate /tbdatadetector/cDetectData
add wave -noupdate /tbdatadetector/datadetector_inst/R
add wave -noupdate /tbdatadetector/datadetector_inst/NextR
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
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
WaveRestoreZoom {0 ps} {1 ns}
