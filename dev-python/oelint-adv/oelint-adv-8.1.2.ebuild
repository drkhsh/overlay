# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1

DESCRIPTION="Advanced oelint"
HOMEPAGE="
	https://github.com/priv-kweihmann/oelint-adv
	https://pypi.org/project/oelint-adv/
"
SRC_URI="
	https://github.com/priv-kweihmann/oelint-adv/archive/refs/tags/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"
S=${WORKDIR}/${P}

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 ~loong ~ppc64 ~riscv x86"

RDEPEND="
	dev-python/anytree[${PYTHON_USEDEP}]
	dev-python/argcomplete[${PYTHON_USEDEP}]
	dev-python/colorama[${PYTHON_USEDEP}]
	dev-python/oelint-parser[${PYTHON_USEDEP}]
	dev-python/oelint-data[${PYTHON_USEDEP}]
	dev-python/urllib3[${PYTHON_USEDEP}]
"
BDEPEND="
	${RDEPEND}
"

DOCS=( README.md docs/constants.md docs/template.md )

distutils_enable_tests pytest
