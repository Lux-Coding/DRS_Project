onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /tbtxfsk/clk
add wave -noupdate -format Logic /tbtxfsk/nresetasync
#add wave -noupdate -format Literal /tbtxfsk/ddryl
#add wave -noupdate -format Literal /tbtxfsk/ddryr
add wave -noupdate -format Analog-Step -height 120 -offset 30000.0 -scale 0.002 /tbtxfsk/dwetl
add wave -noupdate -format Analog-Step -height 120 -offset 30000.0 -scale 0.002 /tbtxfsk/dwetr
#add wave -noupdate -format Logic /tbtxfsk/valdryl
#add wave -noupdate -format Logic /tbtxfsk/valdryr
add wave -noupdate -format Logic /tbtxfsk/valwetl
add wave -noupdate -format Logic /tbtxfsk/valwetr
add wave -noupdate -format Logic /tbtxfsk/waveatend
add wave -noupdate -format Logic /tbtxfsk/adclrc
add wave -noupdate -format Logic /tbtxfsk/mclk
add wave -noupdate -format Logic /tbtxfsk/bclk
#add wave -noupdate -format Logic /tbtxfsk/serialdata
#add wave -noupdate -format Logic /tbtxfsk/channelselect
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1458073 ns} 0} {{Cursor 2} {59999948 ns} 0}
configure wave -namecolwidth 234
configure wave -valuecolwidth 77
configure wave -justifyvalue left
configure wave -signalnamewidth 2
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
update
WaveRestoreZoom {0 ns} {63 ms}
