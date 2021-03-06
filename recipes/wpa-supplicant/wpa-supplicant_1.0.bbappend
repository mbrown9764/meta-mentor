PR .= ".2"
FILESEXTRAPATHS_prepend := "${THISDIR}:"
SRC_URI += "file://dso-link-change.patch"

WPA_SUPPLICANT_TLS_LIB ?= "gnutls"
DEPENDS := "${@oe_filter_out('gnutls$', DEPENDS, d)}"
DEPENDS += "${WPA_SUPPLICANT_TLS_LIB}"

do_configure_append () {
    sed -i '/CONFIG_TLS/d' .config
    echo "CONFIG_TLS = ${WPA_SUPPLICANT_TLS_LIB}" >>.config
}
