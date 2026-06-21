# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="A drawing program for ANSI & ASCII art and other text-based art forms"
HOMEPAGE="https://github.com/mkrueger/icy_tools"
EGIT_REPO_URI="https://github.com/mkrueger/icy_tools.git"
EGIT_COMMIT="68d4b4866c6b67bce0ad99d30f449bc8a8c30515"
EGIT_SUBMODULES=( "*" )

LICENSE="Apache-2.0 MIT"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="
	dev-build/cmake
	dev-util/nasm
	virtual/pkgconfig
	|| ( dev-lang/rust dev-lang/rust-bin )
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
IUSE="rav1e-asm"

export CARGO_HOME="${WORKDIR}/cargo-home"

src_compile() {
	local feature_arg=""
	use rav1e-asm && feature_arg="--features rav1e-asm"

	cargo build --release -p icy_draw ${feature_arg} \
		|| die "cargo build failed"
}

src_install() {
	dobin target/release/icy_draw
	dodoc README.md
}