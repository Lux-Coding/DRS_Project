SUMMARY = "Local debug interface webapplication using ngnix"
LICENSE = "CLOSED"

DEPENDS = "nginx"
RDEPENDS_${PN} = "nginx"

SRC_URI = "git://gitlab.fh-ooe.at/smart_systems_lab/debug_if.git;protocol=https;user=gitlab+deploy-token-4:S9BosPfxPpq3HLctEqHz;branch=master"

SRCREV = "${AUTOREV}"

SRC_URI += "file://debugif"

S = "${WORKDIR}/git/build"

do_install() {
    #install necessary directories
    install -d ${D}${sysconfdir}/nginx/sites-available
    install -d ${D}${sysconfdir}/nginx/sites-enabled

    # add siteconfig
    install -m 644 ${WORKDIR}/debugif ${D}${sysconfdir}/nginx/sites-available
    ln -s -r ${D}${sysconfdir}/nginx/sites-available/debugif ${D}${sysconfdir}/nginx/sites-enabled/debugif

    # unlink default server to prevent error duplicate default server
    rm -f ${D}${sysconfdir}/nginx/sites-enabled/default_server

    # copy website
    mkdir -p ${D}${localstatedir}/www/debugif
    install -d ${D}${localstatedir}/www/debugif
    cp -r ${S}/. ${D}${localstatedir}/www/debugif
}
