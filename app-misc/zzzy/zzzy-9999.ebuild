# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit git-r3 savedconfig toolchain-funcs

DESCRIPTION="simple sleep cycle calculator"
HOMEPAGE="https://git.drkhsh.at/zzzy"
EGIT_REPO_URI="git://git.drkhsh.at/zzzy"

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

src_prepare() {
	default

	sed -i \
		-e "s/CFLAGS = -std=c99 -pedantic -Wall -Wextra -Os/CFLAGS += -std=c99 -pedantic -Wall -Wextra/" \
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
