PR .= ".1"

do_configure_prepend() {
	# autotools.bbclass only checks ${S}/po
	cp ${STAGING_DATADIR}/gettext/po/Makefile.in.in ${S}/lib/po/
}
