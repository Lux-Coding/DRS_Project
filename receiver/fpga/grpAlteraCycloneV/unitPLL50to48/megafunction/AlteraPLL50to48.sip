set_global_assignment -entity "AlteraPLL50to48" -library "lib_AlteraPLL50to48" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "AlteraPLL50to48" -library "lib_AlteraPLL50to48" -name IP_TOOL_VERSION "16.0"
set_global_assignment -entity "AlteraPLL50to48" -library "lib_AlteraPLL50to48" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_AlteraPLL50to48" -name SPD_FILE [file join $::quartus(sip_path) "AlteraPLL50to48.spd"]

set_global_assignment -library "lib_AlteraPLL50to48" -name MISC_FILE [file join $::quartus(sip_path) "AlteraPLL50to48_sim/AlteraPLL50to48.vho"]
