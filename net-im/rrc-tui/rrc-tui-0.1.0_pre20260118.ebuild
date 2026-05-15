# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="TUI client for Reticulum Relay Chat (RRC)"
HOMEPAGE="https://github.com/kc1awv/rrc-tui"

COMMIT="c3edb67479133e23fe5d72d1de56c734be0d120f"
SRC_URI="https://github.com/kc1awv/rrc-tui/archive/${COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64"

RDEPEND="
	>=dev-python/rns-0.9.6[${PYTHON_USEDEP}]
	>=dev-python/textual-7.2.0[${PYTHON_USEDEP}]
	>=dev-python/cbor2-5.6.0[${PYTHON_USEDEP}]
"

S="${WORKDIR}/${PN}-${COMMIT}"

distutils_enable_tests pytest
