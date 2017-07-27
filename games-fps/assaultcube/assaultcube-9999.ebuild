# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils git-2 games

MY_PN="AssaultCube"
DESCRIPTION="Fast and fun first-person-shooter based on the Cube fps"
HOMEPAGE="http://assault.cubers.net"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

EGIT_REPO_URI="https://github.com/assaultcube/AC"

RDEPEND="
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

src_prepare() {
	# patch makefile
	epatch "${FILESDIR}"/${PN}-g++.patch

	# remove unsued stuff
	rm -r bin_win32/* || die
	find packages -name *.txt -delete || die
}

src_compile() {
	emake -C source/src
}

src_install() {
	insinto "${GAMES_DATADIR}/${PN}"
	doins -r config packages

	exeinto "$(games_get_libdir)/${PN}"
	doexe source/src/ac_client
	newgamesbin "${FILESDIR}"/${PN} ${PN}

	prepgamesdirs
}

pkg_preinst() {
	games_pkg_preinst
}

pkg_postinst() {
	games_pkg_postinst
}
