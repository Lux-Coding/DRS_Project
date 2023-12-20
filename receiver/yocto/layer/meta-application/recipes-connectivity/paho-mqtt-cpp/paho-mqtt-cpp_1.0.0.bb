SUMMARY = "Paho MQTT - CPP libraries for the MQTT and MQTT-SN protocols"
DESCRIPTION = "CPP Lib for MQTT depends on paho c libraries"
HOMEPAGE = "http://www.eclipse.org/paho/"
SECTION = "console/network"
LICENSE = "EPL-1.0 | EDL-1.0"


DEPENDS = "paho-mqtt-c openssl"

LIC_FILES_CHKSUM = " \
        file://edl-v10;md5=3adfcc70f5aeb7a44f3f9b495aa1fbf3 \
        file://epl-v10;md5=659c8e92a40b6df1d9e3dccf5ae45a08 \
"

SRCREV = "16573488fa699ac94d920024736974a2206b794b"
SRC_URI = "git://github.com/eclipse/paho.mqtt.cpp.git;protocol=https"


S = "${WORKDIR}/git"


inherit pkgconfig cmake