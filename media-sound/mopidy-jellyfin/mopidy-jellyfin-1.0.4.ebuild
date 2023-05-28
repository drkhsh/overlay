# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_SETUPTOOLS=rdepend
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1

DESCRIPTION="Jellyfin Extension for Mopidy."
HOMEPAGE="https://github.com/jellyfin/mopidy-jellyfin"
SRC_URI="https://github.com/jellyfin/mopidy-jellyfin/archive/v${PV}.tar.gz -> ${P}.tar.gz"

KEYWORDS="~amd64"
LICENSE="Apache-2.0"
SLOT="0"

RDEPEND="
	media-sound/mopidy[${PYTHON_USEDEP}]
	dev-python/pykka[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/unidecode[${PYTHON_USEDEP}]
	dev-python/websocket-client[${PYTHON_USEDEP}]
"

DEPEND="
	${RDEPEND}
"

distutils_enable_tests pytest
