#
# Copyright (C) 2017 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=packet-forwarder
PKG_VERSION:=3.1.0
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/packet_forwarder-$(PKG_VERSION)
PKG_SOURCE:=v$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/Lora-net/packet_forwarder/archive/
PKG_MD5SUM:=774873913ebd097972bf1a6963564d48

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk

define Package/packet-forwarder/Default
  TITLE:=Semtech packet-forwarder program
  URL:=http://www.semtech.com/wireless-rf/lora.html
endef

define Package/packet-forwarder
$(call Package/packet-forwarder/Default)
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+lora-gateway
endef

define Package/packet-forwarder/description
  A LoRa packet forwarder is a program running on the host of a LoRa gateway
  that forwards RF packets receive by the concentrator to a server through a
  IP/UDP link, and emits RF packets that are sent by the server.
endef

CFLAGS += $(FPIC) -O2 -Wall -Wextra -std=c99 -Iinc -I. -lm

define Build/Compile
	$(MAKE) CROSS_COMPILE=$(REAL_GNU_TARGET_NAME)- LGW_PATH=$(BUILD_DIR)/lora_gateway-4.1.3/libloragw -C $(PKG_BUILD_DIR)
endef

define Package/packet-forwarder/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/lora_pkt_fwd/lora_pkt_fwd $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/util_ack/util_ack $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/util_sink/util_sink $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/util_tx_test/util_tx_test $(1)/usr/bin
endef

$(eval $(call BuildPackage,packet-forwarder))
