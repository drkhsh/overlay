# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs

DESCRIPTION="A fast compositor for X11 (fork of an early Compton / xcompmgr)"
HOMEPAGE="https://github.com/tycho-kirchner/fastcompmgr"
SRC_URI="https://github.com/tycho-kirchner/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	x11-libs/libX11
	x11-libs/libXcomposite
	x11-libs/libXdamage
	x11-libs/libXfixes
	x11-libs/libXrender
"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"

src_compile() {
	emake CC="$(tc-getCC)"
}

src_install() {
	dobin fastcompmgr
	doman fastcompmgr.1
	einstalldocs
}
