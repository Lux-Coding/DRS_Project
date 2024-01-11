DESCRIPTION = "Drsapp daemon"
SECTION = "base"
LICENSE = "CLOSED"
FILESEXTRAPATHS:prepend := "${THISDIR}/files/:"

SRC_URI = "file://drsapp.service"

SRCREV = "${AUTOREV}"

SYSTEMD_SERVICE:${PN} = "drsapp.service"

inherit systemd

do_install:append() {
    # install service file
    install -d ${D}${systemd_unitdir}/system
    install -c -m 0644 ${WORKDIR}/drsapp.service ${D}${systemd_unitdir}/system
}
FILES:${PN} += "${base_libdir}/systemd/system/drsapp.service"

# As this package is tied to systemd, only build it when we're also building systemd.
python () {
    if not bb.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
        raise bb.parse.SkipPackage("'systemd' not in DISTRO_FEATURES")
}

