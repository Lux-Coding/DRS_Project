#######################################
# U-Boot bbappend to modifiy settings #
#######################################

# Append ethaddr variable to default environment
# in case UBOOT_ETHADDR is set.
set_ethaddr(){
    return 0;
    if [ -z "${UBOOT_ETHADDR}" ]; then
        return 0;
    fi

    MAC_REGEX="([0-9A-Fa-f]{2}[:]){5}([0-9A-Fa-f]{2})"
    if ! echo ${UBOOT_ETHADDR} | grep -q -E ${MAC_REGEX}; then
      bberror "Invalid MAC given: ${UBOOT_ETHADDR}"
    fi

    CONFIG_FILEPATH=${S}/include/configs/socfpga_common.h
    NEEDLE="BOOTENV"
    NEEDLE_UPDATE="\"ethaddr="    
    REPLACE=${NEEDLE_UPDATE}${UBOOT_ETHADDR}'\\0" \\'
    APPEND='\n\t\BOOTENV'    
    
    if grep -q ${NEEDLE_UPDATE} "$CONFIG_FILEPATH"; then
        CMD="s/${NEEDLE_UPDATE}.*/${REPLACE}/"
    else
        CMD="s/${NEEDLE}/${REPLACE}${APPEND}/"
    fi
    sed -i "$CMD" "$CONFIG_FILEPATH"
}

do_patch_append() {
    bb.build.exec_func("set_ethaddr", d);
}
