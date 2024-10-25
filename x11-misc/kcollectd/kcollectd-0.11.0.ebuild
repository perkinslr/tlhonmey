# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="Kcollectd KDE gui collectd graphing system."
HOMEPAGE="https://gitlab.com/aerusso/kcollectd"
SRC_URI="https://gitlab.com/aerusso/kcollectd/-/archive/v${PV}/kcollectd-v${PV}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/appstream
		net-analyzer/rrdtool
		dev-util/cmake
		kde-frameworks/extra-cmake-modules
		kde-frameworks/kdoctools:5
		kde-frameworks/kconfig:5
		kde-frameworks/kguiaddons:5
		kde-frameworks/kio:5
		kde-frameworks/kxmlgui:5
		kde-frameworks/kiconthemes:5
		kde-frameworks/kwidgetsaddons:5
		kde-frameworks/kdelibs4support:5"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/kcollectd-v${PV}"

src_configure() {
	cmake-utils_src_configure
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}
