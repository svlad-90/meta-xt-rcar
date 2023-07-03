FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

# Use latest commit from poky's master branch which already has a fix for Linux v6.4
SRCREV = "795f5fda1485d447cdbad342e8304be317d4f7e8"

SRC_URI:remove = "file://0001-Disable-installing-header-file-provided-by-another-p.patch"
SRC_URI:append = "file://0002-Disable-installing-header-file-provided-by-another-p.patch"
