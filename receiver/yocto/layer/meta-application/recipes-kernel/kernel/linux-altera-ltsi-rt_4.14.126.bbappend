# Old release branches were deleted from altera-opensource socfpga kernel repository, so fix them and use release tag
KBRANCH="rel_socfpga-4.14.126-ltsi-rt_19.08.02_pr"
SRC_URI = "${KERNEL_REPO};protocol=${KERNEL_PROT};nobranch=1"

require kernel_tweaks.inc
