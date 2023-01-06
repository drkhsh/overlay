# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit savedconfig toolchain-funcs

DESCRIPTION="a dynamic window manager for X11 (drkhsh fork)"
HOMEPAGE="https://dwm.suckless.org/"

inherit git-r3
EGIT_REPO_URI="git://git.drkhsh.at/dwm.git"
EGIT_BRANCH="drkhsh/next"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="xinerama"

RDEPEND="
	media-libs/fontconfig
	x11-libs/libX11
	>=x11-libs/libXft-2.3.5
	xinerama? ( x11-libs/libXinerama )
"
DEPEND="
	${RDEPEND}
	xinerama? ( x11-base/xorg-proto )
"

src_prepare() {
	default

	sed -i \
		-e "s/ -Os / /" \
		-e "/^\(LDFLAGS\|CFLAGS\|CPPFLAGS\)/{s| = | += |g;s|-s ||g}" \
		-e "/^X11LIB/{s:/usr/X11R6/lib:/usr/$(get_libdir)/X11:}" \
		-e '/^X11INC/{s:/usr/X11R6/include:/usr/include/X11:}' \
		config.mk || die

	restore_config config.h
}

src_compile() {
	if use xinerama; then
		emake CC="$(tc-getCC)" dwm
	else
		emake CC="$(tc-getCC)" XINERAMAFLAGS="" XINERAMALIBS="" dwm
	fi
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install

	dodoc README

	save_config config.h
}
