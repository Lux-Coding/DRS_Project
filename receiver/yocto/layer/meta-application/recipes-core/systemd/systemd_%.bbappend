FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
SRC_URI += "file://timesyncd.conf \
            file://eth0.network"

do_install_append() {
    # Push the custom conf files on target
    install -m 0644 ${WORKDIR}/timesyncd.conf ${D}${sysconfdir}/systemd
    install -m 0644 ${WORKDIR}/eth0.network ${D}${sysconfdir}/systemd/network

    # enable timesyncd service
    install -d ${D}${sysconfdir}/systemd/system/sysinit.target.wants
    ln -sf ${systemd_unitdir}/system/systemd-timesyncd.service \
            ${D}${sysconfdir}/systemd/system/sysinit.target.wants/systemd-timesyncd.service
}