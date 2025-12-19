# Copyright 2024-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 pypi

DESCRIPTION="Lightweight Extensible Message Format for Reticulum"
HOMEPAGE="https://github.com/markqvist/LXMF"
SRC_URI="https://github.com/markqvist/LXMF/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64"

RDEPEND="
	>=dev-python/rns-1.0.1[${PYTHON_USEDEP}]
"

S="${WORKDIR}/LXMF-${PV}"

distutils_enable_tests pytest
