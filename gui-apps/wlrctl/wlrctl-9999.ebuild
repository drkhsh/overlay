EAPI=8

inherit meson git-r3

DESCRIPTION="wlrctl is a command line utility for miscellaneous wlroots Wayland extensions."
HOMEPAGE="https://git.sr.ht/~brocellous/wlrctl"
EGIT_REPO_URI="https://git.sr.ht/~brocellous/wlrctl"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

S="${WORKDIR}/${P/_/-}"

src_unpack() {
	git-r3_src_unpack
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
