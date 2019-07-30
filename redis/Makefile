include $(TOPDIR)/rules.mk

PKG_NAME:=redis
PKG_VERSION:=5.0.5
PKG_RELEASE:=1

PKG_SOURCE_URL:=https://codeload.github.com/antirez/redis/tar.gz/$(PKG_VERSION)?
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz

PKG_HASH:=3313d5e09938dc6e16c6911efa4a24b1c494bacb5a917a8e7925ebd55e56be85
PKG_MAINTAINER:=Xue Liu <liuxuenetmail@gmail.com>
PKG_LICENSE:BSD-3
PKG_LICENSE_FILES:=COPYING

include $(INCLUDE_DIR)/package.mk

define Package/redis
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=LoRaWAN
  TITLE:=Redis server
endef

define Package/redis/description
  Redis server
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)/src \
		CC="$(TARGET_CC)" \
		CFLAGS="$(TARGET_CFLAGS)" \
		LDFLAGS="$(TARGET_LDFLAGS)" \
		MALLOC="libc"
endef

define Package/redis/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/redis-server $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/redis-cli $(1)/usr/sbin/
	
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/redis.conf $(1)/etc/
endef

$(eval $(call BuildPackage,redis))
