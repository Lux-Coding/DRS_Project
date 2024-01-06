onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tbtbdi2spari2s/DUT/iClk
add wave -noupdate /tbtbdi2spari2s/DUT/inResetAsync
add wave -noupdate /tbtbdi2spari2s/DUT/oI2cSclk
add wave -noupdate /tbtbdi2spari2s/DUT/ioI2cSdin
add wave -noupdate /tbtbdi2spari2s/DUT/oMclk
add wave -noupdate /tbtbdi2spari2s/DUT/oBclk
add wave -noupdate /tbtbdi2spari2s/DUT/iADCdat
add wave -noupdate /tbtbdi2spari2s/DUT/oADClrc
add wave -noupdate /tbtbdi2spari2s/DUT/oDACdat
add wave -noupdate /tbtbdi2spari2s/DUT/oDAClrc
add wave -noupdate /tbtbdi2spari2s/DUT/oLed
add wave -noupdate /tbtbdi2spari2s/DUT/Clk48MHz
add wave -noupdate /tbtbdi2spari2s/DUT/Bclk
add wave -noupdate /tbtbdi2spari2s/DUT/Mclk
add wave -noupdate /tbtbdi2spari2s/DUT/ValidL
add wave -noupdate /tbtbdi2spari2s/DUT/ValidR
add wave -noupdate /tbtbdi2spari2s/LeftChannelData
add wave -noupdate /tbtbdi2spari2s/RightChannelData
add wave -noupdate /tbtbdi2spari2s/TestOutput
add wave -noupdate /tbtbdi2spari2s/DUT/ParData
add wave -noupdate /tbtbdi2spari2s/DUT/StrobeI2C
add wave -noupdate /tbtbdi2spari2s/DUT/Start
add wave -noupdate /tbtbdi2spari2s/DUT/Configured
add wave -noupdate /tbtbdi2spari2s/DUT/AckError
add wave -noupdate /tbtbdi2spari2s/DUT/Locked
add wave -noupdate /tbtbdi2spari2s/DUT/ADClrc
add wave -noupdate /tbtbdi2spari2s/DUT/WaitCtr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5999999290 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 285
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
WaveRestoreZoom {5999999050 ps} {5999999896 ps}
