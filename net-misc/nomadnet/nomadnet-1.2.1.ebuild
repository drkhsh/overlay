# Copyright 2024-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 pypi

DESCRIPTION="Off-grid, resilient mesh communication with strong encryption"
HOMEPAGE="https://unsigned.io/nomadnet/ https://github.com/markqvist/NomadNet"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64"

RDEPEND="
	>=dev-python/rns-1.2.7[${PYTHON_USEDEP}]
	>=dev-python/lxmf-0.9.8[${PYTHON_USEDEP}]
	>=dev-python/urwid-2.6.16[${PYTHON_USEDEP}]
	dev-python/qrcode[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
