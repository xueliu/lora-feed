include $(TOPDIR)/rules.mk

PKG_NAME:=lora-gateway-bridge
PKG_VERSION:=3.1.0
PKG_RELEASE:=1

PKG_SOURCE_URL:=https://codeload.github.com/brocaar/lora-gateway-bridge/tar.gz/v$(PKG_VERSION)?
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_HASH:=ba8684b63a3e4bac62b87dce0dd2b2c258657650d7409a301490aa1973f6dd79
PKG_MAINTAINER:=Xue Liu <liuxuenetmail@gmail.com>
PKG_LICENSE_FILES:=LICENSE
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk


define Package/lora-gateway-bridge
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=LoRaWAN
  TITLE:=LoRa Gateway Bridge
  DEPENDS:=+golang +mosquitto-ssl
endef

define Package/lora-gateway-bridge/description
  LoRa Gateway Bridge is a service which converts LoRa packet-forwarder 
  protocols into a LoRa Server common protocol (JSON and Protobuf).
  This project is part of the LoRa Server project.
endef

define Build/Compile
	env GOARCH=$(ARCH) GOOS=linux make -C $(PKG_BUILD_DIR) build
endef

define Package/lora-gateway-bridge/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/$(PKG_NAME) $(1)/usr/sbin
endef

$(eval $(call BuildPackage,lora-gateway-bridge))