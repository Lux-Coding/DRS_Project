onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tbtbddspscaleandadd/Clk
add wave -noupdate /tbtbddspscaleandadd/nResetAsync
add wave -noupdate /tbtbddspscaleandadd/Mclk
add wave -noupdate /tbtbddspscaleandadd/Bclk
add wave -noupdate /tbtbddspscaleandadd/ADClrc
add wave -noupdate /tbtbddspscaleandadd/ADCdat
add wave -noupdate -format Analog-Step -height 74 -max 32766.999999999993 -min -32768.0 -radix sfixed -childformat {{/tbtbddspscaleandadd/DUT/Ddry(0) -radix sfixed} {/tbtbddspscaleandadd/DUT/Ddry(-1) -radix sfixed} {/tbtbddspscaleandadd/DUT/Ddry(-2) -radix sfixed} {/tbtbddspscaleandadd/DUT/Ddry(-3) -radix sfixed} {/tbtbddspscaleandadd/DUT/Ddry(-4) -radix sfixed} {/tbtbddspscaleandadd/DUT/Ddry(-5) -radix sfixed} {/tbtbddspscaleandadd/DUT/Ddry(-6) -radix sfixed} {/tbtbddspscaleandadd/DUT/Ddry(-7) -radix sfixed} {/tbtbddspscaleandadd/DUT/Ddry(-8) -radix sfixed} {/tbtbddspscaleandadd/DUT/Ddry(-9) -radix sfixed} {/tbtbddspscaleandadd/DUT/Ddry(-10) -radix sfixed} {/tbtbddspscaleandadd/DUT/Ddry(-11) -radix sfixed} {/tbtbddspscaleandadd/DUT/Ddry(-12) -radix sfixed} {/tbtbddspscaleandadd/DUT/Ddry(-13) -radix sfixed} {/tbtbddspscaleandadd/DUT/Ddry(-14) -radix sfixed} {/tbtbddspscaleandadd/DUT/Ddry(-15) -radix sfixed}} -subitemconfig {/tbtbddspscaleandadd/DUT/Ddry(0) {-height 15 -radix sfixed} /tbtbddspscaleandadd/DUT/Ddry(-1) {-height 15 -radix sfixed} /tbtbddspscaleandadd/DUT/Ddry(-2) {-height 15 -radix sfixed} /tbtbddspscaleandadd/DUT/Ddry(-3) {-height 15 -radix sfixed} /tbtbddspscaleandadd/DUT/Ddry(-4) {-height 15 -radix sfixed} /tbtbddspscaleandadd/DUT/Ddry(-5) {-height 15 -radix sfixed} /tbtbddspscaleandadd/DUT/Ddry(-6) {-height 15 -radix sfixed} /tbtbddspscaleandadd/DUT/Ddry(-7) {-height 15 -radix sfixed} /tbtbddspscaleandadd/DUT/Ddry(-8) {-height 15 -radix sfixed} /tbtbddspscaleandadd/DUT/Ddry(-9) {-height 15 -radix sfixed} /tbtbddspscaleandadd/DUT/Ddry(-10) {-height 15 -radix sfixed} /tbtbddspscaleandadd/DUT/Ddry(-11) {-height 15 -radix sfixed} /tbtbddspscaleandadd/DUT/Ddry(-12) {-height 15 -radix sfixed} /tbtbddspscaleandadd/DUT/Ddry(-13) {-height 15 -radix sfixed} /tbtbddspscaleandadd/DUT/Ddry(-14) {-height 15 -radix sfixed} /tbtbddspscaleandadd/DUT/Ddry(-15) {-height 15 -radix sfixed}} /tbtbddspscaleandadd/DUT/Ddry
add wave -noupdate /tbtbddspscaleandadd/DUT/Ddry
add wave -noupdate /tbtbddspscaleandadd/DUT/ValDryL
add wave -noupdate /tbtbddspscaleandadd/DUT/ValDryR
add wave -noupdate /tbtbddspscaleandadd/cScaleFactor(1)
add wave -noupdate /tbtbddspscaleandadd/cScaleFactor(2)
add wave -noupdate /tbtbddspscaleandadd/DryData
add wave -noupdate /tbtbddspscaleandadd/DryValidL
add wave -noupdate /tbtbddspscaleandadd/DryValidR
add wave -noupdate -format Analog-Step -height 74 -max 32766.999999999993 -min -32768.0 -radix sfixed /tbtbddspscaleandadd/LastDryL
add wave -noupdate /tbtbddspscaleandadd/LastDryL
add wave -noupdate -format Analog-Step -height 74 -max 32766.999999999993 -min -32768.0 -radix sfixed /tbtbddspscaleandadd/LastDryR
add wave -noupdate /tbtbddspscaleandadd/LastDryR
add wave -noupdate -format Analog-Step -height 74 -max 32766.999999999993 -min -32768.0 -radix sfixed /tbtbddspscaleandadd/Dwet
add wave -noupdate /tbtbddspscaleandadd/Dwet
add wave -noupdate /tbtbddspscaleandadd/ValWetL
add wave -noupdate /tbtbddspscaleandadd/ValWetR
add wave -noupdate -format Analog-Step -height 74 -max 32173.999999999996 -min -29233.0 -radix sfixed /tbtbddspscaleandadd/LastDwetL
add wave -noupdate /tbtbddspscaleandadd/LastDwetL
add wave -noupdate -format Analog-Step -height 74 -max 32766.999999999993 -min -32768.0 -radix sfixed /tbtbddspscaleandadd/LastDwetR
add wave -noupdate /tbtbddspscaleandadd/LastDwetR
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1092401957 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 406
configure wave -valuecolwidth 126
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
WaveRestoreZoom {0 ps} {10500 us}
