include $(TOPDIR)/rules.mk

PKG_NAME:=chirpstack-application-server
PKG_VERSION:=3.5.1
PKG_RELEASE:=1

PKG_SOURCE_URL:=https://codeload.github.com/brocaar/chirpstack-application-server/tar.gz/v$(PKG_VERSION)?
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz

PKG_HASH:=a775aaf0b773efe87b043942d9038a50c3dc96d1a91b2aa8def5487f0aa1c4a5
PKG_MAINTAINER:=Xue Liu <liuxuenetmail@gmail.com>
PKG_LICENSE:MIT
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_DEPENDS:=golang/host
PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

GO_PKG:=github.com/brocaar/chirpstack-application-server
GO_PKG_BUILD_PKG:=github.com/brocaar/chirpstack-application-server/cmd/chirpstack-application-server

include $(INCLUDE_DIR)/package.mk
# golang-package.mk should be relocate regarding the env
include $(INCLUDE_DIR)/../feeds/packages/lang/golang/golang-package.mk

define Package/chirpstack-application-server
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=LoRaWAN
  TITLE:=LoRa App Server
  DEPENDS:=$(GO_ARCH_DEPENDS)
  PKGARCH:=all
endef

define Package/chirpstack-application-server/description
  ChirpStack Application Server is an open-source LoRaWAN Application Server,
  part of the ChirpStack open-source LoRaWAN Network Server stack.
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

define Package/chirpstack-application-server/install
	$(call GoPackage/Package/Install/Bin,$(1))

	$(INSTALL_DIR) $(1)/etc/init.d/
	$(INSTALL_BIN) ./files/chirpstack-application-server.init $(1)/etc/init.d/chirpstack-application-server
endef

$(eval $(call GoBinPackage,chirpstack-application-server))
$(eval $(call BuildPackage,chirpstack-application-server))
