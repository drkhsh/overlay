# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1

DESCRIPTION="alternative parser for bitbake recipes"
HOMEPAGE="
	https://github.com/priv-kweihmann/oelint-parser
"
SRC_URI="
	https://github.com/priv-kweihmann/oelint-parser/archive/refs/tags/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"
S=${WORKDIR}/${P}

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 ~loong ~ppc64 ~riscv x86"

RDEPEND="
	dev-python/regex[${PYTHON_USEDEP}]
	dev-python/deprecated[${PYTHON_USEDEP}]
"
BDEPEND="
	${RDEPEND}
"

DOCS=( README.md docs/api-documentation.md )

src_prepare() {
	distutils-r1_src_prepare

	rm -rf tests
}
