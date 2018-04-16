# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit flag-o-matic scons-utils toolchain-funcs git-r3

DESCRIPTION="Advanced Digital DJ tool based on Qt"
HOMEPAGE="https://www.mixxx.org/"
SRC_URI="https://github.com/mixxxdj/mixxx/archive/release-2.1.0.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="aac debug doc ffmpeg hid mp3 opus shout usb wavpack"

RDEPEND="
	dev-db/sqlite
	dev-libs/protobuf:0=
	dev-qt/qtcore:4
	dev-qt/qtgui:4
	dev-qt/qtopengl:4
	dev-qt/qtscript:4
	dev-qt/qtsql:4
	dev-qt/qtsvg:4
	media-libs/chromaprint
	media-libs/flac
	media-libs/libid3tag
	media-libs/libogg
	media-libs/libsndfile
	>=media-libs/libsoundtouch-1.5
	media-libs/libvorbis
	>=media-libs/portaudio-19_pre
	media-libs/portmidi
	media-libs/rubberband
	media-libs/taglib
	media-libs/vamp-plugin-sdk
	sci-libs/fftw:3.0=
	usb? ( virtual/libusb:1 )
	virtual/opengl
	x11-libs/libX11
	aac? (
		media-libs/faad2
		media-libs/libmp4v2:0
	)
	hid? ( dev-libs/hidapi )
	mp3? ( media-libs/libmad )
	shout? ( media-libs/libshout )
	wavpack? ( media-sound/wavpack )
	ffmpeg? ( media-video/ffmpeg:0= )
"
DEPEND="
	${RDEPEND}
	virtual/pkgconfig
	dev-qt/qttest:4
	dev-qt/qtxmlpatterns:4
"

PATCHES="
	"${FILESDIR}"/${PN}-2.1.0-dbus.patch
"

src_prepare() {
	# use multilib compatible directory for plugins
	sed -i -e "/unix_lib_path =/s/'lib'/'$(get_libdir)'/" src/SConscript || die

	default
}

src_configure() {
	local myoptimize=0

	# Try to get cpu type based on CFLAGS.
	# Bug #591968
	for i in $(get-flag mcpu) $(get-flag march) ; do
		if [[ ${i} = native ]] ; then
			myoptimize="native"
			break
		fi
	done

	myesconsargs=(
		prefix="${EPREFIX}/usr"
		qtdir="${EPREFIX}/usr/$(get_libdir)/qt4"
		faad="$(usex aac 1 0)"
		ffmpeg="$(usex ffmpeg 1 0)"
		hid="$(usex hid 1 0)"
		bulk="$(usex usb 1 0)"
		mad="$(usex mp3 1 0)"
		opus="$(usex opus 1 0)"
		optimize="${myoptimize}"
		qdebug="$(usex debug 1 0)"
		shoutcast="$(usex shout 1 0)"
		vinylcontrol=1
		battery=0 # disable dbus
		wv="$(usex wavpack 1 0)"
	)
}

src_compile() {
	CC="$(tc-getCC)" CXX="$(tc-getCXX)" LINKFLAGS="${LDFLAGS}" \
	LIBDIR="${EPREFIX}/usr/$(get_libdir)" escons ${myesconsargs[@]}
}

src_install() {
	CC="$(tc-getCC)" CXX="$(tc-getCXX)" LINKFLAGS="${LDFLAGS}" \
	LIBDIR="${EPREFIX}/usr/$(get_libdir)" escons ${myesconsargs[@]} \
		install_root="${ED}"/usr install

	dodoc README Mixxx-Manual.pdf
}
