include $(TOPDIR)/rules.mk

PKG_NAME:=chirpstack-network-server
PKG_VERSION:=3.4.1
PKG_RELEASE:=1

PKG_SOURCE_URL:=https://codeload.github.com/brocaar/chirpstack-network-server/tar.gz/v$(PKG_VERSION)?
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz

PKG_HASH:=20e7c03c8f9b3bedde91e3b078b86b6cab2b470853374262e8ccbef012f78165
PKG_MAINTAINER:=Xue Liu <liuxuenetmail@gmail.com>
PKG_LICENSE:MIT
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_DEPENDS:=golang/host
PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

GO_PKG:=github.com/brocaar/chirpstack-network-server
GO_PKG_BUILD_PKG:=github.com/brocaar/chirpstack-network-server/cmd/chirpstack-network-server

include $(INCLUDE_DIR)/package.mk
# golang-package.mk should be relocate regarding the env
include $(INCLUDE_DIR)/../feeds/packages/lang/golang/golang-package.mk

define Package/chirpstack-network-server
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=LoRaWAN
  TITLE:=LoRa Server
  DEPENDS:=$(GO_ARCH_DEPENDS)
  PKGARCH:=all
endef

define Package/chirpstack-network-server/description
  ChirpStack Network Server is an open-source LoRaWAN network-server, part of ChirpStack.
  It is responsible for handling (and de-duplication) of uplink data received by the gateway(s) 
  and the scheduling of downlink data transmissions.
endef

GO_PKG_LDFLAGS:=-s -w
GO_PKG_LDFLAGS_X:=main.version=$(PKG_VERSION)

define Build/Prepare
$(call Build/Prepare/Default)
	# statics
	go generate $(PKG_BUILD_DIR)/internal/migrations/migrations.go	
endef

define Package/chirpstack-network-server/install
	$(call GoPackage/Package/Install/Bin,$(1))

	$(INSTALL_DIR) $(1)/etc/init.d/
	$(INSTALL_BIN) ./files/chirpstack-network-server.init $(1)/etc/init.d/chirpstack-network-server
endef

$(eval $(call GoBinPackage,chirpstack-network-server))
$(eval $(call BuildPackage,chirpstack-network-server))
