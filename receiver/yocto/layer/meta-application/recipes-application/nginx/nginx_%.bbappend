# set config to use files folder
FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

# different name because ngnix.bb modifies content
SRC_URI += "file://nginxcustom.conf"


do_install_append() {
    install -d ${D}${sysconfdir}/nginx/sites-available
    install -d ${D}${sysconfdir}/nginx/sites-enabled

    #replace ngnix.conf
   install -m 644 ${WORKDIR}/nginxcustom.conf ${D}${sysconfdir}/nginx/nginx.conf
}
