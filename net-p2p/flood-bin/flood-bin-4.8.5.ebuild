# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN="${PN/-bin}"

DESCRIPTION="A modern web UI for various torrent clients with a Node.js backend and React frontend."
HOMEPAGE="https://github.com/jesec/flood"

SRC_URI="https://github.com/jesec/flood/releases/download/v${PV}/flood-linux-x64"

RESTRICT="mirror strip bindist"

LICENSE="MIT"
SLOT="0"
KEYWORDS="-* ~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

src_install(){
	cp ${DISTDIR}/flood-linux-x64 flood
	dobin flood
}
