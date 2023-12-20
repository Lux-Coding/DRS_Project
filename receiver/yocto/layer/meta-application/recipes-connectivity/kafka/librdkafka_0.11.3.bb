#
# This file was derived from the 'Hello World!' example recipe in the
# Yocto Project Development Manual.
#

DESCRIPTION = "the Apache Kafka C/C++ client library"
SECTION = "networking"
DEPENDS = ""
LICENSE = "BSD"
LIC_FILES_CHKSUM = "file://LICENSE;md5=6baccb9e4e9e0044093be8d78d0a1087"

DEPENDS += "zlib openssl"


FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-${PV}:"

SRC_URI = "git://github.com/edenhill/librdkafka.git;protocol=https;branch=0.11.x"
SRCREV = "b581d0d9df282847f76e8b9e87337161959d39c9"

S = "${WORKDIR}/git"


inherit pkgconfig


do_configure() {
    # stagin rootfs dir--prefix=${STAGING_DIR_HOST}
    # fix relink to staging dir because of  is unsafe for cross-compilation +sysroot of include /usr/include
    ./configure --target=${TARGET_ARCH} --includedir=${STAGING_INCDIR} --libdir=${STAGING_LIBDIR} --prefix=/usr
}

do_compile() {
    oe_runmake
}

do_install() {
    oe_runmake DESTDIR=${D} includedir=${includedir} libdir=${libdir} install
}
