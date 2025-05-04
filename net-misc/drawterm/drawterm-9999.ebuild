# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit git-r3 toolchain-funcs

DESCRIPTION="9front fork of drawterm"
HOMEPAGE="http://drawterm.9front.org/"
EGIT_REPO_URI="git://git.9front.org/plan9front/drawterm"

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

src_compile() {
	emake CONF=unix
}

src_install() {
	dobin drawterm
	doman drawterm.1
	dodoc README
}
