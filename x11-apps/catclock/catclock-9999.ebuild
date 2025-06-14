# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit git-r3 toolchain-funcs

DESCRIPTION="catclock for X"
HOMEPAGE="https://github.com/BarkyTheDog/catclock"
EGIT_REPO_URI="https://github.com/BarkyTheDog/catclock"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

PATCHES=(
	"${FILESDIR}"/catclock.patch
)

RDEPEND="x11-libs/libX11
	x11-libs/libXmu
	x11-libs/libXrender
	x11-libs/libXft
	x11-libs/libxkbfile
	x11-libs/libXaw"
DEPEND="${RDEPEND}
	x11-base/xorg-proto"

src_prepare() {
	default
}

src_compile() {
	emake
}

src_install() {
	mv "${S}/xclock" "${S}/catclock"
	dobin "${S}/catclock"
}
