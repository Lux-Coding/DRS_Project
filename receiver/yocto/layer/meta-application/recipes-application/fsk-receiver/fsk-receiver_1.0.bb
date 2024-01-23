SUMMARY="Bitfile to configure FPGA"
LICENSE="CLOSED"
SRC_URI="git://github.com/Lux-Coding/DRS_Project.git;branch=main"
SRCREV="${AUTOREV}"
DEPENDS+="dtc-native"
OUTPUT="${WORKDIR}/git/receiver/fpga/grpAlteraCycloneV/unitHPS/scripts/output"
do_configure(){
dtc -I "dts" -O "dtb" -o ${WORKDIR}/socfpga.dtbo ${OUTPUT}/socfpga.dtso
}
do_install(){
# install necessary directory
install -d -m 0755 ${D}${base_libdir}/firmware/
# add rbf and dtso to firmware folder
install -m 0666 ${OUTPUT}/socfpga.rbf ${D}${base_libdir}/firmware/socfpga.rbf
install -m 0666 ${WORKDIR}/socfpga.dtbo ${D}${base_libdir}/firmware/socfpga.dtbo
}
FILES_${PN}="${base_libdir}/firmware"
