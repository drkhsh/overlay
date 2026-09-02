# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="Fork of IcyTERM with added Reticulum/rnsh transport"
HOMEPAGE="https://github.com/drkhsh/RatTERM"
EGIT_REPO_URI="https://github.com/drkhsh/RatTERM.git"
EGIT_COMMIT="87b9bcdd16c1e7fa53684c5d8436a019ef8499ba"
EGIT_SUBMODULES=( "*" )

LICENSE="Apache-2.0 MIT AGPL-3.0"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="
	dev-build/cmake
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

export CARGO_HOME="${WORKDIR}/cargo-home"


src_compile() {
	# unrar_sys crate uses -stdlib=libc++ which breaks GCC; override it
	CXXFLAGS="${CXXFLAGS} -stdlib=libstdc++" \
		cargo build --release -p icy_term \
		|| die "cargo build failed"
}

src_install() {
	dobin target/release/ratterm
	dodoc README.md
}
