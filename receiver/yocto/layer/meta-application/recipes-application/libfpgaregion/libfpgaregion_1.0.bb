DESCRIPTION = "libfpgaregion"
SECTION = "base"
LICENSE = "CLOSED"

SRC_URI = "git://gitlab.fh-ooe.at/smart_systems_lab/debug_service.git;protocol=https;user=gitlab+deploy-token-9:vh-CHWx5PRx8Bu1Sf-4a;branch=master"
SRCREV = "${AUTOREV}"

# static lib => no dependencies
RDEPENDS_${PN}-staticdev = ""
RDEPENDS_${PN}-dev = ""
RDEPENDS_${PN}-dbg = ""

GIT = "${WORKDIR}/git/"
S = "${GIT}/libfpgaregion/"

inherit pkgconfig cmake