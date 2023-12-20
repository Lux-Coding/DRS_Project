# Tweaks for kernel build.

# patch to copy kernelimage when updating
# symlinking is not supported for fat partitions

kernel_do_install() {
    #
    # First install the modules
    #
    unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
    if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
        oe_runmake DEPMOD=echo MODLIB=${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION} INSTALL_FW_PATH=${D}${nonarch_base_libdir}/firmware modules_install
        rm "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
        rm "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source"
        # If the kernel/ directory is empty remove it to prevent QA issues
        rmdir --ignore-fail-on-non-empty "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel"
    else
        bbnote "no modules to install"
    fi

    #
    # Install various kernel output (zImage, map file, config, module support files)
    #
    install -d ${D}/${KERNEL_IMAGEDEST}
    install -d ${D}/boot
    for type in ${KERNEL_IMAGETYPES} ; do
        install -m 0644 ${KERNEL_OUTPUT_DIR}/${type} ${D}/${KERNEL_IMAGEDEST}/${type}-${KERNEL_VERSION}
        # no symlinks on fat boot patitions
        cp -f ${D}/${KERNEL_IMAGEDEST}/${type}-${KERNEL_VERSION} ${D}/${KERNEL_IMAGEDEST}/${type}
    done
    install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION}
    install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
    install -m 0644 vmlinux ${D}/boot/vmlinux-${KERNEL_VERSION}
    [ -e Module.symvers ] && install -m 0644 Module.symvers ${D}/boot/Module.symvers-${KERNEL_VERSION}
    install -d ${D}${sysconfdir}/modules-load.d
    install -d ${D}${sysconfdir}/modprobe.d
}
do_install[prefuncs] += "package_get_auto_pr"


# config kernel
FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "file://leds.cfg"
SRC_URI += "file://keys.cfg"
#SRC_URI += "file://autofs.cfg"
SRC_URI += "file://cpufreq.cfg"
SRC_URI += "file://alteravip.cfg"

# add custom dts
SRC_URI += "file://socfpga_cyclone5_de1_soc.dts"

unpack_extra(){
    cp ${WORKDIR}/socfpga_cyclone5_de1_soc.dts ${WORKDIR}/git/arch/arm/boot/dts/socfpga_cyclone5_de1_soc.dts
}

do_unpack[postfuncs] += "unpack_extra"
