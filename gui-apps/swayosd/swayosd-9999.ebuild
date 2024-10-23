EAPI=8

inherit meson git-r3 cargo

DESCRIPTION="A GTK based on screen display for keyboard shortcuts like caps-lock and volume."
HOMEPAGE="https://github.com/ErikReider/SwayOSD"
EGIT_REPO_URI="https://github.com/ErikReider/SwayOSD.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="sys-apps/systemd gui-libs/gtk gui-libs/gtk-layer-shell dev-libs/libinput"
DEPEND="${RDEPEND} virtual/rust dev-lang/sassc"

S="${WORKDIR}/${P/_/-}"

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}

src_prepare() {
	default
}

src_configure() {
	meson_src_configure
}

src_compile() {
	meson_src_compile
}

src_install() {
	meson_src_install
}
