# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python3_{3,4,5} )

inherit distutils-r1

DESCRIPTION="console todo client for caldav"
HOMEPAGE="https://github.com/pimutils/todoman/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
IUSE=""

KEYWORDS="amd64 x86"

RDEPEND="dev-python/configobj[${PYTHON_USEDEP}]
	dev-python/atomicwrites[${PYTHON_USEDEP}]
	dev-python/vdirsyncer[${PYTHON_USEDEP}]
	dev-python/click[${PYTHON_USEDEP}]
	dev-python/click-log[${PYTHON_USEDEP}]
	dev-python/humanize[${PYTHON_USEDEP}]
	dev-python/icalendar[${PYTHON_USEDEP}]
	dev-python/parsedatetime[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/pyxdg[${PYTHON_USEDEP}]
	dev-python/tabulate[${PYTHON_USEDEP}]
	dev-python/urwid[${PYTHON_USEDEP}]"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"

DOCS=( AUTHORS.rst CHANGELOG.rst README.rst todoman.conf.example )

src_install() {
	distutils-r1_src_install
}
