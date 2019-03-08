#
# Copyright (C) 2019 Xue Liu <liuxuenetmail@gmail>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=basicstation
PKG_VERSION:=2.0.2
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL=https://github.com/lorabasics/basicstation.git
PKG_SOURCE_DATE:=2019-01-30
PKG_SOURCE_VERSION:=f8417eecd6462c228b2fb1de01dfe1016221b504
PKG_MAINTAINER:=Xue Liu <liuxuenetmail@gmail>
PKG_LICENSE:=BSD

include $(INCLUDE_DIR)/package.mk

define Package/basicstation
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=LoRaWAN
  TITLE:=a LoRaWAN Gateway implementation from Semtech
endef

define Package/basicstation/description
  Basic Station is an implementation of a LoRa packet forwarder,
  which is a program running on the host of a LoRa gateway (with or 
  without GPS), forwarding RF packets received by the 
  concentrator (uplinks) to a LoRaWAN Network Server (LNS) 
  through some secured IP link and transmitting RF packets sent by the 
  LNS (downlinks) through the same secured IP to some device.
endef

define Build/Compile
	$(MAKE) CC=$(TARGET_CC) platform=rpi variant=std -C $(PKG_BUILD_DIR)
endef

define Package/basicstation/install
	$(INSTALL_DIR) $(1)/usr/sbin
endef

$(eval $(call BuildPackage,basicstation))
