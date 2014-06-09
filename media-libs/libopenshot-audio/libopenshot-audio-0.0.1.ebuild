# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils bzr

DESCRIPTION="An audio library that is a companion to libopenshot. It includes the JUCE library for audio processing."
HOMEPAGE="http://openshot.org/"
EBZR_REPO_URI="lp:~openshot.code/libopenshot/libopenshot-audio"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="x86 amd64"

RDEPEND="
	x11-libs/libX11
"
DEPEND="
	${RDEPEND}
"