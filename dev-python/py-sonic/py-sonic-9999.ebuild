# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_SETUPTOOLS=rdepend
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1

DESCRIPTION="A python library to wrap the Subsonic REST API."
HOMEPAGE="https://github.com/crustymonkey/py-sonic"
SRC_URI="https://github.com/crustymonkey/py-sonic/archive/master.zip -> ${P}.zip"

KEYWORDS="~amd64"
LICENSE="BSD"
SLOT="0"

S="${WORKDIR}/${PN}-master"

RDEPEND="
"

DEPEND="
	${RDEPEND}
"

distutils_enable_tests pytest
