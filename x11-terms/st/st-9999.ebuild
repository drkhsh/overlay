# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop savedconfig toolchain-funcs git-r3

DESCRIPTION="Simple terminal implementation for X (drkhsh fork)"
HOMEPAGE="https://st.suckless.org/"
EGIT_REPO_URI="https://git.drkhsh.at/${PN}.git"
EGIT_BRANCH="master"

LICENSE="MIT-with-advertising"
KEYWORDS="amd64 ~x86"
SLOT="0"

RDEPEND="
	>=sys-libs/ncurses-6.0:0=
	media-libs/fontconfig
	media-libs/harfbuzz
	x11-libs/libX11
	x11-libs/libXft
"
DEPEND="
	${RDEPEND}
	x11-base/xorg-proto
	media-fonts/fira-code
"
BDEPEND="virtual/pkgconfig"

src_prepare() {
	default

	sed -i \
		-e "/^X11LIB/{s:/usr/X11R6/lib:/usr/$(get_libdir)/X11:}" \
		-e '/^STLDFLAGS/s|= .*|= $(LDFLAGS) $(LIBS)|g' \
		-e '/^X11INC/{s:/usr/X11R6/include:/usr/include/X11:}' \
		config.mk || die
	sed -i \
		-e '/tic/d' \
		Makefile || die

	restore_config config.h
}

src_configure() {
	sed -i \
		-e "s|pkg-config|$(tc-getPKG_CONFIG)|g" \
		config.mk || die

	tc-export CC
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}"/usr install

	dodoc TODO

	# applied desktop entry patch
	#make_desktop_entry ${PN} simpleterm utilities-terminal 'System;TerminalEmulator;' ''

	save_config config.h
}

