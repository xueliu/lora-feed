#
# Copyright (C) 2019 Xue Liu <liuxuenetmail@gmail>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=basicstation
PKG_VERSION:=2.0.5
PKG_REV:=9bcdf0e12e4568e96011a3910e6d460ec9384f8c
PKG_RELEASE:=$(AUTORELEASE)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL=https://github.com/xueliu/basicstation.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_MAINTAINER:=Xue Liu <liuxuenetmail@gmail>
PKG_LICENSE:=BSD

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/basicstation/Default
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=LoRaWAN
  TITLE:=a LoRaWAN Gateway implementation from Semtech 
  DEPENDS:= +libmbedtls
  PROVIDES:=basicstation
endef

define Package/basicstation-linux
  $(call Package/basicstation/Default)
  TITLE+= (linux)
  VARIANT:=linux
endef

define Package/basicstation-linuxpico
  $(call Package/basicstation/Default)
  TITLE+= (linuxpico)
  VARIANT:=linuxpico
endef

define Package/basicstation-corecell
  $(call Package/basicstation/Default)
  TITLE+= (corecell)
  VARIANT:=corecell
endef

define Package/basicstation/description
  Basic Station is an implementation of a LoRa packet forwarder,
  which is a program running on the host of a LoRa gateway (with or 
  without GPS), forwarding RF packets received by the 
  concentrator (uplinks) to a LoRaWAN Network Server (LNS) 
  through some secured IP link and transmitting RF packets sent by the 
  LNS (downlinks) through the same secured IP to some device.
endef

# set additional CMake options
CMAKE_OPTIONS += -Dbasicstation_VERSION_SHORT=$(PKG_VERSION)
CMAKE_OPTIONS += -Dbasicstation_VERSION_FULL=$(PKG_VERSION)
CMAKE_OPTIONS += -DPLATFORM:STRING=$(VARIANT)

define Package/basicstation-linux/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/station $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/crc32 $(1)/usr/sbin/crc32
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/genkwcrcs $(1)/usr/sbin/genkwcrcs
	$(INSTALL_BIN) ./files/uci2station $(1)/usr/sbin/uci2station
	$(INSTALL_BIN) ./files/reset_sx1301 $(1)/usr/sbin/reset_sx1301

	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/station.init $(1)/etc/init.d/station

	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/station.config $(1)/etc/config/station

	# temporally add a fix configuration file
	$(INSTALL_DIR) $(1)/etc/station
	$(INSTALL_DATA) ./files/station.conf $(1)/etc/station/station.conf
endef

Package/basicstation-linuxpico/install = $(Package/basicstation-linux/install)
Package/basicstation-corecell/install = $(Package/basicstation-linux/install)

$(eval $(call BuildPackage,basicstation-linux))
$(eval $(call BuildPackage,basicstation-linuxpico))
$(eval $(call BuildPackage,basicstation-corecell))
