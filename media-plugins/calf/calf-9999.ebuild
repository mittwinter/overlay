# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools gnome2-utils multilib

DESCRIPTION="A set of open source instruments and effects for digital audio workstations"
HOMEPAGE="http://calf-studio-gear.org/"

if [[ "${PV}" = "9999" ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/calf-studio-gear/calf.git"
else
	SRC_URI="https://github.com/calf-studio-gear/calf/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="LGPL-2.1"
SLOT="0"
IUSE="jack lash lv2 static-libs experimental"

RDEPEND="dev-libs/atk
	dev-libs/expat
	dev-libs/glib:2
	gnome-base/libglade:2.0
	media-sound/fluidsynth
	virtual/jack
	x11-libs/cairo
	x11-libs/gdk-pixbuf
	x11-libs/gtk+:2
	x11-libs/pango
	jack? ( virtual/jack )
	lash? ( media-sound/lash )
	lv2? ( media-libs/lv2 )"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare() {
	eautoreconf

	default
}

src_configure() {
	econf \
		--with-lv2-dir="/usr/$(get_libdir)/lv2" \
		$(use_with lash) \
		$(use_with lv2) \
		$(use_enable experimental)
}

pkg_postinst() {
	gnome2_icon_cache_update
}
