# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit git-r3 toolchain-funcs

DESCRIPTION="Pywal-like color palette generator, but faster and in C "
HOMEPAGE="https://github.com/danihek/hellwal"
EGIT_REPO_URI="https://github.com/danihek/hellwal.git"
EGIT_BRANCH="main"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~x86"

src_compile() {
	emake CC="$(tc-getCC)"
}

src_install() {
	emake DESTDIR="${D}" install
}
