# To avoid configure issue with Weston 10 where fbdev is no longer available
EXTRA_OEMESON:append = " \
    ${@oe.utils.conditional('USE_GLES', '1', '', \
    ' -Ddeprecated-backend-fbdev=true', d)}"

EXTRA_OEMESON:remove = " \
    ${@oe.utils.conditional('USE_GLES', '1', '', \
    ' -Dbackend-default="fbdev"', d)}"
