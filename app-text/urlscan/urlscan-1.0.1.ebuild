# Category: net-mail

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{10..11} pypy3 )

inherit distutils-r1

DESCRIPTION="Mutt and terminal url selector (similar to urlview)"
HOMEPAGE="https://github.com/firecat53/urlscan"
SRC_URI="${HOMEPAGE}/archive/${PV}.tar.gz"
DOCS="${PN}.1"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=">=dev-python/urwid-1.2.1[${PYTHON_USEDEP}]"

python_prepare_all() {
   export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}
   distutils-r1_python_prepare_all
}

python_install_all() {
	distutils-r1_python_install_all
}
