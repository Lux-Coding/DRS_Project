# for development ignore signature checks

DEPENDS += "less"
RDEPENDS_${PN} += "less"

pkg_postinst_ontarget_${PN}_append () {
  # fix missing pager symlink
  ln -sf /usr/bin/less /usr/bin/pager
  sed -i 's/deb http/deb [trusted=yes] http/g' /etc/apt/sources.list
}

