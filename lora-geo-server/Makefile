include $(TOPDIR)/rules.mk

PKG_NAME:=lora-geo-server
PKG_VERSION:=3.0.0
PKG_RELEASE:=1

PKG_SOURCE_URL:=https://codeload.github.com/brocaar/lora-geo-server/tar.gz/v$(PKG_VERSION)?
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz

PKG_HASH:=121aa2d8587c8db3e2765365858821d0668d13507f184782e9f913d312e77130
PKG_MAINTAINER:=Xue Liu <liuxuenetmail@gmail.com>
PKG_LICENSE:MIT
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_DEPENDS:=golang/host
PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

GO_PKG:=github.com/brocaar/lora-geo-server
GO_PKG_BUILD_PKG:=github.com/brocaar/lora-geo-server/cmd/lora-geo-server

include $(INCLUDE_DIR)/package.mk
# golang-package.mk should be relocate regarding the env
include $(INCLUDE_DIR)/../feeds/packages/lang/golang/golang-package.mk

define Package/lora-geo-server
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=LoRaWAN
  TITLE:=LoRa Geo Server
  DEPENDS:=$(GO_ARCH_DEPENDS)
  PKGARCH:=all
endef

define Package/lora-geo-server/description
  LoRa Geo Server provides a geolocation server for geolocation of LoRaWAN devices.
  It is part of the LoRa Server project.
endef

GO_PKG_LDFLAGS:=-s -w
GO_PKG_LDFLAGS_X:=main.version=$(PKG_VERSION)

define Package/lora-geo-server/install
	$(call GoPackage/Package/Install/Bin,$(1))

	$(INSTALL_DIR) $(1)/etc/init.d/
	$(INSTALL_BIN) ./files/lora-geo-server.init $(1)/etc/init.d/lora-geo-server
endef

$(eval $(call GoBinPackage,lora-geo-server))
$(eval $(call BuildPackage,lora-geo-server))
