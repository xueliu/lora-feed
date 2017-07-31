#
# Copyright (C) 2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=lora-gateway
PKG_VERSION:=5.0.1
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/lora_gateway-$(PKG_VERSION)
PKG_SOURCE:=v$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/Lora-net/lora_gateway/archive/
PKG_MD5SUM:=5d07f8471e1a67920787e3879afe0cb6

include $(INCLUDE_DIR)/package.mk

define Package/libloragw/Default
  TITLE:=Semtech lora-gateway package
  URL:=http://www.semtech.com/wireless-rf/lora.html
endef

define Package/libloragw
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Driver/HAL library for Semtech SX1301
  URL:=http://www.semtech.com/wireless-rf/lora.html
  MENU:=1
endef

define Package/libloragw/description
  Driver/HAL library for Semtech SX1301 multi-channel modem and SX1257/SX1255 RF transceivers.
endef

define Package/libloragw/config
	source "$(SOURCE)/Config.in"
endef

define Package/lora-gateway-tests
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=LoRaWAN
  TITLE:=Test programs for libloragw
  DEPENDS:=+libloragw
endef

define Package/lora-gateway-utils
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=LoRaWAN
  TITLE:=Utilities for libloragw
  DEPENDS:=+libloragw
endef

TARGET_CFLAGS += $(FPIC) -O2 -Wall -Wextra -std=c99 -Iinc -I. -lm -DSPI_DEV_PATH=\\\"\"$(CONFIG_SX1301_SPI_PATH)\\\"\"

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/libloragw
	$(CP) $(PKG_BUILD_DIR)/libloragw/inc/* $(1)/usr/include/libloragw
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/libloragw/libloragw.a $(1)/usr/lib/
endef

define Package/libloragw/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/libloragw/libloragw.a $(1)/usr/lib/
endef

define Package/lora-gateway-tests/install
	$(INSTALL_DIR) $(1)/root/lora_gateway
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/libloragw/test* $(1)/root/lora_gateway
endef

define Package/lora-gateway-utils/install
	$(INSTALL_DIR) $(1)/root/lora_gateway
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/util_pkt_logger/util_pkt_logger $(1)/root/lora_gateway
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/util_tx_continuous/util_tx_continuous $(1)/root/lora_gateway
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/util_spi_stress/util_spi_stress $(1)/root/lora_gateway
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/util_tx_test/util_tx_test $(1)/root/lora_gateway
endef

$(eval $(call BuildPackage,libloragw))
$(eval $(call BuildPackage,lora-gateway-tests))
$(eval $(call BuildPackage,lora-gateway-utils))
