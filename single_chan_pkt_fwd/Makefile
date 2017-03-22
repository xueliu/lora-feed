#
# Copyright (C) 2017 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=single_chan_pkt_fwd
PKG_VERSION:=1.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/tftelkamp/single_chan_pkt_fwd.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=a29921789bc5b63d6a7c51e46dd6314aca06b99e
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_MAINTAINER:=Xue Liu <liuxuenetmail@gmail.com>

include $(INCLUDE_DIR)/package.mk

define Package/single_chan_pkt_fwd
  SECTION:=net
  CATEGORY:=Network
  TITLE:=LoRa single channel packet forwarder
  URL:=https://github.com/tftelkamp/single_chan_pkt_fwd
  DEPENDS:=+libwiringpi +libstdcpp
endef

define Package/single_chan_pkt_fwd/description
	Single Channel LoRaWAN Packet Forwarder
endef

TARGET_CFLAGS += \
		-I$(STAGING_DIR)/usr/include \
		-c -Wall

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC="$(TARGET_CROSS)g++"
endef

define Package/single_chan_pkt_fwd/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/single_chan_pkt_fwd $(1)/usr/bin/
endef

$(eval $(call BuildPackage,single_chan_pkt_fwd))
