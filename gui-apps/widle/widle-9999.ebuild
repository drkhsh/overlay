# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit git-r3 toolchain-funcs

DESCRIPTION="https://codeberg.org/sewn/widle"
HOMEPAGE="https://codeberg.org/sewn/widle"
EGIT_REPO_URI="https://codeberg.org/sewn/widle"

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

RDEPEND="dev-libs/wayland dev-libs/wayland-protocols"
DEPEND="${RDEPEND}"

src_prepare() {
	default
}

src_compile() {
	emake
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install

	dodoc README.md
}
