# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_SETUPTOOLS=rdepend
PYTHON_COMPAT=( python3_{10..12} pypy3 )

DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="A python library to wrap the Subsonic REST API."
HOMEPAGE="https://github.com/firecat53/bitwarden-menu"
SRC_URI="https://github.com/firecat53/bitwarden-menu/archive/main.zip -> ${P}.zip"

KEYWORDS="~amd64"
LICENSE="BSD"
SLOT="0"

S="${WORKDIR}/${PN}-main"

RDEPEND="
	x11-misc/dmenu
	x11-misc/xdotool
	x11-misc/xsel
	dev-python/pynput
	app-admin/bitwarden-cli-bin
"

DEPEND="
	${RDEPEND}
"

distutils_enable_tests pytest
