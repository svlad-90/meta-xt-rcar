FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

RENESAS_BSP_URL = "git://github.com/torvalds/linux.git"

BRANCH = "master"
SRCREV = "6995e2de6891c724bfeb2db33d7b87775f913ad1"
LINUX_VERSION = "6.4.0"

KBUILD_DEFCONFIG_rcar = ""
SRC_URI:append = " \
	file://defconfig \
	file://salvator-generic-domu.dts;subdir=git/arch/${ARCH}/boot/dts/renesas \
	file://0001-WIP-Use-INVALID_BACKEND_DOMID-for-the-untraslated-de.patch \
	file://0002-DEBUG-Print-retrieved-stream-ID-backend_domid-for-bo.patch \
"

KERNEL_DEVICETREE:append = " renesas/salvator-generic-domu.dtb"
KERNEL_DEVICETREE:r8a7795:remove = " renesas/r8a77950-salvator-x.dtb"

KERNEL_FEATURES:remove = "cfg/virtio.scc"

# Ignore in-tree defconfig
KBUILD_DEFCONFIG = ""

do_deploy:append() {
    find ${D}/boot -iname "vmlinux*" -exec tar -cJvf ${STAGING_KERNEL_BUILDDIR}/vmlinux.tar.xz {} \;
}

