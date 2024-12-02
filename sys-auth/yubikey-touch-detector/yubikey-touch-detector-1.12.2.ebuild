# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit go-module systemd
GIT_COMMIT="057c871c18c436c0a01e3c85ccab1a344ff2cd1b"

DESCRIPTION="A tool to detect when your YubiKey is waiting for a touch"
HOMEPAGE="https://github.com/maximbaz/${PN}"

EGO_SUM=(
	"github.com/coreos/go-systemd/v22 v22.5.0"
	"github.com/coreos/go-systemd/v22 v22.5.0/go.mod"
	"github.com/davecgh/go-spew v1.1.0/go.mod"
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/davecgh/go-spew v1.1.1/go.mod"
	"github.com/deckarep/golang-set v1.8.0"
	"github.com/deckarep/golang-set v1.8.0/go.mod"
	"github.com/esiqveland/notify v0.13.3"
	"github.com/esiqveland/notify v0.13.3/go.mod"
	"github.com/godbus/dbus/v5 v5.0.4/go.mod"
	"github.com/godbus/dbus/v5 v5.1.0"
	"github.com/godbus/dbus/v5 v5.1.0/go.mod"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/pmezard/go-difflib v1.0.0/go.mod"
	"github.com/proglottis/gpgme v0.1.4"
	"github.com/proglottis/gpgme v0.1.4/go.mod"
	"github.com/rjeczalik/notify v0.9.3"
	"github.com/rjeczalik/notify v0.9.3/go.mod"
	"github.com/scylladb/go-set v1.0.2"
	"github.com/scylladb/go-set v1.0.2/go.mod"
	"github.com/sirupsen/logrus v1.9.3"
	"github.com/sirupsen/logrus v1.9.3/go.mod"
	"github.com/stretchr/objx v0.1.0/go.mod"
	"github.com/stretchr/objx v0.4.0/go.mod"
	"github.com/stretchr/objx v0.5.0/go.mod"
	"github.com/stretchr/testify v1.7.0/go.mod"
	"github.com/stretchr/testify v1.7.1/go.mod"
	"github.com/stretchr/testify v1.8.0/go.mod"
	"github.com/stretchr/testify v1.8.4"
	"github.com/stretchr/testify v1.8.4/go.mod"
	"github.com/vtolstov/go-ioctl v0.0.0-20151206205506-6be9cced4810"
	"github.com/vtolstov/go-ioctl v0.0.0-20151206205506-6be9cced4810/go.mod"
	"golang.org/x/sys v0.0.0-20180926160741-c2ed4eda69e7/go.mod"
	"golang.org/x/sys v0.0.0-20220715151400-c0bba94af5f8/go.mod"
	"golang.org/x/sys v0.27.0"
	"golang.org/x/sys v0.27.0/go.mod"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
	"gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c/go.mod"
	"gopkg.in/yaml.v3 v3.0.1"
	"gopkg.in/yaml.v3 v3.0.1/go.mod"
)

go-module_set_globals
SRC_URI="https://github.com/maximbaz/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz ${EGO_SUM_SRC_URI}"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"
DOCS=(LICENSE README.md)

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=">=dev-lang/go-1.16"

S="${WORKDIR}/${P}"

src_compile() {
	go build -v -work -o "${PN}" || die
}

# Make sure portage handle files installation, instead of calling "make install"
# automatically, as it would install in:
# - $(LIB_DIR)/systemd/user
# - $(SHARE_DIR)/licenses
# - $(SHARE_DIR)/doc
src_install() {
	dobin ${PN}
	einstalldocs
}
