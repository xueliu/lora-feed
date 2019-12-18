include $(TOPDIR)/rules.mk

PKG_NAME:=chirpstack-geolocation-server
PKG_VERSION:=3.3.1
PKG_RELEASE:=1

PKG_SOURCE_URL:=https://codeload.github.com/brocaar/chirpstack-geolocation-server/tar.gz/v$(PKG_VERSION)?
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz

PKG_HASH:=d8dee3455b748a1944624327311eedd3d7fd9f8915ecd0a148fa0a3f7cff3c1e
PKG_MAINTAINER:=Xue Liu <liuxuenetmail@gmail.com>
PKG_LICENSE:MIT
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_DEPENDS:=golang/host
PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

GO_PKG:=github.com/brocaar/chirpstack-geolocation-server
GO_PKG_BUILD_PKG:=github.com/brocaar/chirpstack-geolocation-server/cmd/chirpstack-geolocation-server

include $(INCLUDE_DIR)/package.mk
# golang-package.mk should be relocate regarding the env
include $(INCLUDE_DIR)/../feeds/packages/lang/golang/golang-package.mk

define Package/chirpstack-geolocation-server
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=LoRaWAN
  TITLE:=ChirpStack Geolocation Server 
  DEPENDS:=$(GO_ARCH_DEPENDS)
  PKGARCH:=all
endef

define Package/chirpstack-geolocation-server/description
  ChirpStack Geolocation Server provides a geolocation server for geolocation of LoRaWAN devices.
  It is part of the ChirpStack open-source LoRaWAN Network Server stack..
endef

GO_PKG_LDFLAGS:=-s -w
GO_PKG_LDFLAGS_X:=main.version=$(PKG_VERSION)

define Package/chirpstack-geolocation-server/install
	$(call GoPackage/Package/Install/Bin,$(1))

	$(INSTALL_DIR) $(1)/etc/init.d/
	$(INSTALL_BIN) ./files/chirpstack-geolocation-server.init $(1)/etc/init.d/chirpstack-geolocation-server
endef

$(eval $(call GoBinPackage,chirpstack-geolocation-server))
$(eval $(call BuildPackage,chirpstack-geolocation-server))
