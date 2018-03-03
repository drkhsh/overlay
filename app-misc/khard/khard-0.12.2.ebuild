# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python3_{3,4,5} )

inherit distutils-r1

DESCRIPTION="console carddav client"
HOMEPAGE="https://github.com/scheibler/khard/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
IUSE="zsh-completion"

KEYWORDS="amd64 ~x86"

RDEPEND="dev-python/vobject[${PYTHON_USEDEP}]
	dev-python/configobj[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/atomicwrites[${PYTHON_USEDEP}]
	dev-python/vdirsyncer[${PYTHON_USEDEP}]
	zsh-completion? ( app-shells/zsh )"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"

DOCS=( AUTHORS CHANGES README.md misc/khard/khard.conf.example )

src_install() {
	distutils-r1_src_install
	if use zsh-completion; then
		insinto /usr/share/zsh/site-functions
		doins misc/zsh/_khard
	fi
}
