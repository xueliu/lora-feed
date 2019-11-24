include $(TOPDIR)/rules.mk

PKG_NAME:=chirpstack-gateway-bridge
PKG_VERSION:=3.4.1
PKG_RELEASE:=1

PKG_SOURCE_URL:=https://codeload.github.com/brocaar/chirpstack-gateway-bridge/tar.gz/v$(PKG_VERSION)?
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz

PKG_HASH:=8ae9e34c55ea776a780cb24f748c9eff0a1bc3dc522e25e89142ea554aacaca8
PKG_MAINTAINER:=Xue Liu <liuxuenetmail@gmail.com>
PKG_LICENSE:MIT
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_DEPENDS:=golang/host
PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

GO_PKG:=github.com/brocaar/chirpstack-gateway-bridge
GO_PKG_BUILD_PKG:=github.com/brocaar/chirpstack-gateway-bridge/cmd/chirpstack-gateway-bridge

include $(INCLUDE_DIR)/package.mk
# golang-package.mk should be relocate regarding the env
include $(INCLUDE_DIR)/../feeds/packages/lang/golang/golang-package.mk

define Package/chirpstack-gateway-bridge
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=LoRaWAN
  TITLE:=Chirpstack Gateway Bridge
  DEPENDS:=$(GO_ARCH_DEPENDS) +mosquitto-ssl
  PKGARCH:=all
endef

define Package/chirpstack-gateway-bridge/description
  ChirpStack Gateway Bridge is a service which converts LoRa packet-forwarder 
  protocols into a ChirpStack Network Server common protocol (JSON and Protobuf).
endef

GO_PKG_LDFLAGS:=-s -w
GO_PKG_LDFLAGS_X:=main.version=$(PKG_VERSION)

define Package/chirpstack-gateway-bridge/install
	$(call GoPackage/Package/Install/Bin,$(1))

	$(INSTALL_DIR) $(1)/etc/init.d/
	$(INSTALL_BIN) ./files/chirpstack-gateway-bridge.init $(1)/etc/init.d/chirpstack-gateway-bridge

	$(INSTALL_DIR) $(1)/etc/chirpstack-gateway-bridge
	$(INSTALL_DATA) ./files/chirpstack-gateway-bridge.toml $(1)/etc/chirpstack-gateway-bridge/
endef

$(eval $(call GoBinPackage,chirpstack-gateway-bridge))
$(eval $(call BuildPackage,chirpstack-gateway-bridge))
