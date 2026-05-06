# Copyright 2024-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Off-grid, resilient mesh communication with strong encryption"
HOMEPAGE="https://unsigned.io/nomadnet/ https://github.com/markqvist/NomadNet"
SRC_URI="https://github.com/markqvist/NomadNet/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64"

RDEPEND="
	>=dev-python/rns-1.2.2[${PYTHON_USEDEP}]
	>=dev-python/lxmf-0.9.6[${PYTHON_USEDEP}]
	>=dev-python/urwid-2.6.16[${PYTHON_USEDEP}]
	dev-python/qrcode[${PYTHON_USEDEP}]
"

S="${WORKDIR}/NomadNet-${PV}"

distutils_enable_tests pytest
