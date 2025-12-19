# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
inherit python-single-r1

DESCRIPTION="A simple mesh network communications app powered by the Reticulum Network Stack"
HOMEPAGE="https://github.com/liamcottle/reticulum-meshchat https://meshchat.app"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/liamcottle/reticulum-meshchat.git"
else
	SRC_URI="https://github.com/liamcottle/reticulum-${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm64 ~x86"
	S="${WORKDIR}/reticulum-${PN}-${PV}"
fi

LICENSE="MIT"
SLOT="0"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	${PYTHON_DEPS}
	$(python_gen_cond_dep '
		>=dev-python/rns-1.0.2[${PYTHON_USEDEP}]
		>=dev-python/lxmf-0.9.2[${PYTHON_USEDEP}]
		dev-python/aiohttp[${PYTHON_USEDEP}]
		dev-python/peewee[${PYTHON_USEDEP}]
		dev-python/websockets[${PYTHON_USEDEP}]
		dev-python/pyserial[${PYTHON_USEDEP}]
	')
"
DEPEND="${RDEPEND}"
BDEPEND="net-libs/nodejs"

src_prepare() {
	default
	sed -i '/cx_freeze/d' requirements.txt || die
}

src_compile() {
	npm install --omit=dev || die "npm install failed"
	npm run build-frontend || die "npm build failed"
}

src_install() {
	insinto "/usr/share/${PN}"
	doins -r src/ dist/
	doins meshchat.py database.py package.json

	cat > "${T}/${PN}" <<-EOF
	#!/bin/sh
	cd /usr/share/${PN}
	exec ${PYTHON} meshchat.py "\$@"
	EOF
	dobin "${T}/${PN}"

	dodoc README.md
}

pkg_postinst() {
	elog "Run 'reticulum-meshchat' to start."
	elog "Web UI at http://localhost:8000"
}
