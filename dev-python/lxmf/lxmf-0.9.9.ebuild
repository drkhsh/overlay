# Copyright 2024-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 pypi

DESCRIPTION="Lightweight Extensible Message Format for Reticulum"
HOMEPAGE="https://github.com/markqvist/LXMF"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64"

RDEPEND="
	>=dev-python/rns-1.0.1[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
