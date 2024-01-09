onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tbrxfsk/Clk
add wave -noupdate /tbrxfsk/nResetAsync
add wave -noupdate -format Analog-Step -height 74 -max 32512.0 -min -32512.0 -radix sfixed /tbrxfsk/Channel4B0
add wave -noupdate -format Analog-Step -height 74 -max 32512.0 -min -32512.0 -radix sfixed /tbrxfsk/Channel4B1
add wave -noupdate -format Analog-Step -height 74 -max 32512.0 -min -32512.0 -radix sfixed /tbrxfsk/Channel7B0
add wave -noupdate -format Analog-Step -height 74 -max 32512.0 -min -32512.0 -radix sfixed /tbrxfsk/Channel7B1
add wave -noupdate /tbrxfsk/InputSelect
add wave -noupdate /tbrxfsk/ChannelSelect
add wave -noupdate -format Analog-Step -height 74 -max 32512.0 -min -32512.0 -radix sfixed /tbrxfsk/Input
add wave -noupdate /tbrxfsk/SampleStrobe
add wave -noupdate -radix binary /tbrxfsk/Output
add wave -noupdate -format Analog-Step -height 74 -max 70.0 -radix sfixed /tbrxfsk/TheRxFsk/BandpassResult0
add wave -noupdate -format Analog-Step -height 74 -max 70.0 -radix sfixed /tbrxfsk/TheRxFsk/BandpassResult1
add wave -noupdate /tbrxfsk/TheRxFsk/ValBandpassResult
add wave -noupdate -format Analog-Step -height 74 -max 70.0 -radix sfixed /tbrxfsk/TheRxFsk/Absolute0
add wave -noupdate -format Analog-Step -height 74 -max 70.0 -radix sfixed /tbrxfsk/TheRxFsk/Absolute1
add wave -noupdate -format Analog-Step -height 74 -max 70.0 -radix sfixed /tbrxfsk/TheRxFsk/Substracted
add wave -noupdate -format Analog-Step -height 74 -max 70.0 -radix sfixed /tbrxfsk/TheRxFsk/LowpassResult
add wave -noupdate /tbrxfsk/TheRxFsk/ValLowpassResult
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {23614521559 ps} 0}
quietly wave cursor active 1
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
WaveRestoreZoom {0 ps} {37404391903 ps}
