onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tbdspscaleandadd/ValDryL
add wave -noupdate /tbdspscaleandadd/ValDryR
add wave -noupdate /tbdspscaleandadd/ValWetL
add wave -noupdate /tbdspscaleandadd/ValWetR
add wave -noupdate -format Analog-Step -height 74 -max 32766.999999999993 -min -32768.0 -radix sfixed /tbdspscaleandadd/DdryL
add wave -noupdate -radix binary /tbdspscaleandadd/DdryL
add wave -noupdate -radix binary /tbdspscaleandadd/DUT/gScaleFactor(1)
add wave -noupdate -format Analog-Step -height 74 -max 536854527.99999988 -min -536870912.0 -radix sfixed /tbdspscaleandadd/DUT/MultD1
add wave -noupdate -radix binary /tbdspscaleandadd/DUT/MultD1
add wave -noupdate -format Analog-Step -height 74 -max 16383.0 -min -16384.0 -radix sfixed /tbdspscaleandadd/DUT/ScaledD1
add wave -noupdate -radix binary /tbdspscaleandadd/DUT/ScaledD1
add wave -noupdate -format Analog-Step -height 74 -max 32766.999999999993 -min -32768.0 -radix sfixed /tbdspscaleandadd/DdryR
add wave -noupdate -radix binary /tbdspscaleandadd/DdryR
add wave -noupdate -radix binary /tbdspscaleandadd/DUT/gScaleFactor(2)
add wave -noupdate -format Analog-Step -height 74 -max 536952828.99999988 -min -536969216.0 -radix sfixed /tbdspscaleandadd/DUT/MultD2
add wave -noupdate -radix binary /tbdspscaleandadd/DUT/MultD2
add wave -noupdate -format Analog-Step -height 74 -max 16385.999999999996 -min -16387.0 -radix sfixed /tbdspscaleandadd/DUT/ScaledD2
add wave -noupdate -radix binary /tbdspscaleandadd/DUT/ScaledD2
add wave -noupdate -format Analog-Step -height 74 -max 32176.0 -min -29236.0 -radix sfixed /tbdspscaleandadd/DwetL
add wave -noupdate -radix binary /tbdspscaleandadd/DwetL
add wave -noupdate -format Analog-Step -height 74 -max 32176.0 -min -29236.0 -radix sfixed -childformat {{/tbdspscaleandadd/DwetR(0) -radix binary} {/tbdspscaleandadd/DwetR(-1) -radix binary} {/tbdspscaleandadd/DwetR(-2) -radix binary} {/tbdspscaleandadd/DwetR(-3) -radix binary} {/tbdspscaleandadd/DwetR(-4) -radix binary} {/tbdspscaleandadd/DwetR(-5) -radix binary} {/tbdspscaleandadd/DwetR(-6) -radix binary} {/tbdspscaleandadd/DwetR(-7) -radix binary} {/tbdspscaleandadd/DwetR(-8) -radix binary} {/tbdspscaleandadd/DwetR(-9) -radix binary} {/tbdspscaleandadd/DwetR(-10) -radix binary} {/tbdspscaleandadd/DwetR(-11) -radix binary} {/tbdspscaleandadd/DwetR(-12) -radix binary} {/tbdspscaleandadd/DwetR(-13) -radix binary} {/tbdspscaleandadd/DwetR(-14) -radix binary} {/tbdspscaleandadd/DwetR(-15) -radix binary}} -subitemconfig {/tbdspscaleandadd/DwetR(0) {-radix binary} /tbdspscaleandadd/DwetR(-1) {-radix binary} /tbdspscaleandadd/DwetR(-2) {-radix binary} /tbdspscaleandadd/DwetR(-3) {-radix binary} /tbdspscaleandadd/DwetR(-4) {-radix binary} /tbdspscaleandadd/DwetR(-5) {-radix binary} /tbdspscaleandadd/DwetR(-6) {-radix binary} /tbdspscaleandadd/DwetR(-7) {-radix binary} /tbdspscaleandadd/DwetR(-8) {-radix binary} /tbdspscaleandadd/DwetR(-9) {-radix binary} /tbdspscaleandadd/DwetR(-10) {-radix binary} /tbdspscaleandadd/DwetR(-11) {-radix binary} /tbdspscaleandadd/DwetR(-12) {-radix binary} /tbdspscaleandadd/DwetR(-13) {-radix binary} /tbdspscaleandadd/DwetR(-14) {-radix binary} /tbdspscaleandadd/DwetR(-15) {-radix binary}} /tbdspscaleandadd/DwetR
add wave -noupdate -radix binary /tbdspscaleandadd/DwetR
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3422586149 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 305
configure wave -valuecolwidth 218
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
WaveRestoreZoom {0 ps} {21 ms}
