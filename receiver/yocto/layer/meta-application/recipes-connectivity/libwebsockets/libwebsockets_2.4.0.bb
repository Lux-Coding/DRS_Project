SUMMARY = "Canonical libwebsockets.org websocket library"
HOMEPAGE = "https://libwebsockets.org/"
LICENSE = "LGPL-2.1"
LIC_FILES_CHKSUM = "file://LICENSE;md5=b415f60bd65e057120037bb15cad7139"

DEPENDS = "zlib"


FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-${PV}:"  

SRC_URI = "https://github.com/warmcat/libwebsockets/archive/v${PV}.tar.gz"

SRC_URI += "file://unused.patch" 


SRC_URI[md5sum] = "2bcd5ceccca6c057629c46ab380cf2ac"
SRC_URI[sha256sum] = "0dc355c1f9a660b98667cc616fa4c4fe08dacdaeff2d5cc9f74e49e9d4af2d95"

inherit cmake pkgconfig

PACKAGECONFIG ?= "libuv client server http2 ssl"
PACKAGECONFIG[client] = "-DLWS_WITHOUT_CLIENT=OFF,-DLWS_WITHOUT_CLIENT=ON,"
PACKAGECONFIG[http2] = "-DLWS_WITH_HTTP2=ON,-DLWS_WITH_HTTP2=OFF,"
PACKAGECONFIG[ipv6] = "-DLWS_IPV6=ON,-DLWS_IPV6=OFF,"
PACKAGECONFIG[libev] = "-DLWS_WITH_LIBEV=ON,-DLWS_WITH_LIBEV=OFF,libev"
PACKAGECONFIG[libuv] = "-DLWS_WITH_LIBUV=ON,-DLWS_WITH_LIBUV=OFF,libuv"
PACKAGECONFIG[server] = "-DLWS_WITHOUT_SERVER=OFF,-DLWS_WITHOUT_SERVER=ON,"
PACKAGECONFIG[ssl] = "-DLWS_WITH_SSL=ON,-DLWS_WITH_SSL=OFF,openssl"
PACKAGECONFIG[testapps] = "-DLWS_WITHOUT_TESTAPPS=OFF,-DLWS_WITHOUT_TESTAPPS=ON,"

PACKAGES =+ "${PN}-testapps"

FILES_${PN}-dev += "${libdir}/cmake"
FILES_${PN}-testapps += "${datadir}/libwebsockets-test-server/*"
