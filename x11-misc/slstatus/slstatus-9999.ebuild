# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit git-r3 savedconfig toolchain-funcs

DESCRIPTION="a suckless status monitor for window managers that use WM_NAME (e.g. dwm) or stdin to fill the status bar. "
HOMEPAGE="https://git.drkhsh.at/slstatus"
EGIT_REPO_URI="https://git.drkhsh.at/slstatus"

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

RDEPEND="x11-libs/libX11"
DEPEND="${RDEPEND}"

src_prepare() {
	default

	sed -i \
		-e "s/CFLAGS = -std=c99 -pedantic -Wall -Wextra -Wno-unused -Os/CFLAGS += -std=c99 -pedantic -Wall -Wextra -Wno-unused/" \
		-e "s@/usr/X11R6/include@${EPREFIX}/usr/include/X11@" \
		-e "s@/usr/X11R6/lib@${EPREFIX}/usr/lib@" \
		config.mk || die

	restore_config config.h
}

src_compile() {
	emake
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install

	dodoc README
}
