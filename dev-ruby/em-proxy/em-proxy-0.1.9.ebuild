# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby23"
RUBY_FAKEGEM_RECIPE_DOC=""

inherit ruby-fakegem

DESCRIPTION="EventMachine Proxy DSL"
HOMEPAGE="https://github.com/igrigorik/em-proxy"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

ruby_add_rdepend "dev-ruby/eventmachine"
