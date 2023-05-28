# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_SETUPTOOLS=rdepend
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1

DESCRIPTION="MPD Extension for Mopidy."
HOMEPAGE="https://mopidy.com/ext/mpd/"
SRC_URI="https://github.com/mopidy/mopidy-mpd/archive/master.zip -> ${P}.zip"

KEYWORDS="~amd64"
LICENSE="BSD"
SLOT="0"

S="${WORKDIR}/${PN}-master"

RDEPEND="
	media-sound/mopidy[${PYTHON_USEDEP}]
"

DEPEND="
	${RDEPEND}
"

distutils_enable_tests pytest
