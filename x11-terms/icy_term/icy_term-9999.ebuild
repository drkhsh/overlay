# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="A terminal program supporting CP437, PetScii and ViewData for legacy BBS systems"
HOMEPAGE="https://github.com/mkrueger/icy_tools"
EGIT_REPO_URI="https://github.com/mkrueger/icy_tools.git"
EGIT_SUBMODULES=( "*" )

LICENSE="Apache-2.0 MIT"
SLOT="0"
KEYWORDS=""

BDEPEND="
	dev-build/cmake
	virtual/pkgconfig
	dev-lang/rust
"
DEPEND="
	media-libs/alsa-lib
	media-libs/fontconfig
	x11-libs/libxcb
	x11-libs/libX11
	x11-libs/libXcursor
	x11-libs/libXi
	x11-libs/libXrandr
"
RDEPEND="${DEPEND}"

RESTRICT="network-sandbox"

export CARGO_HOME="${WORKDIR}/cargo-home"

src_compile() {
	cargo build --release -p icy_term \
		|| die "cargo build failed"
}

src_install() {
	dobin target/release/icy_term
	dodoc README.md
}
