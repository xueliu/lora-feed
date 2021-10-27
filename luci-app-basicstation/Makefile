#
# Copyright (C) 2019 Xue Liu <liuxuenetmail@gmail.com>
#
# This is free software, licensed under the GNU General Public License v2.

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-basicstation
PKG_VERSION:=1.0
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-basicstation
	SECTION:=luci
	CATEGORY:=LuCI
	SUBMENU:=3. Applications
	TITLE:=Semtech Basicstation Configuration Interface
	PKGARCH:=all
	DEPENDS:=+basicstation +luci-compat
endef

define Build/Compile
endef

define Package/luci-app-basicstation/install
	$(INSTALL_DIR) $(1)/
	$(CP) ./files/* $(1)/
endef

$(eval $(call BuildPackage,luci-app-basicstation))
