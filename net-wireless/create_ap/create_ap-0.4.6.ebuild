# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="This script creates a NATed or Bridged WiFi Access Point."
HOMEPAGE="https://github.com/oblique/create_ap"
SRC_URI="https://github.com/oblique/create_ap/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="haveged"

DEPEND=""
RDEPEND="
	sys-apps/util-linux
	sys-process/procps
	net-wireless/hostapd
	sys-apps/iproute2
	net-wireless/iw
	net-misc/bridge-utils
	net-dns/dnsmasq
	net-firewall/iptables
	haveged? (
		sys-apps/haveged
	)
"

src_install() {
	dobin create_ap
}
