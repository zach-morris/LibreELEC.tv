################################################################################
#      This file is part of LibreELEC - http://www.libreelec.tv
#      Copyright (C) 2016- Team LibreELEC
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

PKG_NAME="qemu"
PKG_VERSION="2.7.0"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://wiki.qemu.org"
PKG_URL="http://wiki.qemu-project.org/download/qemu-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_HOST="toolchain Python:host zlib:host glib:host"
PKG_DEPENDS_TARGET="qemu:host"
PKG_SECTION="tools"
PKG_SHORTDESC="QEMU is a generic and open source machine emulator and virtualizer."
PKG_LONGDESC="QEMU is a generic and open source machine emulator and virtualizer."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

HOST_CONFIGURE_OPTS="--prefix=$ROOT/$TOOLCHAIN \
  --bindir=$ROOT/$TOOLCHAIN/bin \
  --sbindir=$ROOT/$TOOLCHAIN/sbin \
  --sysconfdir=$ROOT/$TOOLCHAIN/etc \
  --libexecdir=$ROOT/$TOOLCHAIN/lib \
  --localstatedir=$ROOT/$TOOLCHAIN/var \
  --extra-cflags=-I$ROOT/$TOOLCHAIN/include \
  --extra-ldflags=-L$ROOT/$TOOLCHAIN/lib \
  --static \
  --disable-vnc \
  --disable-werror \
  --disable-blobs \
  --disable-system \
  --disable-docs \
  --disable-gcrypt \
  --target-list=arm-linux-user"

configure_target() {
  :
}

make_target() {
  :
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  $STRIP ../.$HOST_NAME/arm-linux-user/qemu-arm
  cp ../.$HOST_NAME/arm-linux-user/qemu-arm $INSTALL/usr/bin/qemu-arm-static
}
