DESCRIPTION = "Precision Time Protocol (PTP) according to IEEE standard 1588 for Linux"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"

# set config to use files folder
FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI = " \
    http://sourceforge.net/projects/linuxptp/files/v${PV}/linuxptp-${PV}.tgz \
    file://0001-Makefile-Allow-CC-and-prefix-to-be-overriden.patch \
    file://drs.cfg \
"

SRC_URI[sha256sum] = "70e38e5d2764e0217443da6f14e8846fe401a472293ac138d8419c07a665447a"

EXTRA_OEMAKE = "ARCH=${TARGET_ARCH} EXTRA_CFLAGS='${CFLAGS}'"

export KBUILD_OUTPUT="${RECIPE_SYSROOT}"

do_install () {
    # install necessary directories
    install -d ${D}/${bindir}
    install -d ${D}${sysconfdir}/linuxptp

    # install binaries
    install -p ${S}/ptp4l  ${D}/${bindir}
    install -p ${S}/pmc  ${D}/${bindir}
    install -p ${S}/phc2sys  ${D}/${bindir}
    install -p ${S}/hwstamp_ctl  ${D}/${bindir}

    # install custom config file => move to application recipe?
    install -m 644 ${WORKDIR}/drs.cfg ${D}${sysconfdir}/linuxptp
}
