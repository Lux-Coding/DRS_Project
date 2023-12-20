DESCRIPTION = "Helper tools for Windows SDK"
LICENSE = "CLOSED"

FILESEXTRAPATHS_prepend := "${THISDIR}/files/:"

SRC_URI = "file://rm.exe \
		file://msys-intl-8.dll \
		file://msys-iconv-2.dll \
		file://msys-2.0.dll \
		"

S = "${WORKDIR}"

BBCLASSEXTEND = "nativesdk"

do_install() {
  install -d ${D}${bindir}
  install -m 0755 ${WORKDIR}/rm.exe ${D}${bindir}
  install -m 0755 ${WORKDIR}/msys-intl-8.dll ${D}${bindir}
  install -m 0755 ${WORKDIR}/msys-iconv-2.dll ${D}${bindir}
  install -m 0755 ${WORKDIR}/msys-2.0.dll ${D}${bindir}
}