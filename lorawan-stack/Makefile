include $(TOPDIR)/rules.mk

PKG_NAME:=lorawan-stack
PKG_VERSION:=3.9.0
PKG_RELEASE:=1

PKG_SOURCE_URL:=https://codeload.github.com/TheThingsNetwork/lorawan-stack/tar.gz/v$(PKG_VERSION)?

#PKG_SOURCE_PROTO:=git
#PKG_SOURCE_VERSION:=HEAD # dev for dev branch, HEAD for master
#PKG_SOURCE_URL:=https://github.com/TheThingsNetwork/lorawan-stack
#PKG_SOURCE_SUBDIR:=$(PKG_NAME)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_HASH:=1b8e3c6eca7f838418c8c98cfc538ad42527c419c57aa05d66be7d442fea687b
PKG_MAINTAINER:=Xue Liu <liuxuenetmail@gmail.com>
PKG_LICENSE:MIT
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_DEPENDS:=golang/host
PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

GO_PKG:=github.com/TheThingsNetwork/lorawan-stack
GO_PKG_BUILD_PKG:=github.com/TheThingsNetwork/lorawan-stack/cmd/ttn-lw-cli

include $(INCLUDE_DIR)/package.mk
# golang-package.mk should be relocate regarding the env
include $(INCLUDE_DIR)/../feeds/packages/lang/golang/golang-package.mk

define Package/lorawan-stack
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=LoRaWAN
  TITLE:=The Things Stack
  DEPENDS:=$(GO_ARCH_DEPENDS)
  PKGARCH:=all
endef

define Package/lorawan-stack/description
  The Things Stack for LoRaWAN is an open source LoRaWAN network stack suitable for large,
  global and geo-distributed public and private networks as well as smaller networks.
  The architecture follows the LoRaWAN Network Reference Model for standards compliancy
  and interoperability.
endef

GO_PKG_LDFLAGS:=-s -w
GO_PKG_LDFLAGS_X:=main.version=$(PKG_VERSION)

define GoPackage/Build/Compile
	@echo "make init"
	@make init -C $(PKG_BUILD_DIR)
	( \
		cd $(PKG_BUILD_DIR) \
		&& echo "build front-end" \
		&& ./tools/bin/mage js:build \
	)
	( \
		export GOPATH=$(GO_PKG_BUILD_DIR) \
			GOCACHE=$(GO_PKG_CACHE_DIR) \
			GOTMPDIR=$(GO_PKG_TMP_DIR) \
			GOROOT_FINAL=$(GO_TARGET_ROOT) \
			CC=$(TARGET_CC) \
			CXX=$(TARGET_CXX) \
			$(call GoPackage/Environment) \
		\
		&& cd $(PKG_BUILD_DIR) \
		&& echo "Compiling CLI..." \
		&& go build ./cmd/ttn-lw-cli \
		&& echo "Compiling Stack..." \
		&& go build ./cmd/ttn-lw-stack \
	)
endef

define Package/lorawan-stack/install
	$(call GoPackage/Package/Install/Bin,$(1))
endef

$(eval $(call GoBinPackage,lorawan-stack))
$(eval $(call BuildPackage,lorawan-stack))
