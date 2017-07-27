# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils games

MY_PN="AssaultCube"
DESCRIPTION="Fast and fun first-person-shooter based on the Cube fps"
HOMEPAGE="http://assault.cubers.net"
SRC_URI="https://github.com/assaultcube/AC/releases/download/v1.2.0.2/AssaultCube_v1.2.0.2.tar.bz2"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="dedicated doc server"

RDEPEND="
	net-libs/enet
	sys-libs/zlib
	net-misc/curl
	!dedicated? (
		media-libs/libsdl[X,opengl,video]
		media-libs/libogg
		media-libs/libvorbis
		media-libs/openal
		media-libs/sdl-image[jpeg,png]
		virtual/opengl
		x11-libs/libX11
	)"

DEPEND="${RDEPEND}
	virtual/pkgconfig"

S=${WORKDIR}/AssaultCube_v${PV}

src_prepare() {
	# patch makefile
	epatch "${FILESDIR}"/${PN}-${PV}-makefile.patch

	# remove unsued stuff
	rm -r bin_unix/* || die
	find packages -name *.txt -delete || die

	# respect fhs and fix binary name
	sed -i \
		-e "/^CUBE_DIR=/d ; 2iCUBE_DIR=$(games_get_libdir)/${PN}" \
		-e "s:bin_unix/\${SYSTEM_NAME}\${MACHINE_NAME}:ac_:" \
		-e "s:cd \${CUBE_DIR}:cd ${GAMES_DATADIR}/${PN}:" \
		${PN}.sh server.sh || die

	# remove bundled enet
	rm -r source/enet || die
}

src_compile() {
	BUNDLED_ENET=NO \
		emake -C source/src \
		$(usex dedicated "" "client") \
		$(usex dedicated "server" "$(usex server "server" "")")
}

src_install() {
	insinto "${GAMES_DATADIR}/${PN}"
	doins -r config packages

	exeinto "$(games_get_libdir)/${PN}"
	if ! use dedicated ; then
		doexe source/src/ac_client
		newgamesbin ${PN}.sh ${PN}
		make_desktop_entry ${PN} ${MY_PN} ${PN}
	fi

	if use dedicated || use server ; then
		doexe source/src/ac_server
		newgamesbin server.sh ${PN}-server
		make_desktop_entry ${PN}-server "${MY_PN} Server" ${PN}
	fi

	if use doc ; then
		rm -r docs/autogen || die
		dohtml -r docs/*
	fi

	prepgamesdirs
}

pkg_preinst() {
	games_pkg_preinst
}

pkg_postinst() {
	games_pkg_postinst
}