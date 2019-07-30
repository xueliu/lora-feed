#
# Copyright (C) 2019 Xue Liu <liuxuenetmail@gmail>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=lua-toml
PKG_VERSION:=2.0.0
PKG_RELEASE:=1

PKG_SOURCE_URL=https://codeload.github.com/jonstoler/lua-toml/tar.gz/v$(PKG_VERSION)?
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz

PKG_HASH:=723fc73f8ff25efa574dff3c1c41c94691ed09b92945f6c1d24ce58f2b908256
PKG_MAINTAINER:=Xue Liu <liuxuenetmail@gmail>
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk

define Package/lua-toml
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Lua
  TITLE:=TOML decoder/encoder for Lua
  URL:=https://github.com/jonstoler/lua-toml
  DEPENDS:=+lua
endef

define Package/lua-toml/description
	TOML decoder/encoder for Lua
endef

define Build/Compile
endef

define Package/lua-toml/install
	$(INSTALL_DIR) $(1)/usr/lib/lua
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/toml.lua $(1)/usr/lib/lua/
endef

$(eval $(call BuildPackage,lua-toml))
