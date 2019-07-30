include $(TOPDIR)/rules.mk

PKG_NAME:=lora-app-server
PKG_VERSION:=3.2.0
PKG_RELEASE:=1

PKG_SOURCE_URL:=https://codeload.github.com/brocaar/lora-app-server/tar.gz/v$(PKG_VERSION)?
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz

PKG_HASH:=63eda8e95032e71692b3ccff239ea25a0ea28f493644ebe40bcd05fd2182b89d
PKG_MAINTAINER:=Xue Liu <liuxuenetmail@gmail.com>
PKG_LICENSE:MIT
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_DEPENDS:=golang/host
PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

GO_PKG:=github.com/brocaar/lora-app-server
GO_PKG_BUILD_PKG:=github.com/brocaar/lora-app-server/cmd/lora-app-server

include $(INCLUDE_DIR)/package.mk
# golang-package.mk should be relocate regarding the env
include $(INCLUDE_DIR)/../feeds/packages/lang/golang/golang-package.mk

define Package/lora-app-server
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=LoRaWAN
  TITLE:=LoRa App Server
  DEPENDS:=$(GO_ARCH_DEPENDS)
  PKGARCH:=all
endef

define Package/lora-app-server/description
  LoRa App Server is an open-source LoRaWAN application-server, part of the LoRa Server project.
  It is responsible for the node "inventory" part of a LoRaWAN infrastructure, handling of 
  received application payloads and the downlink application payload queue.
  It comes with a web-interface and API (RESTful JSON and gRPC) and supports authorization by
  using JWT tokens (optional). Received payloads are published over MQTT and payloads
  can be enqueued by using MQTT or the API.
endef

GO_PKG_LDFLAGS:=-s -w
GO_PKG_LDFLAGS_X:=main.version=$(PKG_VERSION)

define Build/Prepare
$(call Build/Prepare/Default)
	@echo "Installing UI requirements"
	@cd $(PKG_BUILD_DIR)/ui && npm install
	
	@echo "Building ui"
	@cd $(PKG_BUILD_DIR)/ui && npm run build
	@mv $(PKG_BUILD_DIR)/ui/build/* $(PKG_BUILD_DIR)/static

	@echo "Generating combined Swagger JSON"
	@GOOS="" GOARCH="" go run $(PKG_BUILD_DIR)/api/swagger/main.go $(PKG_BUILD_DIR)/api/swagger > $(PKG_BUILD_DIR)/static/swagger/api.swagger.json
	@cp $(PKG_BUILD_DIR)/api/swagger/*.json $(PKG_BUILD_DIR)/static/swagger

	@echo "Generating static files"
	@go generate $(PKG_BUILD_DIR)/internal/migrations/migrations.go
	@go generate $(PKG_BUILD_DIR)/internal/static/static.go
endef

define Package/lora-app-server/install
	$(call GoPackage/Package/Install/Bin,$(1))

	$(INSTALL_DIR) $(1)/etc/init.d/
	$(INSTALL_BIN) ./files/lora-app-server.init $(1)/etc/init.d/lora-app-server
endef

$(eval $(call GoBinPackage,lora-app-server))
$(eval $(call BuildPackage,lora-app-server))
