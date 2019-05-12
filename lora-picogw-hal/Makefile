#
# Copyright (C) 2019 Xue Liu <liuxuenetmail@gmail>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=lora-picogw-hal
PKG_VERSION:=0.2.2
PKG_RELEASE:=1

PKG_SOURCE_URL:=https://codeload.github.com/Lora-net/picoGW_hal/tar.gz/V$(PKG_VERSION)?
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_HASH:=4841940f621342ba55767f79b738669417a7e572d7143d94e2b512ae8c45d05f
PKG_MAINTAINER:=Xue Liu <liuxuenetmail@gmail.com>
PKG_LICENSE_FILES:=LICENSE
PKG_BUILD_DIR:=$(BUILD_DIR)/picoGW_hal-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/lora-picogw-hal
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Driver/HAL library for Semtech SX1308 Picocell Gateway
  URL:=https://www.semtech.com/products/wireless-rf/lora-gateways/sx1308
  DEPENDS:=+kmod-usb-acm @(!PACKAGE_lora-gateway-hal)
endef

define Package/lora-picogw-hal/description
  Host driver/HAL to build a LoRa Picocell Gateway which communicates 
  through USB with a concentrator board based on Semtech SX1308 
  multi-channel modem and SX1257/SX1255 RF transceivers.
endef

define Package/lora-picogw-hal-tests
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=LoRaWAN
  TITLE:=Test programs for libloragw to check functionality
  DEPENDS:=+lora-picogw-hal
endef

define Package/lora-picogw-hal-utils
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=LoRaWAN
  TITLE:=Utility programs for libloragw
  DEPENDS:=+lora-picogw-hal
endef

CMAKE_OPTIONS += \
		-Dpicogw_hal_build_shared_libs=ON

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/libloragw
	$(CP) $(PKG_BUILD_DIR)/libloragw/inc/loragw_* $(1)/usr/include/libloragw
	$(CP) $(PKG_BUILD_DIR)/libloragw/config.h $(1)/usr/include/libloragw
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/libloragw/libloragw.so* $(1)/usr/lib/
	$(LN) libloragw.so.0 $(1)/usr/lib/libloragw.so
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_BUILD_DIR)/loragw.pc  $(1)/usr/lib/pkgconfig/
endef

define Package/lora-picogw-hal/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/libloragw/libloragw.so.* $(1)/usr/lib/
endef

define Package/lora-picogw-hal-tests/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/libloragw/test* $(1)/usr/sbin
endef

define Package/lora-picogw-hal-utils/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/util_boot $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/util_chip_id $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/util_com_stress $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/util_pkt_logger $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/util_tx_continuous $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/util_tx_test $(1)/usr/sbin
endef

$(eval $(call BuildPackage,lora-picogw-hal))
$(eval $(call BuildPackage,lora-picogw-hal-tests))
$(eval $(call BuildPackage,lora-picogw-hal-utils))
