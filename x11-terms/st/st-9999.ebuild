# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit eutils git-r3 multilib toolchain-funcs

DESCRIPTION="simple terminal implementation for X"
HOMEPAGE="http://st.suckless.org/"
EGIT_REPO_URI="git://git.drkhsh.at/st"

LICENSE="MIT-with-advertising"
SLOT="0"
KEYWORDS="amd64 ~x86 ~hppa"
IUSE=""

RDEPEND="
	>=sys-libs/ncurses-6.0:0=
	media-fonts/inconsolata
	media-libs/fontconfig
	x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXft
"
DEPEND="
	${RDEPEND}
	virtual/pkgconfig
	x11-proto/xextproto
	x11-proto/xproto
"

src_prepare() {
	default

	sed -i \
		-e '/^CFLAGS/s:[[:space:]]-Wall[[:space:]]: :' \
		-e '/^CFLAGS/s:[[:space:]]-O[^[:space:]]*[[:space:]]: :' \
		-e '/^LDFLAGS/{s:[[:space:]]-s[[:space:]]: :}' \
		-e '/^X11INC/{s:/usr/X11R6/include:/usr/include/X11:}' \
		-e "/^X11LIB/{s:/usr/X11R6/lib:/usr/$(get_libdir)/X11:}" \
		config.mk || die
	sed -i \
		-e '/tic/d' \
		Makefile || die

	tc-export CC
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}"/usr install

	dodoc README
}
