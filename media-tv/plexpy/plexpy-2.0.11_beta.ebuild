# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"
PYTHON_COMPAT=( python2_7 )
PYTHON_REQ_USE='sqlite(+)'

inherit python-single-r1 systemd versionator

DESCRIPTION="A python based web application for monitoring your Plex Media Server."
HOMEPAGE="https://github.com/drzoidberg33/plexpy"
MY_PV="${PV/_beta/-beta}"
MY_P="${PN}-${MY_PV}"
SRC_URI="https://github.com/drzoidberg33/${PN}/archive/v${MY_PV}.tar.gz -> ${MY_P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-python/pyopenssl
	${DEPEND}
"
DEPEND="
	media-tv/plex-media-server
	${PYTHON_DEPS}
"

S="${WORKDIR}/${MY_P}"

src_install() {
	dodoc API.md CHANGELOG.md CONTRIBUTING.md ISSUE_TEMPLATE.md README.md
	dodir /opt/plexpy/
	cp -R contrib data lib plexpy pylintrc PlexPy.py "${D}/opt/plexpy" || die
	dodir /etc/plexpy
	dosym  /opt/plexpy/config.ini /etc/plexpy/config.ini
	fowners -R plex:plex "/opt/plexpy"

	systemd_dounit  "${FILESDIR}"/plexpy.service
}
