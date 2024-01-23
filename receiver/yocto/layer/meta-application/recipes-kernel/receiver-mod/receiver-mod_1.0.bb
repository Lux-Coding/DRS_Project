SUMMARY = "Linux kernel module for fsk receiver"
LICENSE = "CLOSED"

inherit module

SRC_URI = "git://github.com/Lux-Coding/DRS_Project.git;branch=main"

SRCREV = "${AUTOREV}"

S = "${WORKDIR}/git/receiver/kernelmodule"

# The inherit of module.bbclass will automatically name module packages width
# "kernel-module-" prefox as required by the oe-core build envitonment.
