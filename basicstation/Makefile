#
# Copyright (C) 2019 Xue Liu <liuxuenetmail@gmail>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=basicstation
PKG_VERSION:=2.0.3
PKG_REV:=8e115bbb1b75c005f67191884888b2fefbfd8ece
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL=https://github.com/xueliu/basicstation.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_MAINTAINER:=Xue Liu <liuxuenetmail@gmail>
PKG_LICENSE:=BSD

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/basicstation
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=LoRaWAN
  TITLE:=a LoRaWAN Gateway implementation from Semtech
  DEPENDS:=+libloragw +libmbedtls
endef

define Package/basicstation/description
  Basic Station is an implementation of a LoRa packet forwarder,
  which is a program running on the host of a LoRa gateway (with or 
  without GPS), forwarding RF packets received by the 
  concentrator (uplinks) to a LoRaWAN Network Server (LNS) 
  through some secured IP link and transmitting RF packets sent by the 
  LNS (downlinks) through the same secured IP to some device.
endef

# set binary version
CMAKE_OPTIONS += -Dbasicstation_VERSION_SHORT=${PKG_VERSION}
CMAKE_OPTIONS += -Dbasicstation_VERSION=${PKG_VERSION}

define Package/basicstation/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/station-0 $(1)/usr/sbin/station
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/crc32 $(1)/usr/sbin/crc32
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/genkwcrcs $(1)/usr/sbin/genkwcrcs
	$(INSTALL_BIN) ./files/uci2station $(1)/usr/sbin/uci2station

	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/station.init $(1)/etc/init.d/station

	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/station.config $(1)/etc/config/station

	# temporally add a fix configuration file
	$(INSTALL_DIR) $(1)/etc/station
	$(INSTALL_DATA) ./files/station.conf $(1)/etc/station/station.conf
endef

$(eval $(call BuildPackage,basicstation))
