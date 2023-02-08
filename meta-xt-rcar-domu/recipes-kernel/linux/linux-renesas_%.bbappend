FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

RENESAS_BSP_URL = "git://github.com/otyshchenko1/linux.git"

BRANCH = "virtio_devel_next3"
SRCREV = "${AUTOREV}"
LINUX_VERSION = "6.2.0-rc4"

KBUILD_DEFCONFIG_rcar = ""
SRC_URI:append = " \
	file://defconfig \
	file://salvator-generic-domu.dts;subdir=git/arch/${ARCH}/boot/dts/renesas \
"

KERNEL_DEVICETREE:append = " renesas/salvator-generic-domu.dtb"

KERNEL_FEATURES:remove = "cfg/virtio.scc"

# Ignore in-tree defconfig
KBUILD_DEFCONFIG = ""

do_deploy:append() {
    find ${D}/boot -iname "vmlinux*" -exec tar -cJvf ${STAGING_KERNEL_BUILDDIR}/vmlinux.tar.xz {} \;
}

