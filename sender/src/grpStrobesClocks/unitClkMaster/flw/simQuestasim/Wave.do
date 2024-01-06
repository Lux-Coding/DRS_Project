onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /tbclkmaster/dut/iclk
add wave -noupdate -format Logic /tbclkmaster/dut/inresetasync
add wave -noupdate -format Logic /tbclkmaster/dut/omclk
add wave -noupdate -format Logic /tbclkmaster/dut/obclk
add wave -noupdate -format Logic /tbclkmaster/dut/olrcout
TreeUpdate [SetDefaultTree]
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
