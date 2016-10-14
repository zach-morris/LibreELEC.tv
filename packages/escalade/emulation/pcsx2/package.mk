################################################################################
#      This file is part of LibreELEC - http://www.libreelec.tv
#      Copyright (C) 2016 Team LibreELEC
#
#  LibreELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  LibreELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with LibreELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="pcsx2"
PKG_VERSION="679f334"
PKG_REV="1"
PKG_ARCH="i386"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/dolphin-emu/dolphin"
PKG_URL="https://github.com/PCSX2/pcsx2/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain cmake:host libaio portaudio soundtouch wxWidgets SDL2 glew"
PKG_SECTION="emulation"
PKG_SHORTDESC="PS2 emulator"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

PKG_CMAKE_OPTS_TARGET="-DXDG_STD=TRUE \
		       -DPACKAGE_MODE=TRUE \
		       -DGLSL_API=TRUE \
		       -DREBUILD_SHADER=TRUE \
		       -DDISABLE_ADVANCE_SIMD=TRUE \
		       -DPLUGIN_DIR=/usr/lib/pcsx2 \
		       -DGAMEINDEX_DIR=/usr/share/pcsx2"

post_makeinstall_target() {
  rm -rf $INSTALL/usr/share/applications
  rm -rf $INSTALL/usr/share/pixmaps
  rm -rf $INSTALL/usr/bin/PCSX2-linux.sh
}
