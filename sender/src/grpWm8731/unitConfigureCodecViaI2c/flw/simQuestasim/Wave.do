onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /tbconfigurecodecviai2c/dut/iclk
add wave -noupdate -format Logic /tbconfigurecodecviai2c/dut/inresetasync
add wave -noupdate -format Logic /tbconfigurecodecviai2c/dut/istrobei2c
add wave -noupdate -format Logic /tbconfigurecodecviai2c/dut/istart
add wave -noupdate -format Logic /tbconfigurecodecviai2c/dut/oconfigured
add wave -noupdate -format Logic /tbconfigurecodecviai2c/dut/oi2csclk
add wave -noupdate -format Logic /tbconfigurecodecviai2c/dut/ioi2csdin
add wave -noupdate -format Literal -expand /tbconfigurecodecviai2c/dut/r
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {520473 ns} 0}
configure wave -namecolwidth 117
configure wave -valuecolwidth 40
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
update
WaveRestoreZoom {459375 ns} {590625 ns}
