# Copyright 2024-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 systemd

DESCRIPTION="Self-configuring, encrypted and resilient mesh networking stack for LoRa, packet radio, WiFi and more"
HOMEPAGE="https://reticulum.network/ https://github.com/markqvist/Reticulum"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64"
IUSE="systemd"

RDEPEND="
	acct-user/reticulum
	>=dev-python/cryptography-3.4.7[${PYTHON_USEDEP}]
	>=dev-python/pyserial-3.5[${PYTHON_USEDEP}]
"

S="${WORKDIR}/Reticulum-${PV}"

distutils_enable_tests pytest

src_install() {
	distutils-r1_src_install

	newconfd "${FILESDIR}"/rnsd.confd rnsd
	newinitd "${FILESDIR}"/rnsd.initd rnsd
	use systemd && systemd_dounit "${FILESDIR}"/rnsd.service

	keepdir /etc/reticulum
	keepdir /var/log/reticulum
	fowners reticulum:reticulum /etc/reticulum
	fowners reticulum:reticulum /var/log/reticulum
}
