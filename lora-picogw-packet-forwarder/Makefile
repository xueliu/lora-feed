#
# Copyright (C) 2019 Xue Liu <liuxuenetmail@gmail>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=lora-picogw-packet-forwarder
PKG_VERSION:=0.1.0
PKG_RELEASE:=1

PKG_SOURCE_URL:=https://codeload.github.com/Lora-net/picoGW_packet_forwarder/tar.gz/V$(PKG_VERSION)?
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_HASH:=cc6f15be9b95e9b5c28dae97c96244cff651e303b3991b254ef4dcba3f59f562
PKG_MAINTAINER:=Xue Liu <liuxuenetmail@gmail.com>
PKG_LICENSE_FILES:=LICENSE
PKG_BUILD_DIR:=$(BUILD_DIR)/picoGW_packet_forwarder-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/lora-picogw-packet-forwarder
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=LoRaWAN
  TITLE:=Semtech packet-forwarder program
  DEPENDS:=+libpicogw
endef

define Package/lora-picogw-packet-forwarder/description
  A LoRa packet forwarder is a program running on the host of a LoRa
  Picocell (USB) gateway that forwards RF packets receive by the
  concentrator to a server through a IP/UDP link, and emits RF packets
  that are sent by the server.
endef

define Package/lora-picogw-packet-forwarder-utils
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=LoRaWAN
  TITLE:=Utilities for lora packet forwarder
  DEPENDS:=lora-picogw-packet-forwarder
endef

define Package/lora-picogw-packet-forwarder/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/lora_pkt_fwd/pico_pkt_fwd $(1)/usr/sbin
endef

define Package/lora-picogw-packet-forwarder-utils/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/util_ack $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/util_sink $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/util_tx_test $(1)/usr/sbin
endef

$(eval $(call BuildPackage,lora-picogw-packet-forwarder))
$(eval $(call BuildPackage,lora-picogw-packet-forwarder-utils))
