#**************************************************************
# Altera DE1-SoC SDC settings
# Users are recommended to modify this file to match users logic.
#**************************************************************

#**************************************************************
# Create Clock
#**************************************************************
create_clock -period 20 [get_ports CLOCK_50]

create_clock -name "HPS_I2C1_SCLK" -period 2500ns [get_ports {HPS_I2C1_SCLK}] -waveform {0.000ns 1250.000ns}
create_clock -name "HPS_I2C2_SCLK" -period 2500ns [get_ports {HPS_I2C2_SCLK}] -waveform {0.000ns 1250.000ns}
create_clock -name "HPS_USB_CLKOUT" -period 16ns [get_ports {HPS_USB_CLKOUT}] -waveform {0.000ns 8.000ns}


#**************************************************************
# Create Generated Clock
#**************************************************************
derive_pll_clocks


#**************************************************************
# Set Clock Latency
#**************************************************************


#**************************************************************
# Set Clock Uncertainty
#**************************************************************
derive_clock_uncertainty


#**************************************************************
# Set Input Delay
#**************************************************************


#**************************************************************
# Set Output Delay
#**************************************************************


#**************************************************************
# Set Clock Groups
#**************************************************************


#**************************************************************
# Set False Path
#**************************************************************
set_false_path -to [get_keepers -no_case {Sync:*|Metastable[0]}]


#**************************************************************
# Set Multicycle Path
#**************************************************************


#**************************************************************
# Set Maximum Delay
#**************************************************************


#**************************************************************
# Set Minimum Delay
#**************************************************************


#**************************************************************
# Set Input Transition
#**************************************************************


#**************************************************************
# Set Load
#**************************************************************

