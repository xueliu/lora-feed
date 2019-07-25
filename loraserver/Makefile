include $(TOPDIR)/rules.mk

PKG_NAME:=loraserver
PKG_VERSION:=3.0.2
PKG_RELEASE:=1

PKG_SOURCE_URL:=https://codeload.github.com/brocaar/loraserver/tar.gz/v$(PKG_VERSION)?
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz

PKG_HASH:=32d04dffa85a3114ee77d61f9f532fd72c6195368a03a6f115db75d8f01c83f8
PKG_MAINTAINER:=Xue Liu <liuxuenetmail@gmail.com>
PKG_LICENSE:MIT
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_DEPENDS:=golang/host
PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

GO_PKG:=github.com/brocaar/loraserver
GO_PKG_BUILD_PKG:=github.com/brocaar/loraserver/cmd/loraserver

include $(INCLUDE_DIR)/package.mk
# golang-package.mk should be relocate regarding the env
include $(INCLUDE_DIR)/../feeds/packages/lang/golang/golang-package.mk

define Package/loraserver
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=LoRaWAN
  TITLE:=LoRa Server
  DEPENDS:=$(GO_ARCH_DEPENDS)
  PKGARCH:=all
endef

define Package/loraserver/description
  LoRa Server is an open-source LoRaWAN network-server, part of the LoRa Server project.
  It is responsible for handling (and de-duplication) of uplink data received by the gateway(s)
  and the scheduling of downlink data transmissions.
endef

define Build/Prepare
$(call Build/Prepare/Default)
	# statics
	go generate $(PKG_BUILD_DIR)/internal/migrations/migrations.go	
endef

define Package/loraserver/install
	$(call GoPackage/Package/Install/Bin,$(1))

	$(INSTALL_DIR) $(1)/etc/init.d/
	$(INSTALL_BIN) ./files/loraserver.init $(1)/etc/init.d/loraserver
endef

$(eval $(call GoBinPackage,loraserver))
$(eval $(call BuildPackage,loraserver))
